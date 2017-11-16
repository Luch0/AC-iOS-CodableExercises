//
//  Color.swift
//  CodableExercises
//
//  Created by Luis Calle on 11/16/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import Foundation

struct ColorScheme: Codable {
    let mode: String
    let colors: [Color]
}

struct Color: Codable {
    let name: NameWrapper
    let rgb: RGBWrapper
}

struct NameWrapper: Codable {
    let value: String
}

struct HexWrapper: Codable {
    let clean: String
}

struct RGBWrapper: Codable {
    let fraction: FractionWrapper
}

struct FractionWrapper: Codable {
    let r: Double
    let g: Double
    let b: Double
}
