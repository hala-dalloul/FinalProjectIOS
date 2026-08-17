//
//  Store.swift
//  FinalProject
//
//  Created by Hala Dalloul on 16/08/2026.
//

import Foundation
class Store {
    var imageName: String
    var name: String
    var rate: Double

    init(imageName: String, name: String, rate: Double) {
        self.imageName = imageName
        self.name = name
        self.rate = rate
    }
}
