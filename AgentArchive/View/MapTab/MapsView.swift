//
//  MapsView.swift
//  AgentArchive
//
//  Created by Saarthak Tuli on 23/07/23.
//

import SwiftUI

struct MapsView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var animation: Namespace.ID
    
    @State var map: Map?
    @State var showDetails: Bool = false
    
    var body: some View {
        VStack {
            if showDetails {
                MapCard(map: map ?? viewModel.mapList[0], showDetails: $showDetails, animation: animation)
            } else {
                
                VStack {
                   HeaderComponent(animation: animation)
                
                    ScrollView {
                        VStack(alignment: .center) {
                            ForEach(viewModel.mapList, id: \.self) { map in
                                VStack(alignment: .leading, spacing: 0) {
                                    ImageComponent(imgUrl: map.listViewIcon, width: UIScreen.main.bounds.width)
                                        .cornerRadius(15)
                                    
                                    HeadingComponent(heading: map.displayName)
                                        .padding(.horizontal)
                                }
                                .padding(.top)
                                .onTapGesture {
                                    withAnimation (.easeIn(duration: 0.4)) {
                                        self.map = map
                                        self.showDetails.toggle()
                                    }
                                }
                                
                            }
                        }
                    }
                    Divider()
                    
                    Spacer(minLength: 0)
                    
                }.frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                .background(Color.background)
            }
            
        }
    }
}
