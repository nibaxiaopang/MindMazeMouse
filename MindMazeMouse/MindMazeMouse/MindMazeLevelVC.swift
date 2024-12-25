//
//  LevelVC.swift
//  MindMazeMouse
//
//  Created by MindMazeMouse on 2024/12/25.
//

import UIKit

class MindMazeLevelVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MindMazeGameVCDelegate {
    
    
    var levels: [Bool] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Load levels from UserDefaults or initialize default levels
        if let savedLevels = UserDefaults.standard.array(forKey: "levels") as? [Bool] {
            levels = savedLevels
        } else {
            levels = [true, false, false, false, false, false] // Default: Level 1 unlocked, others locked
            UserDefaults.standard.set(levels, forKey: "levels")
        }
        
        
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Deselect any selected row
                if let selectedIndexPaths = collectionView.indexPathsForSelectedItems {
                    for indexPath in selectedIndexPaths {
                        collectionView.deselectItem(at: indexPath, animated: true)
                    }
                }
                
                collectionView.reloadData()
    }
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return levels.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelCell", for: indexPath) as! MindMazeLevelCell
            cell.levelLabel.text = "\(indexPath.row + 1)"
            
            // Update the appearance based on whether the level is locked or unlocked
            if levels[indexPath.row] {
                cell.bgView.alpha = 1.0 // Unlocked
                cell.levelLabel.textColor = .black
            } else {
                cell.bgView.alpha = 0.5 // Locked
                cell.levelLabel.textColor = .gray
            }
            
            return cell
        }

        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if levels[indexPath.row] {
                let vc = storyboard?.instantiateViewController(withIdentifier: "BrainTickVC") as! MindMazeBrainTickVC
                vc.currentLevelIndex = indexPath.row
                vc.delegate = self
                navigationController?.pushViewController(vc, animated: true)
            } else {
                // Show an alert if the user tries to access a locked level
                let alert = UIAlertController(title: "Level Locked", message: "Complete the previous levels to unlock this one.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width / 3 - 5, height: collectionView.frame.height / 2 - 5)
        }

    func unlockNextLevel(_ level: Int) {
        if level < levels.count && !levels[level] {
            levels[level] = true
            UserDefaults.standard.set(levels, forKey: "levels")
            collectionView.reloadData() // Update table view to reflect unlocked levels
        }
    }



}
