//
//  Pokemon.swift
//  PokeDex2020
//
//  Created by Field Employee on 10/31/20.
//

import UIKit

struct Pokemon: Codable {
    let name: String
    let typeArray: [TypeElement]
    let abilities: [AbilityList]
    let id: Int
    let sprites: Sprites
    let movesArray: [Moves]
    
    enum CodingKeys: String, CodingKey {
        case typeArray = "types"
        case movesArray = "moves"
        case name, abilities, id, sprites
    }
}
struct TypeElement: Codable {
    let element: Type
    
    enum CodingKeys: String, CodingKey {
        case element = "type"
    }
}
struct Type: Codable {
    let elementName: String
    
    enum CodingKeys: String, CodingKey {
        case elementName = "name"
    }
}
struct AbilityList: Codable {
    let ability: Ability
}
struct Ability: Codable {
    let abilityName: String
    
    enum CodingKeys: String, CodingKey {
        case abilityName = "name"
    }
}
struct Sprites: Codable {
    let sprite: String
    
    enum CodingKeys: String, CodingKey {
        case sprite = "front_default"
    }
}
struct Moves: Codable {
    let move: MoveType
    
    enum CodingKeys: String, CodingKey {
        case move
    }
}
struct MoveType: Codable {
    let moveName: String
    
    enum CodingKeys: String, CodingKey {
        case moveName = "name"
    }
}

