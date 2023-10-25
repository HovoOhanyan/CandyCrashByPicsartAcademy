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
    
    public let gameAreaView: UIView = {
        let view = UIView()
        view.backgroundColor = .gradientFirst2()
        view.layer.cornerRadius = 10
        return view
    }()
    
    public let comboView: UIView = {
        let view = UIView()
        view.backgroundColor = .gradientFirst3()
        view.layer.cornerRadius = 10
        view.alpha = 0 
        return view
    }()
    
    private let candyImage = UIImageView()
    
    private let candyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "CherryBombOne-Regular", size: 15)
        label.textColor = .charryRed()
        label.text = "20"
        return label
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "CherryBombOne-Regular", size: 30)
        label.textColor = .charryRed()
        label.text = "13"
        return label
    }()
  
    private let comboLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "CherryBombOne-Regular", size: 30)
        label.textColor = .charryRed()
        label.text = ""
        return label
    }()
    
    let pausedButton: PausedButton = {
        let button = PausedButton(type: .system)
        button.setImage(UIImage(named: "SettingsImage"), for: .normal)
        button.setTitleColor(.black, for: .normal)
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
    
    private var levelUpLayer: CAShapeLayer! {
        didSet {
            levelUpLayer.lineWidth = 4
            levelUpLayer.lineCap = .round
            levelUpLayer.fillColor = nil
            levelUpLayer.strokeEnd = 1
            levelUpLayer.strokeColor = UIColor.green.cgColor
        }
    }
    
    private var starLayer: CAShapeLayer! {
        didSet {
            starLayer.contents = UIImage(named: "Star")?.cgImage
        }
    }
    
    private let iconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Candy")
        return image
    }()
    
    public var gameInstanceArray: [GameInstanceView] = []
    public var comboViewBottomAnchor: NSLayoutConstraint!

}

//MARK: Setup UI
extension GameView {
    
    func setupUI(gamePlayInformation: GameEnginePlayInformation) {
        updateLabelsWithGamePlayInfo(gamePlayInformation: gamePlayInformation)
      
        self.backgroundColor = .white
        topView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        pausedButton.translatesAutoresizingMaskIntoConstraints = false
        candysView.translatesAutoresizingMaskIntoConstraints = false
        candyImage.translatesAutoresizingMaskIntoConstraints = false
        candyLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        gameAreaView.translatesAutoresizingMaskIntoConstraints = false
        comboView.translatesAutoresizingMaskIntoConstraints = false
        comboLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backgroundImage)
        backgroundImage.addSubview(topView)
        self.addSubview(pausedButton)
        topView.addSubview(candysView)
        candysView.addSubview(candyImage)
        candysView.addSubview(candyLabel)
        topView.addSubview(timerLabel)
        topView.addSubview(iconImage)
        self.addSubview(gameAreaView)
        backgroundImage.addSubview(comboView)
        comboView.addSubview(comboLabel)
        
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            topView.heightAnchor.constraint(equalToConstant: 80),
            topView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            topView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            topView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            pausedButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            pausedButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            pausedButton.heightAnchor.constraint(equalToConstant: 50),
            pausedButton.widthAnchor.constraint(equalToConstant: 50)
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
            timerLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: topView.topAnchor, constant: 5),
            iconImage.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -10),
            iconImage.heightAnchor.constraint(equalToConstant: 70),
            iconImage.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            gameAreaView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20),
            gameAreaView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            gameAreaView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            gameAreaView.bottomAnchor.constraint(equalTo: pausedButton.topAnchor, constant: -80),
        ])
        
        NSLayoutConstraint.activate([
            comboView.topAnchor.constraint(equalTo: gameAreaView.bottomAnchor, constant: 15),
            comboView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            comboView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            comboView.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        NSLayoutConstraint.activate([
            comboLabel.centerXAnchor.constraint(equalTo: comboView.centerXAnchor),
            comboLabel.centerYAnchor.constraint(equalTo: comboView.centerYAnchor),
        ])
    }
    
    func updateLabelsWithGamePlayInfo(gamePlayInformation: GameEnginePlayInformation) {
        self.candyLabel.text = "\(gamePlayInformation.score)"
        self.timerLabel.text = "\(gamePlayInformation.countOfSteps)"
        
        switch gamePlayInformation.gameInstance.image {
        case .heart:
            candyImage.image = UIImage(named: "Heart")
        case .star:
            candyImage.image = UIImage(named: "Star")
        case .triangle:
            candyImage.image = UIImage(named: "Triangle")
        case .square:
            candyImage.image = UIImage(named: "Square")
        case .empty:
            candyImage.image = UIImage()
        }
    }
}

//MARK: Setup Gradient & Shape Layer
extension GameView {
    
    func setupGradient() {
        self.gradientLayerTV = CAGradientLayer()
        self.topView.layer.insertSublayer(gradientLayerTV, at: 0)
        
        self.gradientLayerCV = CAGradientLayer()
        self.candysView.layer.insertSublayer(gradientLayerCV, at: 0)
    }
    
    func setupShapeLayer() {
        self.levelUpLayer = CAShapeLayer()
        topView.layer.addSublayer(levelUpLayer)
        
        self.starLayer = CAShapeLayer()
        topView.layer.addSublayer(starLayer)
    }
    
    override func layoutSubviews() {
        gradientLayerTV.frame = CGRect(x: 0, y: 0,
                                          width: self.topView.bounds.size.width,
                                          height: self.topView.bounds.size.height)
        
        gradientLayerCV.frame = CGRect(x: 0, y: 0,
                                     width: self.candysView.bounds.size.width,
                                     height: self.candysView.bounds.size.width)
        
        configShapeLayer(shapeLayer: levelUpLayer)
        configureStarLayer(shapeLayer: starLayer, changeStar: 85)
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
    
    private func configureStarLayer(shapeLayer: CAShapeLayer, changeStar: Int) {
        _ = CGSize(width: 30, height: 30)
        shapeLayer.frame = CGRect(x: self.topView.frame.width / 2 - CGFloat(changeStar),
                                  y: self.topView.frame.height / 2 - 35,
                                  width: 20,
                                  height: 20)
    }
}

//MARK: Real time updates in GameView

extension GameView {
    
    func updateScoreLabel(score: Int) {
        if score > 0 {
            self.candyLabel.text = "\(score)"
        }
    }
    
    func updateCountOfStepsLabel(countOfSteps: Int) {
        self.timerLabel.text = "\(countOfSteps)"
    }
    
    func updateStarLayerFrame(updatedStarEstimation: Int) {
        let changeStar = 85 - updatedStarEstimation
        configureStarLayer(shapeLayer: starLayer, changeStar: changeStar)
    }
    
    func updateComboLabel(combo: Int) {
        comboLabel.text = "Combo \(combo)!"
    }
}
