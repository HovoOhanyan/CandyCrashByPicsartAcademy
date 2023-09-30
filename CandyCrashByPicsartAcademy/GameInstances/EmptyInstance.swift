//
//  EmptyInstance.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import Foundation

struct EmptyInstance: GameInstance {
    var id: Int = 0
    
    var indexPath: IndexPath = IndexPath()
    
    var image: GameInstanceImage = .empty
}
