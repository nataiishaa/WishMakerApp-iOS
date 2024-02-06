//
//  CalendarManaging.swift
//  WishMakerApp_NVZakharova
//
//  Created by Наталья Захарова on 06.02.2024.
//


import EventKit
protocol CalendarManaging {
    func create(eventModel: WishEventModel) -> Bool
}
