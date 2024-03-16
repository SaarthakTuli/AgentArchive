//
//  Home.swift
//  AgentArchive
//
//  Created by Saarthak Tuli on 17/07/23.
//

import SwiftUI


struct Home: View {
    
    var animation: Namespace.ID
    
    var body: some View {
        TabView {
            AgentsView(animation: animation)
            .tabItem {
                VStack {
                    Image("agents")
                        .renderingMode(.template)
                    
                    Text("Agents")
                }
            }.tag(0)
            
            WeaponsView(animation: animation)
                .font(.system(size: 48))
                .tabItem {
                    VStack {
                        Image("gun")
                            .renderingMode(.template)
                        
                        Text("Weapons")
                    }
                }.tag(1)
            
            MapsView(animation: animation)
            .tabItem {
                VStack {
                    Image(systemName: "map.fill")
                        .renderingMode(.template)
                    
                    Text("Maps")
                }
            }.tag(0)
        }
        .font(.system(size: 8))
        
    }
}

//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}
