//
//  DangerousModel.swift
//  Convenience Service
//
//  Created by mac on 2022/8/27.
//

import Foundation
import UIKit

// MARK: -风险区页model

struct DangerousModel: Codable{
    let result2: result2
    
    //高风险、中风险
    struct result2: Codable{
        let high_list: [detail2]
        let high_count: String
        let middle_list: [detail2]
        let middle_count: String
    }
}




struct detail2: Codable{
    let area_name: String
    let communitys: [String]
}


extension DangerousModel{
    enum CodingKeys:String, CodingKey{
        case result2 = "result"
    }
}
