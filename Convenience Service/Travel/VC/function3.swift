//
//  function3.swift
//  Convenience Service
//
//  Created by mac on 2022/8/29.
//

import UIKit
import Alamofire
import SwiftyJSON

extension TravelViewController{
    
    //获取城市信息
    func RequestCity(){
    AF.request("http://apis.juhe.cn/springTravel/citys?key=\(dangerApiKey1)").responseJSON { response in
        if let data = response.value{
            let cityJSON = JSON(data)
           // print(cityJSON)
            let cityData = try! cityJSON.rawData()
            do{
                let decoder = JSONDecoder()
                let cityinfo = try decoder.decode(CityModel.self, from: cityData)
                //print(cityinfo)
                self.cityinfo = cityinfo
                if let cityinfo = self.cityinfo{
                for i in cityinfo.result{
                    let citys = i
                    for j in citys.citys{
                        self.cityIDandName[j.city] = j.city_id
                    }
                }
                }
                print(self.cityIDandName)
            }catch{
                print(error)
            }
        }
    }
    }
    
    //获取出行政策
    func RequestTravel(){
        AF.request("http://apis.juhe.cn/springTravel/query?key=\(dangerApiKey1)&from=10191&to=10349").responseJSON { request in
            if let data = request.value{
                let requestJSON = JSON(data)
                print(requestJSON)
            }
        }
    }
}
