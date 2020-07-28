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
    @State private var animationAmmount = 0
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
                ZStack {
                    VStack {
                        Text("Temperature")
                        Text("\(viewModel.data?.temperature ?? 0)")
                            .font(.largeTitle)
                    }
                    RingView(viewModel: viewModel, strokeColor: tempChange, endAngle: viewModel.data?.temperature ?? 0)
                }
                
                .padding(20)
                Spacer()
                VStack {
                    Text("Humidity")
                    Text("\(viewModel.data?.humidity ?? 0)")
                        .font(.largeTitle)
                    
                }
                .padding(20)
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
