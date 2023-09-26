//
//  ViewController.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 12.09.23.
//

import UIKit

class JoinGameViewController: UIViewController {
    
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
    
    private let playButton: UIButton = {
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
    
    private let playBeforeButton: UIButton = {
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
    
    private var firstGradientLayer: CAGradientLayer! {
        didSet {
            firstGradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
            firstGradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
            firstGradientLayer.colors = [ UIColor.gradientFirst1().cgColor,
                                          UIColor.gradientFirst2().cgColor,
                                          UIColor.gradientFirst3().cgColor
            ]
            firstGradientLayer.locations = [0, 0.22, 1]
            firstGradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 0.99, c: -0.99, d: 0, tx: 0.99, ty: 0.08))
            firstGradientLayer.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
            firstGradientLayer.position = view.center
        }
    }
    
    private var secondGradientLayer: CAGradientLayer! {
        didSet {
            secondGradientLayer.colors = [ UIColor.gradientSecond1().cgColor,
                                           UIColor.gradientSecond2().cgColor,
                                           UIColor.gradientSecond3().cgColor ]
            secondGradientLayer.locations = [0, 0.13, 1]
            secondGradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
            secondGradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
            secondGradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 0.89, c: -0.89, d: 0, tx: 0.95, ty: 0.11))
            secondGradientLayer.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
            secondGradientLayer.position = view.center
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupGradient()
    }
}

//MARK: Setup Constraints and Gradient
extension JoinGameViewController {
    
    private func setupUI() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playBeforeButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(backgroundImage)
        backgroundImage.addSubview(playButton)
        backgroundImage.addSubview(playBeforeButton)
        
        NSLayoutConstraint.activate([
            backgroundImage.widthAnchor.constraint(equalToConstant: 428),
            backgroundImage.heightAnchor.constraint(equalToConstant: 926),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        
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
    
    private func setupGradient() {
        self.firstGradientLayer = CAGradientLayer()
        self.playButton.layer.insertSublayer(firstGradientLayer, at: 0)
        
        self.secondGradientLayer = CAGradientLayer()
        self.playBeforeButton.layer.insertSublayer(secondGradientLayer, at: 0)
    }
    
    override func viewDidLayoutSubviews() {
        firstGradientLayer.frame = CGRect(x: 0, y: 0,
                                          width: self.playButton.bounds.size.width,
                                          height: self.playButton.bounds.size.height)
        
        secondGradientLayer.frame = CGRect(x: 0, y: 0,
                                           width: self.playBeforeButton.bounds.size.width,
                                           height: self.playBeforeButton.bounds.size.height)
    }
}
