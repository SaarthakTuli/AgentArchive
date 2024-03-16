//
//  MapCard.swift
//  AgentArchive
//
//  Created by Saarthak Tuli on 23/07/23.
//

import SwiftUI
import MapKit

struct MapCard: View {
    
    @State var map: Map
    @Binding var showDetails: Bool
    
    var animation: Namespace.ID
    
    var body: some View {
        VStack {
            // MARK: Header Component
            HStack(alignment: .center) {
                Button {
                    withAnimation(.easeOut(duration: 0.4)) {
                        self.showDetails.toggle()
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.text)
                        .font(.title2)
                }
                
                Spacer()
                
                Image("valo-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 64)
                    .matchedGeometryEffect(id: "logo", in: animation)
                
            }
            .padding(.bottom, 12)
            .frame(width: UIScreen.main.bounds.width - 30, height: 50)
            
            Divider()
            
            ScrollView {
                VStack(alignment: .center) {
                    HeadingComponent(heading: map.displayName)
                        .matchedGeometryEffect(id: "name/\(map.uuid)", in: animation)
                
                    ImageComponent(imgUrl: map.displayIcon ?? map.listViewIcon, width: UIScreen.main.bounds.width)
                    
                  
//                    ZStack {
//                        ImageComponent(imgUrl: map.displayIcon ?? map.listViewIcon, width: UIScreen.main.bounds.width)
//                        GeometryReader {geo in
//                            ForEach(map.callouts ?? [], id: \.self) { call in
//                                Text(call.regionName)
//                                    .position(x: (call.location.x * map.xMultiplier * 1.8 * geo.size.width) + map.xScalarToAdd, y: (call.location.y * map.yMultiplier * geo.size.height) + map.yScalarToAdd)
//                                    .padding(.top, 24)
//
//                            }
//                        }
//                    }
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(map.callouts ?? [], id: \.self) { call in
                            VStack {
                                Text(call.superRegionName)
                                    .foregroundColor(Color.text)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                Text(call.regionName)
                                    .foregroundColor(Color.text)
                                    .font(.title2)
                                    .fontWeight(.medium)
                            }
                            .padding()
                        }
                    }
                }
            }
        }
        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
        .background(Color.background)
        
    }
}
