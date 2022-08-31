//
//  Travel Model.swift
//  Convenience Service
//
//  Created by mac on 2022/8/29.
//

import Foundation

// MARK: - 城市清单model

struct CityModel1: Codable{
    let result: [result1]
    
}

struct result1: Codable{
    let citys: [citys1]
}

struct citys1: Codable{
    let city_id: String
    let city: String
}
