//
//  HeadingComponent.swift
//  AgentArchive
//
//  Created by Saarthak Tuli on 17/07/23.
//

import SwiftUI

struct HeadingComponent: View {
    
    @State var heading: String
    
    var body: some View {
        Text(heading)
            .foregroundColor(Color.text)
            .font(.title)
            .fontWeight(.bold)
    }
}

