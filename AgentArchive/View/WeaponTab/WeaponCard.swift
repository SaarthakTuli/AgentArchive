//
//  WeaponCard.swift
//  AgentArchive
//
//  Created by Saarthak Tuli on 18/07/23.
//

import SwiftUI

struct WeaponCard: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var animation: Namespace.ID
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
//    let columns = [GridItem(.flexible())]
    
    @State var weapon: Weapon
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
                    HStack {
                        VStack(alignment: .leading) {
                            Text(weapon.displayName)
                                .foregroundColor(.text)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .matchedGeometryEffect(id: "name/\(weapon.uuid)", in: animation)
                            
                            Text(weapon.shopData?.categoryText ?? "Weapon")
                                .foregroundColor(.text)
                                .font(.title2)
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
                    .padding(.horizontal)
                    
                    ImageComponent(imgUrl: weapon.displayIcon, width: UIScreen.main.bounds.width)
                        .matchedGeometryEffect(id: "img/\(weapon.uuid)", in: animation)
                    
                    Image("arrow")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64)
                        .rotationEffect(Angle(degrees: 180))
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.background)
                            .shadow(color: Color(hex: "#FD4556"), radius: 8)
                            .frame(width: UIScreen.main.bounds.width, height: .infinity)
                        
                        VStack(spacing: 32) {
                            if weapon.weaponStats != nil {
                                VStack(spacing: 24) {
                                    HeadingComponent(heading: "Weapon Stats")
                                    
                                    // MARK: Basic Weapon Stats
                                    
                                    VStack(alignment: .leading, spacing: 18) {
                                        VStack(alignment: .leading, spacing: 12) {
                                            StatBarComponent(heading: "Fire Rate", value: (weapon.weaponStats?.fireRate.removeZerosFromEnd() ?? "0") + " /sec", ratio: getRatio(val: (weapon.weaponStats?.fireRate.removeZerosFromEnd() ?? "0"), high: viewModel.weaponStatHighest.fireRate, low: 0, highValBetter: true))
                                            
                                            StatBarComponent(heading: "Magazine Size", value: "\(weapon.weaponStats?.magazineSize ?? 0)", ratio: getRatio(val: "\(weapon.weaponStats?.magazineSize ?? 0)", high: Double(viewModel.weaponStatHighest.magazineSize), low: 0, highValBetter: true))
                                            
                                            StatBarComponent(heading: "Reload Time", value: (weapon.weaponStats?.reloadTimeSeconds.removeZerosFromEnd() ?? "0") + " sec", ratio: getRatio(val: (weapon.weaponStats?.reloadTimeSeconds.removeZerosFromEnd() ?? "0") + " sec", high: viewModel.weaponStatHighest.maxReloadTime, low: viewModel.weaponStatHighest.minReloadTime, highValBetter: false))
                                            
                                            StatBarComponent(heading: "Equip Time", value: (weapon.weaponStats?.equipTimeSeconds.removeZerosFromEnd() ?? "0") + " sec", ratio: getRatio(val: (weapon.weaponStats?.equipTimeSeconds.removeZerosFromEnd() ?? "0")  + " sec", high: viewModel.weaponStatHighest.maxEquipTime, low: viewModel.weaponStatHighest.minEquipTime, highValBetter: false))
                                        }
                                    

                                        StatComponent(heading: "Run Speed Multiplier", value: (weapon.weaponStats?.runSpeedMultiplier.removeZerosFromEnd() ?? "0") + "x")
                                        
                                        StatComponent(heading: "First Bullet Accuracy", value: (((weapon.weaponStats?.firstBulletAccuracy ?? 0)*100).removeZerosFromEnd() ) + "%")
                                        
                                        StatComponent(heading: "Firing Mode: ", value: weapon.weaponStats?.fireMode?.getMode() ?? "-")
                                        
                                        StatComponent(heading: "Fire Type: ", value: weapon.weaponStats?.altFireType?.getMode() ?? "-")
                                        
                                        StatComponent(heading: "Wall Penetration: ", value: weapon.weaponStats?.wallPenetration?.getMode() ?? "-")
                                        
                                        StatComponent(heading: "Feature: ", value: weapon.weaponStats?.feature?.getMode() ?? "-")
                                    }
                                }
                                .frame(width: UIScreen.main.bounds.width - 30)
                                
                                Seperator()
                            }
                            
                            
                            
                                
                            VStack(alignment: .center, spacing: 24) {
                                if weapon.weaponStats?.adsStats != nil {
                                    HeadingComponent(heading: "ADS Stats")
                                    
                                    VStack(alignment: .leading, spacing: 24) {
                                        StatComponent(heading: "Zoom Multiplier: ", value: (weapon.weaponStats?.adsStats?.zoomMultiplier.removeZerosFromEnd() ?? "0") + "x")
                                        
                                        StatChangeComponent(heading: "Fire Rate: ", value: (weapon.weaponStats?.adsStats?.fireRate.removeZerosFromEnd() ?? "0") + "rounds/sec", change: getDifference(prev: weapon.weaponStats?.fireRate ?? 0, current: weapon.weaponStats?.adsStats?.fireRate ?? 0))
                                        
                                        StatChangeComponent(heading: "Run Speed Multiplier: ", value: (weapon.weaponStats?.adsStats?.runSpeedMultiplier.removeZerosFromEnd() ?? "0") + "x", change: getDifference(prev: weapon.weaponStats?.runSpeedMultiplier ?? 0, current: weapon.weaponStats?.adsStats?.runSpeedMultiplier ?? 0))
                                        
                                        StatChangeComponent(heading: "First Bullet Accuracy: ", value: ((weapon.weaponStats?.adsStats?.firstBulletAccuracy ?? 0)*100).removeZerosFromEnd() + "%", change: getDifference(prev: weapon.weaponStats?.firstBulletAccuracy ?? 0, current: weapon.weaponStats?.adsStats?.firstBulletAccuracy ?? 0))
                                    }
                                    
                                    Seperator()
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width - 30)
                            
                            
                            
                            VStack(alignment: .center, spacing: 24) {
                                if weapon.weaponStats?.damageRanges != nil {
                                    HeadingComponent(heading: "Damage Ranges")
                                    
                                    ScrollView(.vertical, showsIndicators: false) {
                                        VStack(alignment: .center, spacing: 24) {
                                            ForEach(weapon.weaponStats?.damageRanges ?? [], id: \.self) { damage in
                                                VStack {
                                                    Text("\(damage.rangeStartMeters)-\(damage.rangeEndMeters)")
                                                        .foregroundColor(.text)
                                                        .font(.title2)
                                                        .fontWeight(.bold)
                                                    
                                                    HStack {
                                                        Text("Head: ")
                                                            .foregroundColor(.text)
                                                            .fontWeight(.bold)
                                                            .font(.title2)
                                                        
                                                        Spacer(minLength: 0)
                                                        
                                                        Text(damage.headDamage.removeZerosFromEnd())
                                                            .foregroundColor(.text)
                                                            .fontWeight(.medium)
                                                            .font(.title2)
                                                    }
                                                    
                                                    HStack {
                                                        Text("Body: ")
                                                            .foregroundColor(.text)
                                                            .fontWeight(.bold)
                                                            .font(.title2)
                                                        
                                                        Spacer(minLength: 0)
                                                        
                                                        Text(damage.bodyDamage.precisionTo2())
                                                            .foregroundColor(.text)
                                                            .fontWeight(.medium)
                                                            .font(.title2)
                                                    }
                                                    
                                                    HStack {
                                                        Text("Legs: ")
                                                            .foregroundColor(.text)
                                                            .fontWeight(.bold)
                                                            .font(.title2)
                                                        
                                                        Spacer(minLength: 0)
                                                        
                                                        Text(damage.legDamage.removeZerosFromEnd())
                                                            .foregroundColor(.text)
                                                            .fontWeight(.medium)
                                                            .font(.title2)
                                                    }
                                                }
                                                .frame(width: UIScreen.main.bounds.width / 2 - 10)
                                            }
                                        }
                                    }
                                    Seperator()
                                }
                                
                            }
                                
                                
                          
                            
                            // MARK: Skins Section
                            VStack(spacing: 24) {
                                HeadingComponent(heading: "Skins")
                                
                                VStack {
                                    ForEach(weapon.skins, id: \.self) { skin in
                                        VStack(alignment: .center, spacing: 12) {
                                            Text(skin.displayName)
                                                .foregroundColor(.text)
                                                .font(.title3)
                                                .fontWeight(.bold)
                                            
                                            ImageComponent(imgUrl: skin.chromas[0].fullRender, width: UIScreen.main.bounds.width - 10)
                                            
                                            Divider()
                                            
                                        }
                                    }
                                }
                            }
                            
                            
                        }
                        .padding(.top, 50)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height)
        .background(Color.background)
        .preferredColorScheme(.dark)
        .navigationBarBackButtonHidden()
    }
    
    private func getRatio(val: String, high: Double, low: Double, highValBetter: Bool) -> Double {
        if (highValBetter == true) {
            return val.getNumber()/high
        } else {
            return 1 - ((val.getNumber() - low) / ((high - low)*105/100))
            // 1 - (Val - low) / (high-low) + 5% of (high - low)
        }
    }
    
    private func getDifference(prev: Double, current: Double) -> String {
        return "\(((current - prev)/prev * 100).rounded()) %"
    }
}

//struct WeaponCard_Previews: PreviewProvider {
//    static var previews: some View {
//        WeaponCard()
//    }
//}
