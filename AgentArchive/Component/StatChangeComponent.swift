//
//  StatChangeCOmponent.swift
//  AgentArchive
//
//  Created by Saarthak Tuli on 18/07/23.
//

import SwiftUI

struct StatChangeComponent: View {
    @State var heading: String
    @State var value: String
    @State var change: String
    
    var body: some View {
        HStack(spacing: 8) {
            Text(heading)
                .foregroundColor(.text)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(value)
                .foregroundColor(.text)
                .font(.title2)
                .fontWeight(.medium)
            
            Text("(\(change))")
                .foregroundColor(change.getNumber() >= 0 ? Color.green : Color.red)
                .font(.title3)
                .fontWeight(.medium)
        }
    }
}
