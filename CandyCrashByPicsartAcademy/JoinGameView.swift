//
//  JoinGameView.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 02.10.23.
//

import UIKit

final class JoinGameView: UIView {    
    private let backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.frame = CGRect(x: 0, y: 0, width: 428, height: 926)
        backgroundImage.image = UIImage(named: "JoinBackgorund")
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
    
    let playButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Play", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 186, height: 56)
        button.layer.cornerRadius = 22
        button.titleLabel?.font = UIFont(name: "CherryBombOne-Regular", size: 24)
        button.titleLabel?.frame = CGRect(x: 0, y: 0, width: 74, height: 24)
        button.titleLabel?.textAlignment = .center
        button.layer.masksToBounds = true
        return button
    }()
    
    let playBeforeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Played before", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 236, height: 56)
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor(red: 0, green: 0.58, blue: 0.992, alpha: 1).cgColor
        button.titleLabel?.font = UIFont(name: "CherryBombOne-Regular", size: 22)
        button.titleLabel?.frame = CGRect(x: 0, y: 0, width: 74, height: 24)
        button.layer.masksToBounds = true
        return button
    }()
    
    var firstGradientLayer: CAGradientLayer! {
        didSet {
            firstGradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
            firstGradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
            firstGradientLayer.colors = [ UIColor.gradientFirst1().cgColor,
                                          UIColor.gradientFirst2().cgColor,
                                          UIColor.gradientFirst3().cgColor
            ]
            firstGradientLayer.locations = [0, 0.22, 1]
            firstGradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 0.99, c: -0.99, d: 0, tx: 0.99, ty: 0.08))
            firstGradientLayer.bounds = self.bounds.insetBy(dx: -0.5*self.bounds.size.width, dy: -0.5*self.bounds.size.height)
            firstGradientLayer.position = self.center
        }
    }
    
    var secondGradientLayer: CAGradientLayer! {
        didSet {
            secondGradientLayer.colors = [ UIColor.gradientSecond1().cgColor,
                                           UIColor.gradientSecond2().cgColor,
                                           UIColor.gradientSecond3().cgColor ]
            secondGradientLayer.locations = [0, 0.13, 1]
            secondGradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
            secondGradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
            secondGradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 0.89, c: -0.89, d: 0, tx: 0.95, ty: 0.11))
            secondGradientLayer.bounds = self.bounds.insetBy(dx: -0.5*self.bounds.size.width, dy: -0.5*self.bounds.size.height)
            secondGradientLayer.position = self.center
        }
    }

    func setupUI() {
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playBeforeButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backgroundImage)
        self.addSubview(playButton)
        self.addSubview(playBeforeButton)
        
        backgroundImage.frame = self.frame
        
        NSLayoutConstraint.activate([
            playButton.widthAnchor.constraint(equalToConstant: 186),
            playButton.heightAnchor.constraint(equalToConstant: 56),
            playButton.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor, constant: 0),
            playButton.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 489)
        ])
        
        NSLayoutConstraint.activate([
            playBeforeButton.widthAnchor.constraint(equalToConstant: 236),
            playBeforeButton.heightAnchor.constraint(equalToConstant: 56),
            playBeforeButton.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor, constant: 0),
            playBeforeButton.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 551),
        ])
    }
    
    func setupGradient() {
        self.firstGradientLayer = CAGradientLayer()
        self.playButton.layer.insertSublayer(firstGradientLayer, at: 0)
        
        self.secondGradientLayer = CAGradientLayer()
        self.playBeforeButton.layer.insertSublayer(secondGradientLayer, at: 0)
    }
}
