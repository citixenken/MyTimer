//
//  ContentView.swift
//  MyTimer
//
//  Created by Ken Muyesu on 12/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var timerMode: TimerMode = .initial
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
