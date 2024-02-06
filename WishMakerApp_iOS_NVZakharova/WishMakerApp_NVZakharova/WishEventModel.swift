//
//  WishEventModel.swift
//  WishMakerApp_NVZakharova
//
//  Created by Наталья Захарова on 06.02.2024.
//

import Foundation
struct WishEventModel : Codable {
    var title: String
    var description: String
    var startDate: Date
    var endDate: Date
}
