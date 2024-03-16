//
//  WeaponsView.swift
//  AgentArchive
//
//  Created by Saarthak Tuli on 18/07/23.
//

import SwiftUI

struct WeaponsView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var animation: Namespace.ID
    @State var showDetails: Bool = false
    @State var weapon: Weapon?
    
    var body: some View {
        VStack {
            if showDetails {
                WeaponCard(animation: animation, weapon: weapon ?? viewModel.weaponList[0], showDetails: $showDetails)
            } else {
                VStack {
                    HeaderComponent(animation: animation)
                    
                    ScrollView {
                        VStack {
                            ForEach(viewModel.weaponList, id: \.self) { weapon in
                                VStack(spacing: 12) {
                                    ImageComponent(imgUrl: weapon.displayIcon, width: UIScreen.main.bounds.width)
                                        .matchedGeometryEffect(id: "img/\(weapon.uuid)", in: animation)
                                    
                                    HStack(alignment: .center) {
                                        VStack(alignment: .leading) {
                                            Text(weapon.displayName)
                                                .foregroundColor(Color.text)
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .matchedGeometryEffect(id: "name/\(weapon.uuid)", in: animation)
                                            
                                            Text(weapon.shopData?.categoryText ?? "Weapon")
                                                .foregroundColor(Color.text)
                                                .font(.title3)
                                                .fontWeight(.medium)
                                                .matchedGeometryEffect(id: "category/\(weapon.uuid)", in: animation)
                                        }
                                        
                                        Spacer(minLength: 0)
                                        
                                        VStack {
                                            Image("cred")
                                                .colorInvert()
                                            
                                            Text("\(weapon.shopData?.cost ?? 0)")
                                                .foregroundColor(.text)
                                                .font(.title2)
                                                .fontWeight(.bold)
                                        }.matchedGeometryEffect(id: "cost/\(weapon.uuid)", in: animation)
                                    }
                                    
                                    Spacer(minLength: 0)
                                    
                                    Divider()
                                }
                                .padding([.horizontal, .top])
                                .onTapGesture {
                                    withAnimation(.easeIn(duration: 0.4)) {
                                        self.weapon = weapon
                                        self.showDetails.toggle()
                                    }
                                }
                                
                            }
                        }
                        
                       
                    }
                }
                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                .background(Color.background)
            }
        }
    }
}

//struct WeaponsView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeaponsView()
//    }
//}
