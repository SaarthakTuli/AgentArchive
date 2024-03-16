//
//  SectionComponent.swift
//  AgentArchive
//
//  Created by Saarthak Tuli on 17/07/23.
//

import SwiftUI

struct SectionComponent: View {
    @State var image: String
    @State var imageWidth: CGFloat
    @State var imageColor: String
    @State var heading: String
    @State var type: String
    @State var content: String
    
    var body: some View {
        HStack {
            ImageComponent(imgUrl: image, width: imageWidth)
                .clipShape(Circle())
                .colorMultiply(Color(hex: imageColor.fixColor()))
            
            VStack(alignment: .leading, spacing: 12) {
                
                HStack {
                    Text(heading)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.text)
                    
                    Spacer(minLength: 0)
                    
                    Text(type)
                        .foregroundColor(Color.text)
                        .font(.caption)
                        .fontWeight(.light)
                    
                }
                
                Text(content)
                    .foregroundColor(Color.text)
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
        }
    }
}
