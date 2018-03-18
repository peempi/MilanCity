//
//  ArtAndMuseum.swift
//  MilanCity
//
//  Created by Federico Castelli on 18/03/18.
//  Copyright © 2018 Pimpi. All rights reserved.
//

import Foundation
import UIKit

enum ArtAndMuseumCategory {
    case artistic
    case historical
    case architecture
    case hipster
}

enum ArtAndMuseum {
    
    case hangarBicocca
    case museoCivicoDiStoriaNaturale
    case mudec
    
    func getPriceIntero() -> Int {
        switch self {
        case .hangarBicocca: return 5
        case .museoCivicoDiStoriaNaturale: return 10
        case .mudec: return 15
        }
    }
        
    func getPriceBambini() -> Int {
        switch self {
        case .hangarBicocca: return 3
        case .museoCivicoDiStoriaNaturale: return 5
        case .mudec: return 9
        }
    }
            
    func getPriceRidotto() -> Int {
        switch self {
        case .hangarBicocca: return 4
        case .museoCivicoDiStoriaNaturale: return 6
        case .mudec: return 13
        }
    }
            
    func getCaterory() -> ArtAndMuseumCategory {
        switch self {
        case .hangarBicocca: return .artistic
        case .museoCivicoDiStoriaNaturale: return .artistic
        case .mudec: return .hipster
        }
    }
    
    func getImage() -> UIImage {
        switch self {
        case .hangarBicocca: return #imageLiteral(resourceName: "bicocca")
        case .museoCivicoDiStoriaNaturale: return #imageLiteral(resourceName: "museo-storia-nat")
        case .mudec: return #imageLiteral(resourceName: "mudec")
        }
    }
    
    func getImageOpaque() -> UIImage {
        switch self {
        case .hangarBicocca: return #imageLiteral(resourceName: "mudec-opaque")
        case .museoCivicoDiStoriaNaturale: return #imageLiteral(resourceName: "mudec-opaque")
        case .mudec: return #imageLiteral(resourceName: "mudec-opaque")
        }
    }
    func getName() -> String {
        switch self {
        case .hangarBicocca: return "HANGAR BICOCCA"
        case . museoCivicoDiStoriaNaturale: return "MUSEO CIVICO DI STORIA NATURALE"
        case .mudec: return "MUDEC - MUSEO DELLE CULTURE"
        }
    }
    
    func getStreet() -> String {
        switch self {
        case .hangarBicocca: return "via Chiesa, 2"
        case .museoCivicoDiStoriaNaturale: return "corso Venezia, 5"
        case .mudec: return "via Tortone, 56"
        }
    }
    
    func getTitle() -> String {
        switch self {
        case .hangarBicocca: return "HANGAR BICOCCA"
        case .museoCivicoDiStoriaNaturale: return "MUSEO CIVICO DI STORIA NATURALE"
        case .mudec: return "MUDEC"
        }
    }
    
    func getSubtitle() -> String {
        switch self {
        case .hangarBicocca: return "EVA Kot'árková".uppercased()
        case .museoCivicoDiStoriaNaturale: return ""
        case .mudec: return "MUSEO DELLE CULTURE"
        }
    }
    
    static func allCases() -> [ArtAndMuseum] {
        return [
            .hangarBicocca,
            .museoCivicoDiStoriaNaturale,
            .mudec
        ]
    }
}

class ArtAndMuseumSource {
    
    /// All countries supported by LogUp
    static var artAndMuseums: [ArtAndMuseum] {
        return ArtAndMuseum.allCases().sorted() { (artAndMuseum1: ArtAndMuseum, artAndMuseum2: ArtAndMuseum) in
            artAndMuseum1.getName() < artAndMuseum2.getName()
        }
    }
    
    static func searchArtAndMuseums(withCategory category: ArtAndMuseumCategory) -> [ArtAndMuseum] {
        return artAndMuseums.filter { (artAndMuseum: ArtAndMuseum) in
            return artAndMuseum.getCaterory() == category ? true : false
        }
    }
}
