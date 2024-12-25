//
//  GameVCDelegate.swift
//  MindMazeMouse
//
//  Created by jin fu on 2024/12/25.
//


import UIKit

protocol MindMazeGameVCDelegate: AnyObject {
    func unlockNextLevel(_ level: Int)
}

