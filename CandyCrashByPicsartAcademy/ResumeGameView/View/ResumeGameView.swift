//
//  ResumeGameView.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Er Baghdasaryan on 10.10.23.
//

import UIKit

final class ResumeGameView: UIView {
    
    private let backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.frame = CGRect(x: 0, y: 0, width: 428, height: 926)
        backgroundImage.image = UIImage(named: "ResumeBackground")
        let layer0 = CALayer()
        layer0.contents = backgroundImage.image
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1.3, b: 0, c: 0, d: 1, tx: -0.15, ty: 0))
        layer0.bounds = backgroundImage.bounds
        layer0.position = backgroundImage.center
        let layer1 = CALayer()
        layer1.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        layer1.bounds = backgroundImage.bounds
        layer1.position = backgroundImage.center
        backgroundImage.layer.addSublayer(layer0)
        backgroundImage.layer.addSublayer(layer1)
        return backgroundImage
    }()
    
    let resumeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next level", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 186, height: 56)
        button.layer.cornerRadius = 22
        button.titleLabel?.font = UIFont(name: "CherryBombOne-Regular", size: 20)
        button.titleLabel?.frame = CGRect(x: 0, y: 0, width: 74, height: 24)
        button.titleLabel?.textAlignment = .center
        button.layer.masksToBounds = true
        return button
    }()
    
    var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
            gradientLayer.colors = [ UIColor.gradientSecond1().cgColor,
                                          UIColor.gradientSecond2().cgColor,
                                          UIColor.gradientSecond3().cgColor
            ]
            gradientLayer.locations = [0, 0.22, 1]
            gradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 0.99, c: -0.99, d: 0, tx: 0.99, ty: 0.08))
            gradientLayer.bounds = self.bounds.insetBy(dx: -0.5*self.bounds.size.width, dy: -0.5*self.bounds.size.height)
            gradientLayer.position = self.center
        }
    }
    
    private let failedGameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "CherryBombOne-Regular", size: 25)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Congratulations! You won this level"
        return label
    }()
    
    func setupUI() {
        resumeButton.translatesAutoresizingMaskIntoConstraints = false
        failedGameLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.frame = self.frame
        
        self.addSubview(backgroundImage)
        self.addSubview(resumeButton)
        self.addSubview(failedGameLabel)
        
        NSLayoutConstraint.activate([
            failedGameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 300),
            failedGameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            failedGameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            resumeButton.widthAnchor.constraint(equalToConstant: 186),
            resumeButton.heightAnchor.constraint(equalToConstant: 56),
            resumeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            resumeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 439)
        ])
    }
    
    func setupGradient() {
        self.gradientLayer = CAGradientLayer()
        self.resumeButton.layer.insertSublayer(gradientLayer, at: 0)
    }
}

