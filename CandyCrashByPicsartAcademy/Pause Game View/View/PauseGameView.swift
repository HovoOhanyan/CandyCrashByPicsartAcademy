//
//  SettingsGameView.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Er Baghdasaryan on 12.10.23.
//

import UIKit

final class PauseGameView: UIView {
    
    let resumeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Resume", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 186, height: 56)
        button.layer.cornerRadius = 22
        button.titleLabel?.font = UIFont(name: "CherryBombOne-Regular", size: 24)
        button.titleLabel?.frame = CGRect(x: 0, y: 0, width: 74, height: 24)
        button.titleLabel?.textAlignment = .center
        button.layer.masksToBounds = true
        return button
    }()
    
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 186, height: 56)
        button.layer.cornerRadius = 22
        button.titleLabel?.font = UIFont(name: "CherryBombOne-Regular", size: 24)
        button.titleLabel?.frame = CGRect(x: 0, y: 0, width: 74, height: 24)
        button.titleLabel?.textAlignment = .center
        button.layer.masksToBounds = true
        return button
    }()
    
    let exitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Exit", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 186, height: 56)
        button.layer.cornerRadius = 22
        button.titleLabel?.font = UIFont(name: "CherryBombOne-Regular", size: 24)
        button.titleLabel?.frame = CGRect(x: 0, y: 0, width: 74, height: 24)
        button.titleLabel?.textAlignment = .center
        button.layer.masksToBounds = true
        return button
    }()
    
    var backgroundGradientLayer: CAGradientLayer! {
        didSet {
            backgroundGradientLayer.startPoint = CGPoint(x: 0.45, y: 0.5)
            backgroundGradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
            backgroundGradientLayer.colors = [ UIColor.gradientFirst1().cgColor,
                                               UIColor.gradientFirst2().cgColor,
                                               UIColor.gradientFirst3().cgColor ]
            backgroundGradientLayer.locations = [0, 0.52, 1]
            backgroundGradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 0.99, c: -0.99, d: 0, tx: 0.99, ty: 0.08))
            backgroundGradientLayer.bounds = self.bounds.insetBy(dx: -0.5*self.bounds.size.width, dy: -0.5*self.bounds.size.height)
            backgroundGradientLayer.position = self.center
        }
    }
    
    var resumeButtonGradientLayer: CAGradientLayer! {
        didSet {
            resumeButtonGradientLayer.colors = [ UIColor.gradientSecond1().cgColor,
                                                 UIColor.gradientSecond2().cgColor,
                                                 UIColor.gradientSecond3().cgColor ]
            resumeButtonGradientLayer.locations = [0, 0.13, 1]
            resumeButtonGradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
            resumeButtonGradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
            resumeButtonGradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 0.89, c: -0.89, d: 0, tx: 0.95, ty: 0.11))
            resumeButtonGradientLayer.bounds = self.bounds.insetBy(dx: -0.5*self.bounds.size.width, dy: -0.5*self.bounds.size.height)
            resumeButtonGradientLayer.position = self.center
        }
    }
    
    var startButtonGradientLayer: CAGradientLayer! {
        didSet {
            startButtonGradientLayer.colors = [ UIColor.gradientSecond1().cgColor,
                                                 UIColor.gradientSecond2().cgColor,
                                                 UIColor.gradientSecond3().cgColor ]
            startButtonGradientLayer.locations = [0, 0.13, 1]
            startButtonGradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
            startButtonGradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
            startButtonGradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 0.89, c: -0.89, d: 0, tx: 0.95, ty: 0.11))
            startButtonGradientLayer.bounds = self.bounds.insetBy(dx: -0.5*self.bounds.size.width, dy: -0.5*self.bounds.size.height)
            startButtonGradientLayer.position = self.center
        }
    }
    
    var exitButtonGradientLayer: CAGradientLayer! {
        didSet {
            exitButtonGradientLayer.colors = [ UIColor.gradientSecond1().cgColor,
                                                 UIColor.gradientSecond2().cgColor,
                                                 UIColor.gradientSecond3().cgColor ]
            exitButtonGradientLayer.locations = [0, 0.13, 1]
            exitButtonGradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
            exitButtonGradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
            exitButtonGradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 0.89, c: -0.89, d: 0, tx: 0.95, ty: 0.11))
            exitButtonGradientLayer.bounds = self.bounds.insetBy(dx: -0.5*self.bounds.size.width, dy: -0.5*self.bounds.size.height)
            exitButtonGradientLayer.position = self.center
        }
    }
    
    private let pausedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "CherryBombOne-Regular", size: 25)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .gradientSecond3()
        label.text = "Paused"
        return label
    }()
    
    func setupUI() {
        pausedLabel.translatesAutoresizingMaskIntoConstraints = false
        resumeButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(pausedLabel)
        self.addSubview(resumeButton)
        self.addSubview(startButton)
        self.addSubview(exitButton)
        
        NSLayoutConstraint.activate([
            pausedLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            pausedLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            pausedLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            resumeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            resumeButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -20),
            resumeButton.widthAnchor.constraint(equalToConstant: 186),
            resumeButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: resumeButton.bottomAnchor, constant: 10),
            startButton.leadingAnchor.constraint(equalTo: resumeButton.leadingAnchor),
            startButton.trailingAnchor.constraint(equalTo: resumeButton.trailingAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 186),
            startButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        NSLayoutConstraint.activate([
            exitButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 10),
            exitButton.leadingAnchor.constraint(equalTo: startButton.leadingAnchor),
            exitButton.trailingAnchor.constraint(equalTo: startButton.trailingAnchor),
            exitButton.widthAnchor.constraint(equalToConstant: 186),
            exitButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    func setupGradient() {
        self.backgroundGradientLayer = CAGradientLayer()
        self.layer.insertSublayer(backgroundGradientLayer, at: 0)
        
        self.resumeButtonGradientLayer = CAGradientLayer()
        self.resumeButton.layer.insertSublayer(resumeButtonGradientLayer, at: 0)
        
        self.startButtonGradientLayer = CAGradientLayer()
        self.startButton.layer.insertSublayer(startButtonGradientLayer, at: 0)
        
        self.exitButtonGradientLayer = CAGradientLayer()
        self.exitButton.layer.insertSublayer(exitButtonGradientLayer, at: 0)
    }
}

