//
//  AudioComponent.swift
//  AgentArchive
//
//  Created by Saarthak Tuli on 17/07/23.
//

import SwiftUI
import AVKit


class SoundManager : ObservableObject {
    var audioPlayer: AVPlayer?

    func playSound(sound: String){
        if let url = URL(string: sound) {
            self.audioPlayer = AVPlayer(url: url)
        }
    }
}

struct AudioComponent: View {
    
    @State var song1 = false
    @StateObject private var soundManager = SoundManager()
    @State var audioLink: String
    
    var body: some View {
        Image(systemName: "airpodsmax")
            .font(.system(size: 25))
            .foregroundColor(Color.text)
            .padding(.trailing)
            .onTapGesture {
                soundManager.playSound(sound: audioLink)
                soundManager.audioPlayer?.play()
        }
    }
}
