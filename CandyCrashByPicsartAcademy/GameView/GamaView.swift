//
//  GamaView.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import UIKit

final class GameView: UIView {
    private let topView: UIView = {
        let view = UIButton(type: .system)
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.backgroundColor = UIColor.cyan
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()
}

extension GameView {
    
    func setupUI() {
        self.backgroundColor = .magenta
    }
    
}
