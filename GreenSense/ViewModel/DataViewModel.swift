//
//  DataViewModel.swift
//  GreenSense
//
//  Created by Jason Mandozzi on 7/19/20.
//  Copyright © 2020 Jason Mandozzi. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DataViewMoedel: ObservableObject {
    @Published var data: EnvironmentData?
    
    let ref = Database.database().reference().child("data")
    
    func readAndObserveData() {
        ref.observe(.value, with: { snapshot in
            guard let dict = snapshot.value as? [String:Any] else {
                print("Error fetching from firebase")
                return
            }
            var humidChange: ColorChange = .noChange
            var tempChange: ColorChange = .noChange
            
            let temp = dict["temp"] as? Int ?? 991
            let humid = dict["humidity"] as? Int ?? 992
            let dateTime = dict["dateTime"] as? String ?? "Error creating update timestamp"
            
            if dict["humidChange"] as? String ?? "humidChange Error" == "increase" {
                humidChange = .increase
            } else if dict["humidChange"] as? String ?? "humidChange Error" == "decrease" {
                humidChange = .decrease
            }
            
            if dict["tempChange"] as? String ?? "tempChange error" == "increase" {
                tempChange = .increase
            } else if dict["tempChange"] as? String ?? "tempChange error" == "decrease" {
                tempChange = .decrease
            }
            
            self.data = EnvironmentData(dateAndTime: dateTime, temperature: temp, humidity: humid - 3, resevoirVolume: 0, humidChange: humidChange, tempChange: tempChange)
        })
    }
}
