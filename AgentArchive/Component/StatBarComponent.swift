//
//  StatBarComponent.swift
//  AgentArchive
//
//  Created by Saarthak Tuli on 18/07/23.
//

import SwiftUI

struct StatBarComponent: View {
    @State var heading: String
    @State var value: String
    @State var ratio: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            HStack(spacing: 12) {
                Text(heading)
                    .foregroundColor(.text)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text(value)
                    .foregroundColor(.text)
                    .font(.title2)
                    .fontWeight(.medium)
            }
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.6))
                    .frame(width: UIScreen.main.bounds.width - 30, height: 15)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(chooseColor(ratio: ratio))
                    .frame(width: (UIScreen.main.bounds.width - 30)*ratio, height: 15)
            }
        }
    }
    
    private func chooseColor(ratio: Double) -> Color {
        if (ratio <= 0.35) {
            return Color.red
        } else if (ratio > 0.35 && ratio < 0.7) {
            return Color.yellow
        } else {
            return Color.green
        }
    }
}

//struct StatBarComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        StatBarComponent(heading: "Fire Rate: ", value: "12 rounds/sec", highest: 16)
//            .preferredColorScheme(.dark)
//    }
//}
