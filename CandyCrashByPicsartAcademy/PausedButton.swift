//
//  SettingsButton.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Er Baghdasaryan on 11.10.23.
//

import UIKit

final class PausedButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer.colors = [ UIColor.gradientFirst1().cgColor,
                                 UIColor.gradientFirst2().cgColor,
                                 UIColor.gradientFirst3().cgColor
        ]
        layer.locations = [0, 0.62, 1]
        layer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 0.99, c: -0.99, d: 0, tx: 0.99, ty: 0.08))
        return layer
    }()
}
