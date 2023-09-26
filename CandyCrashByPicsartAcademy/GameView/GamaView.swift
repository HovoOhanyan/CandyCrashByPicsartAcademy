//
//  GamaView.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import UIKit

final class GameView: UIView {
    
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "GameBackground")
        return imageView
    }()
    
    private let topView: UIView = {
        let view = UIButton(type: .system)
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.backgroundColor = UIColor.cyan
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()
}

//MARK: Setup UI
extension GameView {
    
    func setupUI() {
        self.backgroundColor = .white
        topView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backgroundImage)
        backgroundImage.addSubview(topView)
        backgroundImage.addSubview(settingsButton)
        
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            topView.heightAnchor.constraint(equalToConstant: 80),
            topView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            topView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            topView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            settingsButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            settingsButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 700),
            settingsButton.heightAnchor.constraint(equalToConstant: 50),
            settingsButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}

//MARK: Setup Gradient

extension GameView {
    
    func setupGradient() {
        self.gradientLayerTV = CAGradientLayer()
        self.topView.layer.insertSublayer(gradientLayerTV, at: 0)
        self.gradientLayerSB = CAGradientLayer()
        self.settingsButton.layer.insertSublayer(gradientLayerSB, at: 0)
    }
    
    override func layoutSubviews() {
        gradientLayerTV.frame = CGRect(x: 0, y: 0,
                                          width: self.topView.bounds.size.width,
                                          height: self.topView.bounds.size.height)
        gradientLayerSB.frame = CGRect(x: 0, y: 0,
                                     width: self.settingsButton.bounds.size.width,
                                     height: self.settingsButton.bounds.size.width)
    }
}
