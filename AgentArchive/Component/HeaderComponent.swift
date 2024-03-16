//
//  HeaderComponent.swift
//  AgentArchive
//
//  Created by Saarthak Tuli on 18/07/23.
//

import SwiftUI

struct HeaderComponent: View {
    
    var animation: Namespace.ID
    
    var body: some View {
        HStack {
            Image("valo-logo")
                .resizable()
                .scaledToFit()
                .frame(height: 64)
                .matchedGeometryEffect(id: "logo", in: animation)
            
            Image("valorant-logo-name")
                .resizable()
                .scaledToFit()
                .frame(height: 32)
            
            Spacer(minLength: 0)
        }
    }
}
