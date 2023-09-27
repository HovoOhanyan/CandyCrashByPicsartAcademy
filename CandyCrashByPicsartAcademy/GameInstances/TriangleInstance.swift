//
//  TriangleInstance.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import Foundation
import UIKit.UIImageView

struct TriangleInstance: GameInstance {
    var id: Int = 3
    
    var indexPath: IndexPath = IndexPath()
    
    var imageView: UIImageView = UIImageView(image: UIImage(named: "Triangle"))
}
