//
//  function4.swift
//  Convenience Service
//
//  Created by mac on 2022/8/30.
//

import UIKit
import Alamofire
import SwiftyJSON

extension AcidViewController{
    func RequestAcid(){
        AF.request("http://apis.juhe.cn/springTravel/hsjg?key=\(dangerApiKey1)&city_id=\(cityapi)").responseJSON { request in
            if let data = request.value{
                let AcidJSON = JSON(data)
                //print(AcidJSON)
                let AcidData = try! AcidJSON.rawData()
                
                do{
                    let decoder = JSONDecoder()
                    let AcidLocation = try decoder.decode(AcidModel.self, from: AcidData)
                    self.AcidLocation = AcidLocation
                    //print(AcidLocation)
                    
                }catch{
                    print(error)
                }
                self.AcidTableView.reloadData()
            }
        }
    }
}
