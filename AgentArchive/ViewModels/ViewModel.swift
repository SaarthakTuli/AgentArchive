//
//  ViewModel.swift
//  AgentArchive
//
//  Created by Saarthak Tuli on 17/07/23.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var agentList: [Agent] = []
    @Published var weaponList: [Weapon] = []
    @Published var mapList: [Map] = []
    
    @Published var weaponStatHighest: WeaponStatHighest = WeaponStatHighest(fireRate: 0, magazineSize: 0, maxReloadTime: 0, minReloadTime: 10, maxEquipTime: 0, minEquipTime: 10)
    @Published var language: String = "en-US"
    
    func getLanguage() {
        switch (Locale.current.languageCode) {
        case "ar": self.language = "ar-AE"
        case "de": self.language = "de-DE"
        case "en": self.language = "en-US"
        case "es": self.language = "es-ES"
        case "fr": self.language = "fr-FR"
        case "id": self.language = "id-ID"
        case "it": self.language = "it-IT"
        case "jp": self.language = "jp-JP"
        case "ko": self.language = "ko-KR"
        case "pl": self.language = "pl-PL"
        case "pt": self.language = "pt-BR"
        case "ru": self.language = "ru-RU"
        case "th": self.language = "th-TH"
        case "tr": self.language = "tr-TR"
        case "vi": self.language = "vi-VN"
        case "zh": self.language = "zh-CN"
        default: self.language = "en-US"
        }
    }
    
    let baseURL = "https://valorant-api.com/v1"
    
    func getAgentsAll() {
        guard let url = URL(string: baseURL + "/agents" + "?language=\(self.language)")
        else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
                    
            do {
                let agents = try! JSONDecoder().decode(Agents.self, from: data)
                
                DispatchQueue.main.async {
                    if (agents.status == 200) {
                        
                        for agent in agents.data {
                            if (agent.fullPortrait != nil) {
                                self?.agentList.append(agent)
                                
                            }
                        }
                        
                        
                    } else if (agents.status == 400) {
                        print("ERROR While fetching data")
                    }
                }
            } catch {
                print("ERROR While Decoding: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
    
    func getWeaponsAll() {
        guard let url = URL(string: baseURL + "/weapons" + "?language=\(self.language)")
        else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
                    
            do {
                let weapons = try! JSONDecoder().decode(Weapons.self, from: data)
                
                DispatchQueue.main.async { [self] in
                    if (weapons.status == 200) {
                        
                        for weapon in weapons.data {
                            self?.weaponList.append(weapon)
                            
                            // MARK: Finding the highest for bars
                            if ((weapon.weaponStats?.fireRate ?? 0) > self!.weaponStatHighest.fireRate) {
                                self!.weaponStatHighest.fireRate = weapon.weaponStats?.fireRate ?? 0
                            } // Fire Rate
                            
                            if ((weapon.weaponStats?.magazineSize ?? 0) > self!.weaponStatHighest.magazineSize) {
                                self!.weaponStatHighest.magazineSize = weapon.weaponStats?.magazineSize ?? 0
                            } // Magazine Size
                            
                            if ((weapon.weaponStats?.reloadTimeSeconds ?? 10) < self!.weaponStatHighest.minReloadTime) {
                                self!.weaponStatHighest.minReloadTime = weapon.weaponStats?.reloadTimeSeconds ?? 10
                            }
                            if ((weapon.weaponStats?.reloadTimeSeconds ?? 0) > self!.weaponStatHighest.maxReloadTime) {
                                self!.weaponStatHighest.maxReloadTime = weapon.weaponStats?.reloadTimeSeconds ?? 0
                            }// Reload Time
                            
                            if ((weapon.weaponStats?.equipTimeSeconds ?? 10) < self!.weaponStatHighest.minEquipTime) {
                                self!.weaponStatHighest.minEquipTime = weapon.weaponStats?.equipTimeSeconds ?? 10
                            }
                            if ((weapon.weaponStats?.equipTimeSeconds ?? 0) > self!.weaponStatHighest.maxEquipTime) {
                                self!.weaponStatHighest.maxEquipTime = weapon.weaponStats?.equipTimeSeconds ?? 0
                            }// Equip Time
                        }

                    } else if (weapons.status == 400) {
                        print("ERROR While fetching data")
                    }
                }
            } catch {
                print("ERROR While Decoding: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
    
    func getMapsAll() {
        guard let url = URL(string: baseURL + "/maps" + "?language=\(self.language)")
        else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
                    
            do {
                let maps = try! JSONDecoder().decode(Maps.self, from: data)
                
                DispatchQueue.main.async { [self] in
                    if (maps.status == 200) {
                        self?.mapList = maps.data
                    }
                    else if (maps.status == 400) {
                        print("ERROR While fetching data")
                    }
                }
            } catch {
                print("ERROR While Decoding: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
}
