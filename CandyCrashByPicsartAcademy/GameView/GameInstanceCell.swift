//
//  GameInstanceCell.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import UIKit

final class GameInstanceCell: UICollectionViewCell {
    static let identifier = "GameInstanceCell"
    var gameInstance: GameInstance!
    private var imageView = UIImageView()

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
        self.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
    
    func configuration(gameInstance: GameInstance) {
        self.gameInstance = gameInstance
        
        switch gameInstance.image {
        case .heart:
            imageView.image = UIImage(named: "Heart")
        case .star:
            imageView.image = UIImage(named: "Star")
        case .triangle:
            imageView.image = UIImage(named: "Triangle")
        case .square:
            imageView.image = UIImage(named: "Square")
        case .empty:
            imageView.image = UIImage()
        }
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
