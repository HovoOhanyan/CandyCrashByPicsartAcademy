//
//  GameInstances.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import Foundation
import UIKit.UIImageView

protocol GameInstance {
    var id: Int { get }
    var indexPath: IndexPath { get set }
    var imageView: UIImageView { get set }
}
