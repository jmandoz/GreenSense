//
//  Data.swift
//  GreenSense
//
//  Created by Jason Mandozzi on 7/18/20.
//  Copyright © 2020 Jason Mandozzi. All rights reserved.
//

import Foundation

enum ColorChange {
    case increase
    case decrease
    case noChange
}

class EnvironmentData {
    let dateAndTime: String?
    let temperature: Int
    let humidity: Int
    let resevoirVolume: Int
    let humidChange: ColorChange
    let tempChange: ColorChange
    
    init(dateAndTime: String?,
         temperature: Int,
         humidity: Int,
         resevoirVolume: Int,
         humidChange: ColorChange,
         tempChange: ColorChange) {
        self.dateAndTime = dateAndTime
        self.temperature = temperature
        self.humidity = humidity
        self.resevoirVolume = resevoirVolume
        self.humidChange = humidChange
        self.tempChange = tempChange
    }
}
