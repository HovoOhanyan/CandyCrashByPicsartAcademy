//
//  HeartInstance.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import Foundation
import UIKit.UIImageView

struct HeartInstance: GameInstance {
    var id: Int = 1
    
    var indexPath: IndexPath = IndexPath()
    
    var imageView: UIImageView = UIImageView(image: UIImage(named: "Heart"))
}
