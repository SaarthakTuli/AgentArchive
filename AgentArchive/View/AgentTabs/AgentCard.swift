//
//  AgentCard.swift
//  AgentArchive
//
//  Created by Saarthak Tuli on 17/07/23.
//

import SwiftUI

let plain_bg = "https://wallpaperaccess.com/full/3215377.jpg"
let logo = "https://seeklogo.com/images/V/valorant-logo-FAB2CA0E55-seeklogo.com.png"
let displayIcon = "https://media.valorant-api.com/agents/320b2a48-4d9b-a075-30f1-1f93a9b638fa/displayicon.png"

// Temp
let pic = "https://media.valorant-api.com/agents/9f0d8ba9-4140-b941-57d3-a7ad57c6b417/fullportrait.png"
let bg = "https://media.valorant-api.com/agents/9f0d8ba9-4140-b941-57d3-a7ad57c6b417/background.png"

let song = "https://media.valorant-api.com/sounds/421554800.wav"

struct AgentCard: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var agent: Agent
    var animation: Namespace.ID
    @Binding var showDetails: Bool
    
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
                
                AudioComponent(audioLink: agent.voiceLine?.mediaList[0].wave ?? song )
                    .matchedGeometryEffect(id: "audio/\(agent.uuid)", in: animation)
                ImageComponent(imgUrl: agent.displayIcon, width: 48)
                    .clipShape(Circle())
                    .matchedGeometryEffect(id: "img/\(agent.uuid)", in: animation)
            }
            .frame(width: UIScreen.main.bounds.width - 30, height: 50)
            
            Divider()
            
            ScrollView {
                VStack {

                    VStack {
                        Text(agent.displayName)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .matchedGeometryEffect(id: "head/\(agent.uuid)", in: animation)

                        Text(agent.developerName)
                            .font(.title2)
                            .fontWeight(.medium)
                            .matchedGeometryEffect(id: "subhead/\(agent.uuid)", in: animation)
                    }
                    .offset(y: 20)

                    // MARK: Big Portrait
                    ZStack {
                        // MARK: Background Image
                        ImageComponent(imgUrl: agent.background ?? bg , width: UIScreen.main.bounds.width)
                        // agent.background ??

                        // MARK: Image of Agent
                        ImageComponent(imgUrl: agent.fullPortrait ?? pic , width: UIScreen.main.bounds.width)
                        // agent.fullPortrait ??

                    }
                    .offset(y: -50)

                    Image("arrow")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64)
                        .rotationEffect(Angle(degrees: 180))
                        .offset(y: -95)

                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.background)
                            .shadow(color: Color(hex: "#FD4556"), radius: 8)
                            .frame(width: UIScreen.main.bounds.width, height: .infinity)

                        VStack(spacing: 32) {

                            // MARK: About Section
                            VStack(spacing: 24) {
                                HeadingComponent(heading: "About")
                                
                                Text(agent.description)
                                    .foregroundColor(Color.text)
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .multilineTextAlignment(.center)
                            }
                            .padding(.horizontal)
                                
                                
                            Seperator()
                            
                            // MARK: Role Section
                            VStack {
                                HeadingComponent(heading: "Role")
                                    
                                SectionComponent(image: agent.role?.displayIcon ?? "https://media.valorant-api.com/agents/roles/4ee40330-ecdd-4f2f-98a8-eb1243428373/displayicon.png", imageWidth: 64, imageColor: agent.backgroundGradientColors?[0] ?? "#53212B", heading: agent.role?.displayName ?? "Controller", type: "", content: agent.role?.description ?? "Controllers are experts in slicing up dangerous territory to set their team up for success")
                                    .frame(height: 150)
                            }
                            
                            Seperator()
                            
                            // MARK: Abilities Section
                            VStack(spacing: 24) {
                                HeadingComponent(heading: "Abilities")

                                VStack(spacing: 18) {
                                    ForEach(agent.abilities, id: \.self) { ability in
                                        SectionComponent(image: ability.displayIcon ?? "https://media.valorant-api.com/agents/9f0d8ba9-4140-b941-57d3-a7ad57c6b417/abilities/grenade/displayicon.png", imageWidth: 64, imageColor: agent.backgroundGradientColors?[0] ?? "#53212B", heading: ability.displayName, type: ability.slot, content: ability.description)
                                            .padding(.horizontal)
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                    .offset(y: -75)
                }
            }
        }
        .padding(.top, 50)
//        .padding(.bottom, -50)
        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height)
        .background(Color.background)
        .preferredColorScheme(.dark)
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}

//struct AgentCard_Previews: PreviewProvider {
//    static var previews: some View {
//        AgentCard()
//    }
//}
