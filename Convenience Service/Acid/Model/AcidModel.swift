//
//  File.swift
//  Convenience Service
//
//  Created by mac on 2022/8/30.
//

import Foundation
import UIKit

struct AcidModel: Codable{
    let result: AcidResult
}

struct AcidResult: Codable{
    let data: [detail3]
}

struct detail3: Codable{
    let name: String
    let address: String
    let phone: String
}
