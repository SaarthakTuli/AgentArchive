//
//  Agent.swift
//  AgentArchive
//
//  Created by Saarthak Tuli on 17/07/23.
//

import Foundation


struct Agents: Codable, Hashable {
    var status: Int32
    var data: [Agent]
}

struct Agent: Codable, Hashable {
    var uuid: String
    var displayName: String
    var description: String
    var developerName: String
    var characterTags: [String]?
    var displayIcon: String
    var displayIconSmall: String
    var bustPortrait: String?
    var fullPortrait: String?
    var fullPortraitV2: String?
    var killPortrait: String?
    var background: String?
    var backgroundGradientColors: [String]?
    var assetPath: String?
    var isFullPortraitRightFacing: Bool
    var isPlayableCharacter: Bool
    var isAvailableForTest: Bool
    var isBestContent: Bool?
    var role: AgentRole?
    var abilities: [AgentAbilities]
    var voiceLine: AgentVoiceLine?
}

struct AgentRole: Codable, Hashable {
    var uuid: String
    var displayName: String
    var description: String
    var displayIcon: String
    var assetPath: String
}

struct AgentAbilities: Codable, Hashable {
    var slot: String
    var displayName: String
    var description: String
    var displayIcon: String?
}

struct AgentVoiceLine: Codable, Hashable {
    var description: String?
    var mediaList: [MediaList]
    
    struct MediaList: Codable, Hashable {
        var id: Int32
        var wwise: String
        var wave: String
    }
}
