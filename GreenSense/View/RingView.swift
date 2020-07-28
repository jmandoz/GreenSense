//
//  RingView.swift
//  GreenSense
//
//  Created by Jason Mandozzi on 7/27/20.
//  Copyright © 2020 Jason Mandozzi. All rights reserved.
//

import SwiftUI

struct RingView: View {
    
    @ObservedObject var viewModel: DataViewMoedel
    
    var colors: [Color] = [Color.blue, Color.red]
    
    var strokeColor: Color
    
    var endAngle: Int
    
    var body: some View {
        
        ZStack {
            Circle()
                .stroke(strokeColor, lineWidth: 20)
            Circle()
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: colors),
                        center: .center,
                        startAngle: .degrees(0),
                        endAngle: .degrees(Double(endAngle)/100 * 360)
                    ),
                    style: StrokeStyle(lineWidth: 20, lineCap: .round)
            )
        }.frame(idealWidth: 150, idealHeight: 150, alignment: .center)
    }
}
