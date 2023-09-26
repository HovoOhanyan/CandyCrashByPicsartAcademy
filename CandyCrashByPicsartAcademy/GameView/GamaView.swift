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
                // [0, 0.62, 1]
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
