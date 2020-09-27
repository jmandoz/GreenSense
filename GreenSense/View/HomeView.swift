//
//  ContentView.swift
//  GreenSense
//
//  Created by Jason Mandozzi on 7/18/20.
//  Copyright © 2020 Jason Mandozzi. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var viewModel = DataViewMoedel()
    
    @State private var animationAmmount: CGFloat = 1
    
    private var tempChange: Color {
        switch viewModel.data?.tempChange {
        case .increase:
            return Color.green
        case .decrease:
            return Color.red
        case .noChange:
            return Color.yellow
        case .none:
            return Color.white
        }
    }
    
    private var tempIndicator: Color {
        guard let viewModel = viewModel.data?.temperature else {return Color.gray}
        switch viewModel {
        case 0...53:
            return Color.blue
        case 54...83:
            return Color.green
        case 84...150:
            return Color.red
        default:
            return Color.pink
        }
    }
    
    private var humidIndicator: Color {
        guard let viewModel = viewModel.data?.humidity else {return Color.gray}
        switch viewModel {
        case 0...39:
            return Color.blue
        case 40...55:
            return Color.green
        case 60...100:
            return Color.red
        default:
            return Color.pink
        }
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 4) {
                Spacer()
                Text("last updated:")
                    .font(.callout)
                Text(viewModel.data?.dateAndTime ?? "69")
                    .font(.callout)
                Spacer()
            }
            .padding(30)
            
            HStack {
                Spacer()
                ZStack {
                    VStack {
                        Text("Temperature")
                        HStack {
                            Text("\(viewModel.data?.temperature ?? 0)")
                                .font(.largeTitle)
                            Text("ºF")
                                .font(.footnote)
                            
                        }
                    }
                    RingView(colors: [Color.clear, tempIndicator, Color.clear], strokeColor: tempChange,
                             endAngle: viewModel.data?.temperature ?? 0 )
                        .frame(width: 150, height: 150, alignment: .center)
                        .scaleEffect(animationAmmount)
                        .animation(Animation.easeInOut(duration: 1))
                        .rotation3DEffect(Angle(degrees: 300), axis: (x: 7, y: 0, z: -5))
                }
                    
                .padding(10)
                Spacer()
                ZStack {
                    
                    VStack {
                        Text("Humidity")
                        HStack {
                            Text("\(viewModel.data?.humidity ?? 0)" )
                                .font(.largeTitle)
                            Text("%RH")
                                .font(.footnote)
                        }
                        
                    }
                    RingView(colors: [Color.clear, humidIndicator, Color.clear], strokeColor: tempChange,
                             endAngle: viewModel.data?.humidity ?? 0 )
                        .frame(width: 150, height: 150, alignment: .center)
                        .animation(Animation.easeInOut(duration: 0.5))
                        .rotation3DEffect(Angle(degrees: 300), axis: (x: 7, y: 0, z: -5))
                }
                    
                .padding(20)
                Spacer()
            }
            Spacer()
        }
        .onAppear() {
            self.viewModel.readAndObserveData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
