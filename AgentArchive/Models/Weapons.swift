//
//  Weapons.swift
//  AgentArchive
//
//  Created by Saarthak Tuli on 18/07/23.
//

import Foundation

struct Weapons: Codable, Hashable {
    var status: Int
    var data: [Weapon]
}

struct Weapon: Codable, Hashable {
    var uuid: String
    var displayName: String
    var category: String
    var defaultSkinUuid: String
    var displayIcon: String
    var killStreamIcon: String
    var assetPath: String
    var weaponStats: WeaponStats?
    var shopData: ShopData?
    var skins: [Skins]
}

struct ShopData: Codable, Hashable {
    var cost: Int
    var category: String
    var categoryText: String
    var gridPosition: GridPosition?
    var canBeTrashed: Bool
    var image: String?
    var newImage: String?
    var newImage2: String?
    var assetPath: String
}

struct GridPosition: Codable, Hashable {
    var row: Int
    var column: Int
}

struct Skins: Codable, Hashable {
    var uuid: String
    var displayName: String
    var themeUuid: String
    var contentTierUuid: String?
    var displayIcon: String?
    var wallpaper: String?
    var assetPath: String
    var chromas: [Chroma]
    var levels: [Level]
}

struct Chroma: Codable, Hashable {
    var uuid: String
    var displayName: String
    var displayIcon: String?
    var fullRender: String
    var swatch: String?
    var streamedVideo: String?
    var assetPath: String
}

struct Level: Codable, Hashable {
    var uuid: String
    var displayName: String
    var levelItem: String?
    var displayIcon: String?
    var streamedVideo: String?
    var assetPath: String
}

struct WeaponStats: Codable, Hashable {
    var fireRate: Double
    var magazineSize: Int
    var runSpeedMultiplier: Double
    var equipTimeSeconds: Double
    var reloadTimeSeconds: Double
    var firstBulletAccuracy: Double
    var shotgunPelletCount: Int
    var wallPenetration: String?
    var feature: String?
    var fireMode: String?
    var altFireType: String?
    var adsStats: AdsStats?
    var altShotgunStats: AltShotgunStats?
    var airBurstStats: AirBurstStats?
    var damageRanges: [DamageRange]
}

struct AdsStats: Codable, Hashable {
    var zoomMultiplier: Double
    var fireRate: Double
    var runSpeedMultiplier: Double
    var burstCount: Int
    var firstBulletAccuracy: Double
}

struct AirBurstStats: Codable, Hashable {
    var shotgunPelletCount: Int
    var burstDistance: Double
}

struct AltShotgunStats: Codable, Hashable {
    var shotgunPelletCount: Int
    var burstRate: Double
}

struct DamageRange: Codable, Hashable {
    var rangeStartMeters: Int
    var rangeEndMeters: Int
    var headDamage: Double
    var bodyDamage: Int
    var legDamage: Double
}

// MARK: For bars
struct WeaponStatHighest: Codable, Hashable {
    var fireRate: Double
    var magazineSize: Int
    var maxReloadTime: Double
    var minReloadTime: Double
    var maxEquipTime: Double
    var minEquipTime: Double
}
