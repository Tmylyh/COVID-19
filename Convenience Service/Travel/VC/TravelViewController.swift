//
//  TravelViewController.swift
//  Convenience Service
//
//  Created by mac on 2022/8/29.
//

import UIKit
import Alamofire
import SwiftyJSON

class TravelViewController: UIViewController {
    
    var cityIDandName: [String:String] = [:]
    var cityinfo: CityModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        //RequestCity()
      RequestTravel()
    }
    



}
