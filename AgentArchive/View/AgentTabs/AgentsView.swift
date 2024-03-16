//
//  Agents.swift
//  AgentArchive
//
//  Created by Saarthak Tuli on 18/07/23.
//

import SwiftUI

struct AgentsView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var animation: Namespace.ID
    @State var agent: Agent?
    @State var showDetails: Bool = false
    
    var body: some View {
        VStack {
            if showDetails {
                AgentCard(agent: agent ?? viewModel.agentList[0], animation: animation, showDetails: $showDetails)
            } else {
                
                VStack {
                   HeaderComponent(animation: animation)
                
                    ScrollView {
                        VStack(alignment: .center) {
                            ForEach(viewModel.agentList, id: \.self) { agent in
                                HStack {
                                    ImageComponent(imgUrl: agent.displayIconSmall, width: 100)
                                        .clipShape(Circle())
                                        .matchedGeometryEffect(id: "img/\(agent.uuid)", in: animation)
                                    
                                    VStack(alignment: .leading) {
                                        Text(agent.displayName)
                                            .foregroundColor(Color.text)
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .matchedGeometryEffect(id: "head/\(agent.uuid)", in: animation)
                                        
                                        Text(agent.developerName)
                                            .foregroundColor(Color.text)
                                            .font(.title3)
                                            .fontWeight(.medium)
                                            .matchedGeometryEffect(id: "subhead/\(agent.uuid)", in: animation)
                                    }
                                    
                                    Spacer(minLength: 0)
                                    
                                    AudioComponent(audioLink: agent.voiceLine?.mediaList[0].wave ?? "https://media.valorant-api.com/sounds/130865070.wav")
                                        .matchedGeometryEffect(id: "audio/\(agent.uuid)", in: animation)
                                }
                                .padding([.horizontal, .top])
                                .onTapGesture {
                                    withAnimation (.easeIn(duration: 0.4)) {
                                        self.agent = agent
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

//struct AgentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AgentsView()
//    }
//}
