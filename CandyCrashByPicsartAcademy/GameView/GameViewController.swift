//
//  GameViewController.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import UIKit

final class GameViewController: UIViewController {
    private let gameView = GameView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func setupUI() {
        view.addSubview(gameView)
        gameView.frame = view.frame
        
        gameView.setupUI()
    }
}
