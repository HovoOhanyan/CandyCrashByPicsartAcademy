//
//  GameInstanceView.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 10.10.23.
//

import UIKit

final class GameInstanceView: UIView {
    let imageView = UIImageView()
    var gameInstance: GameInstance!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupUI()
    }
    
    func setupUI() {
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 10
        self.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
        ])
    }
    
    func configuration(gameInstance: GameInstance, index: Int) {
        self.gameInstance = gameInstance
        
        switch self.gameInstance.image {
        case .heart:
            imageView.image = UIImage(named: "Heart")
            imageView.alpha = 1
        case .star:
            imageView.image = UIImage(named: "Star")
            imageView.alpha = 1
        case .triangle:
            imageView.image = UIImage(named: "Triangle")
            imageView.alpha = 1
        case .square:
            imageView.image = UIImage(named: "Square")
            imageView.alpha = 1
        case .empty:
            imageView.alpha = 0
        }
        
        self.gameInstance.index = index
    }
    
    static func random() -> GameInstance {
        let identifier = Int.random(in: 1...4)
        
        switch identifier {
        case 1:
            return HeartInstance()
        case 2:
            return StarInstance()
        case 3:
            return TriangleInstance()
        case 4:
            return SquareInstance()
        default:
            return EmptyInstance()
        }
    }
}
