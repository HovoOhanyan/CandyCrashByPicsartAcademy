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
    
    private var swipeGestureLeft = UISwipeGestureRecognizer()
    private var swipeGestureRight = UISwipeGestureRecognizer()
    private var swipeGestureDown = UISwipeGestureRecognizer()
    private var swipeGestureUp = UISwipeGestureRecognizer()
        
    weak var swipeGestureDelegate: SwipeGestureDelegate?
    private var imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        createAndSettingsSwipeGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        createAndSettingsSwipeGesture()

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
    
    private func createAndSettingsSwipeGesture() {
        swipeGestureLeft = UISwipeGestureRecognizer(target: self,
                                                    action: #selector(handleSwipe(_:)))
        swipeGestureLeft.direction = .left
        
        swipeGestureRight = UISwipeGestureRecognizer(target: self,
                                                     action: #selector(handleSwipe(_:)))
        swipeGestureRight.direction = .right
        
        
        swipeGestureUp = UISwipeGestureRecognizer(target: self,
                                                  action: #selector(handleSwipe(_:)))
        swipeGestureUp.direction = .up
        
        
        swipeGestureDown = UISwipeGestureRecognizer(target: self,
                                                    action: #selector(handleSwipe(_:)))
        swipeGestureDown.direction = .down
        
        
        self.addGestureRecognizer(swipeGestureLeft)
        self.addGestureRecognizer(swipeGestureRight)
        self.addGestureRecognizer(swipeGestureUp)
        self.addGestureRecognizer(swipeGestureDown)

    }
    
    @objc private func handleSwipe(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .right:
            let secondIndexPath = IndexPath(item: gameInstance!.indexPath.row + 1, section: 0)
            swipeGestureDelegate?.swipeRightGesture(indexPaths: [gameInstance!.indexPath, secondIndexPath])
        case .left:
            let secondIndexPath = IndexPath(item: gameInstance!.indexPath.row - 1, section: 0)
            swipeGestureDelegate?.swipeLeftGesture(indexPaths: [gameInstance!.indexPath, secondIndexPath])
        case .up:
            let secondIndexPath = IndexPath(item: gameInstance!.indexPath.row - 5, section: 0)
            swipeGestureDelegate?.swipeUpGesture(indexPaths: [gameInstance!.indexPath, secondIndexPath])
        case .down:
            let secondIndexPath = IndexPath(item: gameInstance!.indexPath.row + 5, section: 0)
            swipeGestureDelegate?.swipeDownGesture(indexPaths: [gameInstance!.indexPath, secondIndexPath])
        default:
            break
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
