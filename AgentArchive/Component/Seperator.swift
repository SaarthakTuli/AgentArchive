//
//  Seperator.swift
//  AgentArchive
//
//  Created by Saarthak Tuli on 18/07/23.
//

import SwiftUI

struct Seperator: View {
    var body: some View {
        Rectangle()
            .fill(Color.background)
            .shadow(color: Color(hex: "#FD4556"), radius: 1)
            .frame(width: UIScreen.main.bounds.width, height: 1)
    }
}

struct Seperator_Previews: PreviewProvider {
    static var previews: some View {
        Seperator()
    }
}
