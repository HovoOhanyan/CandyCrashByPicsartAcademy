//
//  StarInstance.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import Foundation
import UIKit.UIImageView

struct StarInstance: GameInstance {
    var index: Int = 2
    
    var row: Int = 0
    
    var colum: Int = 0
    
    var indexPath: IndexPath = IndexPath()
    
    var imageView: UIImageView = UIImageView(image: UIImage(named: "Star"))
}
