//
//  Extensions.swift
//  AgentArchive
//
//  Created by Saarthak Tuli on 17/07/23.
//

import Foundation
import SwiftUI


extension Color {
    static let background = Color("background")
    static let text = Color("text")
    
    init(hex: String) {
            let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
            var int: UInt64 = 0
            Scanner(string: hex).scanHexInt64(&int)
            let a, r, g, b: UInt64
            switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (1, 1, 1, 0)
            }

            self.init(
                .sRGB,
                red: Double(r) / 255,
                green: Double(g) / 255,
                blue:  Double(b) / 255,
                opacity: Double(a) / 255
            )
        }
}



extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
}


extension String {
    func fixColor() -> String {
        return "#" + String(self.prefix(6))
    }
    
    func getNumber() -> Double {
        return Double(self.split(separator: " ")[0]) ?? 0
    }
    
    func getMode() -> String {
        return "\(self.split(separator: "::")[1])"
    }
    
    func getLatAndLong() -> [Double] {
        let arr = self.split(separator: " ")
        let lat = arr[0].replacing("°", with: ".")
        let lon = arr[1].replacing("°", with: ".")
        
        return [Double(lat) ?? 0, Double(lon) ?? 0]
    }
}

extension Int {
    func precisionTo2() -> String {
        return "\(self).00"
    }
}
