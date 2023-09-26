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
        let view = UIView()
        view.layer.cornerRadius = 25
        view.layer.masksToBounds = true
        return view
    }()
    
    private let candysView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.layer.masksToBounds = true
        return view
    }()
    
    private let candyImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Candy1")
        return image
    }()
    
    private let candyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "CherryBombOne-Regular", size: 15)
        label.textColor = .white
        label.text = "12"
        return label
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "CherryBombOne-Regular", size: 30)
        label.textColor = .charryRed()
        label.text = "13"
        return label
    }()
    
    private let settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "SettingsImage"), for: .normal)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        return button
    }()

    private var gradientLayerTV: CAGradientLayer! {
        didSet {
            gradientLayerTV.startPoint = CGPoint(x: 0.25, y: 0.5)
            gradientLayerTV.endPoint = CGPoint(x: 0.75, y: 0.5)
            gradientLayerTV.colors = [ UIColor.gradientFirst1().cgColor,
                                          UIColor.gradientFirst2().cgColor,
                                          UIColor.gradientFirst3().cgColor
            ]
            gradientLayerTV.locations = [1, 0.62, 0]
            gradientLayerTV.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 0.99, c: -0.99, d: 0, tx: 0.99, ty: 0.08))
            gradientLayerTV.bounds = topView.bounds.insetBy(dx: -0.5*topView.bounds.size.width, dy: -0.5*topView.bounds.size.height)
            gradientLayerTV.position = topView.center
        }
    }
    
    private var gradientLayerSB: CAGradientLayer! {
        didSet {
            gradientLayerSB.startPoint = CGPoint(x: 0.25, y: 0.5)
            gradientLayerSB.endPoint = CGPoint(x: 0.75, y: 0.5)
            gradientLayerSB.colors = [ UIColor.gradientFirst1().cgColor,
                                     UIColor.gradientFirst2().cgColor,
                                     UIColor.gradientFirst3().cgColor
            ]
            gradientLayerSB.locations = [0, 0.62, 1]
            gradientLayerSB.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 0.99, c: -0.99, d: 0, tx: 0.99, ty: 0.08))
            gradientLayerSB.bounds = topView.bounds.insetBy(dx: -0.5*topView.bounds.size.width, dy: -0.5*topView.bounds.size.height)
            gradientLayerSB.position = topView.center
        }
    }
    
    private var gradientLayerCV: CAGradientLayer! {
        didSet {
            gradientLayerCV.startPoint = CGPoint(x: 0, y: 0)
            gradientLayerCV.endPoint = CGPoint(x: 1, y: 1)
            gradientLayerCV.colors = [ UIColor.gradientFirst2().cgColor,
                                       UIColor.gradientFirst3().cgColor
            ]
            gradientLayerCV.locations = [0, 0.62]
            gradientLayerCV.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 0.99, c: -0.99, d: 0, tx: 0.99, ty: 0.08))
            gradientLayerCV.bounds = topView.bounds.insetBy(dx: -0.5*topView.bounds.size.width, dy: -0.5*topView.bounds.size.height)
            gradientLayerCV.position = topView.center
        }
    }
    
    private var levelUp: CAShapeLayer! {
        didSet {
            levelUp.lineWidth = 4
            levelUp.lineCap = .round
            levelUp.fillColor = nil
            levelUp.strokeEnd = 1
            levelUp.strokeColor = UIColor.green.cgColor
        }
    }
}

//MARK: Setup UI
extension GameView {
    
    func setupUI() {
        self.backgroundColor = .white
        topView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        candysView.translatesAutoresizingMaskIntoConstraints = false
        candyImage.translatesAutoresizingMaskIntoConstraints = false
        candyLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backgroundImage)
        backgroundImage.addSubview(topView)
        backgroundImage.addSubview(settingsButton)
        topView.addSubview(candysView)
        candysView.addSubview(candyImage)
        candysView.addSubview(candyLabel)
        topView.addSubview(timerLabel)
        
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
        
        NSLayoutConstraint.activate([
            candysView.heightAnchor.constraint(equalToConstant: 50),
            candysView.topAnchor.constraint(equalTo: topView.topAnchor, constant: 23),
            candysView.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 120),
            candysView.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -120)
        ])
        
        NSLayoutConstraint.activate([
            candyImage.heightAnchor.constraint(equalToConstant: 40),
            candyImage.topAnchor.constraint(equalTo: candysView.topAnchor, constant: 6),
            candyImage.leadingAnchor.constraint(equalTo: candysView.leadingAnchor, constant: 55),
            candyImage.trailingAnchor.constraint(equalTo: candysView.trailingAnchor, constant: -55)
        ])
        
        NSLayoutConstraint.activate([
            candyLabel.heightAnchor.constraint(equalToConstant: 20),
            candyLabel.leadingAnchor.constraint(equalTo: candyImage.trailingAnchor, constant: 2),
            candyLabel.trailingAnchor.constraint(equalTo: candysView.trailingAnchor, constant: -10),
            candyLabel.centerYAnchor.constraint(equalTo: candyImage.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            timerLabel.heightAnchor.constraint(equalToConstant: 40),
            timerLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 40),
            timerLabel.centerYAnchor.constraint(equalTo: candysView.centerYAnchor)
        ])
    }
}

//MARK: Setup Gradient & Shape Layer
extension GameView {
    
    func setupGradient() {
        self.gradientLayerTV = CAGradientLayer()
        self.topView.layer.insertSublayer(gradientLayerTV, at: 0)
        
        self.gradientLayerSB = CAGradientLayer()
        self.settingsButton.layer.insertSublayer(gradientLayerSB, at: 0)
        
        self.gradientLayerCV = CAGradientLayer()
        self.candysView.layer.insertSublayer(gradientLayerCV, at: 0)
    }
    
    func setupShapeLayer() {
        self.levelUp = CAShapeLayer()
        topView.layer.addSublayer(levelUp)
    }
    
    override func layoutSubviews() {
        gradientLayerTV.frame = CGRect(x: 0, y: 0,
                                          width: self.topView.bounds.size.width,
                                          height: self.topView.bounds.size.height)
        gradientLayerSB.frame = CGRect(x: 0, y: 0,
                                     width: self.settingsButton.bounds.size.width,
                                     height: self.settingsButton.bounds.size.width)
        
        gradientLayerCV.frame = CGRect(x: 0, y: 0,
                                     width: self.candysView.bounds.size.width,
                                     height: self.candysView.bounds.size.width)
        
        configShapeLayer(shapeLayer: levelUp)
    }
    
    private func configShapeLayer(shapeLayer: CAShapeLayer) {
        shapeLayer.frame = topView.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.topView.frame.width / 2 - 80,
                              y: self.topView.frame.height / 2 - 25))
        path.addLine(to: CGPoint(x: self.topView.frame.width / 2 + 80,
                                 y: self.topView.frame.height / 2 - 25))
        shapeLayer.path = path.cgPath
    }
}
