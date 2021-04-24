//
//  StatModel.swift
//  Rsstats
//
//  Created by Thomas Mutter on 23/04/2021.
//

import Foundation

struct StatModel: Decodable, Identifiable {
    var id: Int = 0
    var name: String = "Empty"
    var level: Int = 0
    var progress: Float = 0.0
    var xp: Int = 0
}
