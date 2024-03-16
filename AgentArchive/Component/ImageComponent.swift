//
//  ImageComponent.swift
//  AgentArchive
//
//  Created by Saarthak Tuli on 17/07/23.
//

import SwiftUI

struct ImageComponent: View {
    
    @State var imgUrl: String
    @State var width: CGFloat
    
    var body: some View {
        AsyncImage(
            url:URL(string: imgUrl),
            content: { image in
                image.resizable()
                     .aspectRatio(contentMode: .fill)
                     .frame(maxWidth: width)
            },
            placeholder: {
                ProgressView()
            }
        )
    }
}
