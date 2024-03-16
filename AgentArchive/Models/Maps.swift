//
//  Maps.swift
//  AgentArchive
//
//  Created by Saarthak Tuli on 23/07/23.
//


import Foundation

// MARK: - Maps
struct Maps: Codable, Hashable {
    var status: Int
    var data: [Map]
}

// MARK: - Datum
struct Map: Codable, Hashable {
    var uuid: String
    var displayName: String
    var coordinates: String?
    var displayIcon: String?
    var listViewIcon: String
    var splash: String
    var assetPath: String
    var mapUrl: String
    var xMultiplier: Double
    var yMultiplier: Double
    var xScalarToAdd: Double
    var yScalarToAdd: Double
    var callouts: [Callout]?
}

// MARK: - Callout
struct Callout: Codable, Hashable {
    var regionName: String
    var superRegionName: String
    var location: Location
}

// MARK: - Location
struct Location: Codable, Hashable {
    var x: Double
    var y: Double
}
