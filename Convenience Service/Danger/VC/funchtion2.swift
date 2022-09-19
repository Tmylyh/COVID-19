//
//  File.swift
//  Convenience Service
//
//  Created by mac on 2022/8/26.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

let dangerApiKey1 = "8d5d3b91d6db3c50b0f3e96bdc022c05"
let dangerApiKey2 = "7ac51264c8c41debcfb021d373d9405c"
extension DangerViewController{
    func Request(){
        AF.request("http://apis.juhe.cn/springTravel/risk?key=\(dangerApiKey1)").responseJSON { request in
            if let data = request.value{
                let dangerJSON = JSON(data)
                //print(dangerJSON)
                let dangerousData = try! dangerJSON.rawData()
                //print(dangerousData)
                do{
                    let decoder = JSONDecoder()
                    //decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let dangerouslocation = try decoder.decode(DangerousModel.self, from: dangerousData)
                    //print(dangerouslocation)
                    self.dangerousLocation = dangerouslocation
                }catch{
                    print(error)
                }
                self.TableView2.reloadData()
            }
        }
    }
}
