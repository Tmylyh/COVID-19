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
    AF.request("http://apis.juhe.cn/springTravel/citys?key=\(dangerApiKey2)").responseJSON { response in
        if let data = response.value{
            let cityJSON = JSON(data)
            //print(cityJSON)
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
                //print(self.cityIDandName)
            }catch{
                print(error)
            }
        }
    }
    }
    
    //获取出行政策
    func RequestTravel(){
        AF.request("http://apis.juhe.cn/springTravel/query?key=\(dangerApiKey2)&from=\(fromcityid)&to=\(tocityid)").responseJSON { request in
            if let data = request.value{
                let requestJSON = JSON(data)
                let policyData = try! requestJSON.rawData()
                do{
                    let decoder = JSONDecoder()
                    let policyinfo = try decoder.decode(policy.self, from: policyData)
                    self.policyinfo = policyinfo
                    //print(policyinfo)
                   
                }catch{
                    print(error)
                }
                self.toTableView.reloadData()
                self.fromTableView.reloadData()
            }
        }
    }
}
