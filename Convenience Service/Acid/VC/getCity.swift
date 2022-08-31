//
//  function3.swift
//  Convenience Service
//
//  Created by mac on 2022/8/29.
//

import UIKit
import Alamofire
import SwiftyJSON

extension AcidViewController{
    
    //获取城市信息
    func RequestCity(){
    AF.request("http://apis.juhe.cn/springTravel/citys?key=\(dangerApiKey1)").responseJSON { response in
        if let data = response.value{
            let cityJSON = JSON(data)
           // print(cityJSON)
            let cityData = try! cityJSON.rawData()
            do{
                let decoder = JSONDecoder()
                let cityinfo = try decoder.decode(CityModel1.self, from: cityData)
                //print(cityinfo)
                self.cityinfomation = cityinfo
                if let cityinfo = self.cityinfomation{
                for i in cityinfo.result{
                    let citys = i
                    for j in citys.citys{
                        self.cityIDandName[j.city] = j.city_id
                    }
                }
                }
                //print(self.cityIDandName)
            }catch{
                print(error)
            }
            self.AcidTableView.reloadData()
        }
    }
    }
    
    //获取出行政策
   
}
