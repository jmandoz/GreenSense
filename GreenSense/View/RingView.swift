//
//  RingView.swift
//  GreenSense
//
//  Created by Jason Mandozzi on 7/27/20.
//  Copyright © 2020 Jason Mandozzi. All rights reserved.
//

import SwiftUI

struct RingView: View {
    
    var colors: [Color] = []
    var strokeColor: Color
    var endAngle: Int
    var body: some View {
        
        ZStack {
            Circle()
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: colors),
                        center: .center,
                        startAngle: .degrees((Double(endAngle)/100 * 360)-150),
                        endAngle: .degrees((Double(endAngle)/100 * 360)+200)
                    ),
                    style: StrokeStyle(lineWidth: 20, lineCap: .round)
            )
        }.frame(idealWidth: 300, idealHeight: 300, alignment: .center)
    }
}
