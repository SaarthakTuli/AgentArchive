//
//  ContentView.swift
//  AgentArchive
//
//  Created by Saarthak Tuli on 17/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        LaunchView()
            .environmentObject(viewModel)
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
