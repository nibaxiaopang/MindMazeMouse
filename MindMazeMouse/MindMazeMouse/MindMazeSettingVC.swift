//
//  SettingVC.swift
//  MindMazeMouse
//
//  Created by jin fu on 2024/12/25.
//


import UIKit

class MindMazeSettingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnBack(_ sender: Any) {
            navigationController?.popViewController(animated: true)
        }

}
