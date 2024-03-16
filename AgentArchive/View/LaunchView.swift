//
//  LaunchView.swift
//  AgentArchive
//
//  Created by Saarthak Tuli on 17/07/23.
//

import SwiftUI

struct LaunchView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @State var show: Bool = false
    @Namespace var animation
    
    var body: some View {
        ZStack {
            VStack {
                Image("valo-logo")
                    .resizable()
                    .scaledToFit()
                    .matchedGeometryEffect(id: "logo", in: animation)
            }
            .onAppear {
                viewModel.getLanguage()
                
                viewModel.getAgentsAll()
                viewModel.getWeaponsAll()
                viewModel.getMapsAll()

                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation(.spring()) {
                        self.show.toggle()
                    }
                 
                }
            }
            
            if show {
                Home(animation: animation)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
}


struct BackgroundEffect: View {
    
    @State var width: [CGFloat] = [20, 12, 8, 6, 5, 5]
    @State var offset: [CGFloat] = [0, 100, 150, 250, 275, 300]
    
    
    var body: some View {
        ForEach(0..<width.count, id: \.self) {i in
            // Top Line
            Rectangle()
                .fill(Color.background)
                .frame(width: width[i], height: 1200)
                .rotationEffect(Angle(degrees: 40))
                .offset(x: -UIScreen.main.bounds.width/2 - offset[i])
                .colorInvert()
            
            // Bottom Lines
            Rectangle()
                .fill(Color.background)
                .frame(width: width[i], height: 1200)
                .rotationEffect(Angle(degrees: 40))
                .offset(x: UIScreen.main.bounds.width/2 + offset[i])
                .colorInvert()
            
        }
        
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
