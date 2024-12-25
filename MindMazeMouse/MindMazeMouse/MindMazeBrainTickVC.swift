//
//  BrainTickVC.swift
//  MindMazeMouse
//
//  Created by jin fu on 2024/12/25.
//


import UIKit

class MindMazeBrainTickVC: UIViewController {
    
    
    var gameLevel = levels
    var currentLevelIndex = 0
    var currentQuestionIndex = 0
    
    
    @IBOutlet weak var gameView: UIView!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var trickQuestionLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var tipsLabel: UILabel!
    
    @IBOutlet weak var btnTipsGuide: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    var emptyImage:[String] = Array(repeating: "", count: 10)
    
    let soundEffect = MindMazeSoundEffect()
    
    private var isTextAnimating = false
    
    
    private var hintTimer: Timer?
    private let hintDelay: TimeInterval = 10.0
    
    var currentLevel: Int = 0
    var completionHandler: ((Bool) -> Void)?
    
    var currentLevelQuestions: [MindMazeQuestion] = []
    weak var delegate: MindMazeGameVCDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        displayAllImagesForLevel()
        
        messageView.isHidden = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
        
    }
    
    
    @IBAction func btnBackTapped(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnTipsGuideTapped(_ sender: Any) {
        // Toggle the messageView visibility
        messageView.isHidden = !messageView.isHidden
    }
    
    
       func displayAllImagesForLevel() {
           
           guard currentLevelIndex < gameLevel.count else { return }
           let currentLevel = gameLevel[currentLevelIndex]
           
           levelLabel.text = "Level \(currentLevel.levelNumber)"
           
           guard currentQuestionIndex < currentLevel.questions.count else { return }
           let currentQuestion = currentLevel.questions[currentQuestionIndex]
           
           // Replace direct text assignment with animated text
           animateText(text: "Tricky Question: \(currentQuestion.questionText)")
           
           // Add this line to show the scenario in the tips label
           tipsLabel.text = currentQuestion.scenario
           
           gameView.subviews.forEach { $0.removeFromSuperview() }
           
           let imageSize: CGFloat = 25
           let numberOfImages = currentLevel.questions.count
           
           // Keep track of used positions
           var usedPositions: [(CGFloat, CGFloat)] = []
           
           for (index, question) in currentLevel.questions.enumerated() {
               var randomX: CGFloat
               var randomY: CGFloat
               var attempts = 0
               let maxAttempts = 50  // Prevent infinite loop
               
               repeat {
                   let maxX = Int(gameView.frame.width - imageSize)
                   let maxY = Int(gameView.frame.height - imageSize)
                   
                   randomX = CGFloat(Int.random(in: 0...maxX))
                   randomY = CGFloat(Int.random(in: 0...maxY))
                   
                   // Check if this position overlaps with any existing images
                   let isOverlapping = usedPositions.contains { existingPos in
                       let dx = abs(existingPos.0 - randomX)
                       let dy = abs(existingPos.1 - randomY)
                       return dx < imageSize && dy < imageSize
                   }
                   
                   attempts += 1
                   
                   if !isOverlapping || attempts >= maxAttempts {
                       break
                   }
               } while true
               
               // Store the used position
               usedPositions.append((randomX, randomY))
               
               // Create image view
               let imageView = UIImageView(frame: CGRect(
                   x: randomX,
                   y: randomY,
                   width: imageSize,
                   height: imageSize
               ))
               imageView.image = UIImage(named: question.answer) // Image name matches the answer
               imageView.contentMode = .scaleAspectFit
               imageView.isUserInteractionEnabled = true
               imageView.tag = index // Set a tag to identify which image was tapped
               
               // Add tap gesture to the image
               let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
               imageView.addGestureRecognizer(tapGesture)
               
               // Add the image view to the game view
               gameView.addSubview(imageView)
           }
           
           // Reset and start the hint timer
           resetHintTimer()
       }
       
       private func resetHintTimer() {
           hintTimer?.invalidate()
           hintTimer = Timer.scheduledTimer(withTimeInterval: hintDelay, repeats: false) { [weak self] _ in
               self?.animateHint()
           }
       }
       
       private func animateHint() {
           // Animate game view images
           for view in gameView.subviews {
               guard let imageView = view as? UIImageView else { continue }
               
               UIView.animate(withDuration: 0.5,
                             delay: 0,
                             usingSpringWithDamping: 0.5,
                             initialSpringVelocity: 0.5,
                             options: [.repeat, .autoreverse, .allowUserInteraction],
                             animations: {
                   imageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
               }) { _ in
                   imageView.transform = .identity
               }
           }
           
           // Animate tips guide button
           UIView.animate(withDuration: 0.5,
                         delay: 0,
                         usingSpringWithDamping: 0.5,
                         initialSpringVelocity: 0.5,
                         options: [.repeat, .autoreverse, .allowUserInteraction],
                         animations: {
               self.btnTipsGuide.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
           }) { _ in
               self.btnTipsGuide.transform = .identity
           }
       }
       
       @objc func imageTapped(_ sender: UITapGestureRecognizer) {
           
           resetHintTimer()
           
           // Ignore taps while text is animating
           guard !isTextAnimating else { return }
           
           // Get the tapped image's tag
           guard let tappedImageView = sender.view else { return }
           let tappedIndex = tappedImageView.tag
           
           // Validate the tapped image
           guard currentLevelIndex < gameLevel.count else { return }
           let currentLevel = gameLevel[currentLevelIndex]
           
           guard currentQuestionIndex < currentLevel.questions.count else { return }
           let currentQuestion = currentLevel.questions[currentQuestionIndex]
           let tappedQuestion = currentLevel.questions[tappedIndex]
           
           if tappedQuestion.answer == currentQuestion.answer {
               // Find the first empty position in the array
               if let emptyIndex = emptyImage.firstIndex(of: "") {
                   emptyImage[emptyIndex] = tappedQuestion.answer
                   print("Correct! The answer is \(tappedQuestion.answer)")
                   soundEffect.useSounds(soundName: "correct")
                   print(emptyImage)
                   collectionView.reloadData()
                   nextQuestion()
               }
           } else {
               print("Incorrect! Try again.")
               soundEffect.useSounds(soundName: "incorrect")
               resultLabel.text = "Incorrect! Try again."
           }
       }
       
       func nextQuestion() {
           // Reset animations when moving to next question
           gameView.subviews.forEach { view in
               view.layer.removeAllAnimations()
           }
           
           currentQuestionIndex += 1
           
           guard currentLevelIndex < gameLevel.count else { return }
           let currentLevel = gameLevel[currentLevelIndex]
           
           if currentQuestionIndex >= currentLevel.questions.count {
               DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                   self.nextLevel()
                   self.currentQuestionIndex = 0
                   self.currentLevelIndex += 1
                   self.emptyImage = Array(repeating: "", count: 10)
                   self.collectionView.reloadData()
                  
                   if self.currentLevelIndex >= self.gameLevel.count {
                       print("Congratulations! You've completed all levels!")
                       self.resultLabel.text = "Congratulations! You've completed all levels!"
                       return
                   }
                   
                  
                   self.displayAllImagesForLevel()
               }
           } else {
               displayAllImagesForLevel()
           }
       }
       
       // Add this new function for text animation
       private func animateText(text: String) {
           isTextAnimating = true
           var charIndex = 0.0
           trickQuestionLabel.text = ""
           
           for (index, char) in text.enumerated() {
               DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 * charIndex) {
                   self.trickQuestionLabel.text?.append(char)
                   self.resultLabel.text = "Waiting for the Answer..."
                   // Check if this is the last character
                   if index == text.count - 1 {
                       self.isTextAnimating = false
                   }
               }
               charIndex += 1
           }
       }
       
      
    
    
    
    private func nextLevel() {
        
        let nextLevel = currentLevel + 1
        delegate?.unlockNextLevel(nextLevel)

        let alert = UIAlertController(title: "Congratulations!", message: "You've advanced to Level \(nextLevel + 1)!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            
        }))
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
}


extension MindMazeBrainTickVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        emptyImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrainsCell", for: indexPath) as! MindMazeBrainsCell
        
        cell.setImage(named: emptyImage[indexPath.row])
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3 - 5, height: collectionView.frame.height / 4 - 5)
    }
    
    
    
    
}

