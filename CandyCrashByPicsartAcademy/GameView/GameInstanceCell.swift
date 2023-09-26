//
//  GameInstanceCell.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import UIKit

final class GameInstanceCell: UICollectionViewCell {
    static let identifier = "GameInstanceCell"
    
    var gameInstance: GameInstance?
    
    private var swipeGestureLeft = UISwipeGestureRecognizer()
    private var swipeGestureRight = UISwipeGestureRecognizer()
    private var swipeGestureDown = UISwipeGestureRecognizer()
    private var swipeGestureUp = UISwipeGestureRecognizer()
    
    weak var swipeGestureDelegate: SwipeGestureDelegate?
        
    func setupUI() {
        guard let imageView = gameInstance?.imageView else { return }
        self.backgroundColor = .lightGray
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 3),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -3),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3)
        ])
    }
    
    func configuration(gameInstance: GameInstance) {
        self.gameInstance = gameInstance
        setupUI()
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
            swipeGestureDelegate?.swipeRightGesture(index: gameInstance!.indexPath.row)
        case .left:
            swipeGestureDelegate?.swipeLeftGesture(index: gameInstance!.indexPath.row)
        case .up:
            swipeGestureDelegate?.swipeUpGesture(index: gameInstance!.indexPath.row)
        case .down:
            swipeGestureDelegate?.swipeDownGesture(index: gameInstance!.indexPath.row)
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
