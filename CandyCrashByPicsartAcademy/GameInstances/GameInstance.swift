//
//  GameInstances.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import Foundation
import UIKit.UIImageView

protocol GameInstance {
    var index: Int { get }
    var row: Int { get set }
    var colum: Int { get set }
    var indexPath: IndexPath { get set }
    var imageView: UIImageView { get set }
}
