//
//  BrainsCell.swift
//  MindMazeMouse
//
//  Created by MindMazeMouse on 2024/12/25.
//

import UIKit

class MindMazeBrainsCell : UICollectionViewCell {
    @IBOutlet weak var brainImageVIew: UIImageView!
    private var currentImageName: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setImage(named: String) {
        // If empty string, just clear the image without animation
        if named.isEmpty {
            brainImageVIew.image = nil
            currentImageName = named
            return
        }
        
        // Only animate if this is a new non-empty image
        if named != currentImageName && !named.isEmpty {
            brainImageVIew.transform = CGAffineTransform(scaleX: 0, y: 0)
            brainImageVIew.image = UIImage(named: named)
            
            UIView.animate(withDuration: 0.5, 
                          delay: 0,
                          usingSpringWithDamping: 0.6,
                          initialSpringVelocity: 0.5) {
                self.brainImageVIew.transform = .identity
            }
        } else {
            // Just set the image without animation for existing items
            brainImageVIew.image = UIImage(named: named)
            brainImageVIew.transform = .identity
        }
        
        currentImageName = named
    }
}
