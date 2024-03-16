//
//  StatComponent.swift
//  AgentArchive
//
//  Created by Saarthak Tuli on 18/07/23.
//

import SwiftUI

struct StatComponent: View {
    @State var heading: String
    @State var value: String
    
    var body: some View {
        HStack(spacing: 8) {
            Text("\(heading): ")
                .foregroundColor(.text)
                .font(.title3)
                .fontWeight(.bold)
            
            Text(value)
                .foregroundColor(.text)
                .font(.title2)
                .fontWeight(.medium)
        }
    }
}
