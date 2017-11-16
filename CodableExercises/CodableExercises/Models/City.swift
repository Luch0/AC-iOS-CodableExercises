//
//  City.swift
//  CodableExercises
//
//  Created by Luis Calle on 11/16/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import Foundation

struct City: Codable {
    let id: Int
    let name: String
    let cord: CoordWrapper
    let main: MainWrapper
    let dt: Int
    let wind: WindWrapper
//    let rain: RainWrapper
    let clouds: CloudsWrapper
    let weather: WeatherWrapper
}

struct CoordWrapper: Codable {
    let lon: Double
    let lat: Double
}

struct MainWrapper: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Double
    let sea_level: Double
    let grnd_level: Double
    let humidity: Int
}

struct WindWrapper: Codable {
    let speed: Double
    let deg: Double
}

//struct RainWrapper: Codable {
//    let 3h: Double
//}

struct CloudsWrapper: Codable {
    let all: Int
}

struct WeatherWrapper: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
