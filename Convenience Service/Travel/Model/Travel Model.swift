//
//  Travel Model.swift
//  Convenience Service
//
//  Created by mac on 2022/8/29.
//

import Foundation

// MARK: - 城市清单model

struct CityModel: Codable{
    let result: [result]
    
}

struct result: Codable{
    let citys: [citys]
}

struct citys: Codable{
    let city_id: String
    let city: String
}

// MARK: - 出行政策

struct policy: Codable{
    let result: result6
}

struct result6: Codable{
    let from_info: po
    let to_info: po
}

struct po: Codable{
    let low_in_desc: String
}
