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
    
    @IBOutlet weak var toTableView: UITableView!
    @IBOutlet weak var fromTableView: UITableView!
    @IBOutlet weak var toCityName: UILabel!
    @IBOutlet weak var fromCityName: UILabel!
    @IBOutlet weak var search: UIButton!
    @IBOutlet weak var change: UIButton!
    @IBOutlet weak var toCity: UITextField!
    @IBOutlet weak var fromCity: UITextField!
    var cityIDandName: [String:String] = [:]
    var cityinfo: CityModel?
    var policyinfo: policy?
    var fromcityid: String = "10191"
    var tocityid: String = "10349"
    var IndexPath: IndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()
        RequestCity()
        toCity.delegate = self
        fromCity.delegate = self
        toTableView.delegate = self
        toTableView.dataSource = self
        fromTableView.delegate = self
        fromTableView.dataSource = self
        //print(cityIDandName["深圳"])
        RequestTravel()
        search.addTarget(self, action: #selector(searchAnswer), for: .touchUpInside)
        change.addTarget(self, action: #selector(changeAnswer), for: .touchUpInside)
    }
    
    @objc func changeAnswer(){
        let to = toCityName.text
        let from = fromCity.text
        fromCity.text = to
        toCity.text = from
        toCityName.text = from
        fromCityName.text = to
        fromcityid = cityIDandName["\(fromCity.text!)"]!
        tocityid = cityIDandName["\(toCity.text!)"]!
        RequestTravel()
    }
    
    @objc func searchAnswer(){
        if toCity.text != nil && fromCity.text != nil{
            fromcityid = cityIDandName["\(fromCity.text!)"]!
            tocityid = cityIDandName["\(toCity.text!)"]!
            fromCityName.text = fromCity.text
            toCityName.text = toCity.text
            RequestTravel()
        }
        
        
    }


}

extension TravelViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == fromTableView{
           let cell = tableView.dequeueReusableCell(withIdentifier: "policyCell1",for: indexPath) as! PolicyTableViewCell
            //cell.label.adjustsFontSizeToFitWidth = true
            cell.label.numberOfLines = 0
            cell.label.textAlignment = .left
            if let label = policyinfo?.result.from_info.low_in_desc{
                cell.label.text = label
            }
            //print(cell.label.text)
        return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "policyCell2",for: indexPath) as! Policy2TableViewCell
            //cell.label.adjustsFontSizeToFitWidth = true
            cell.label.numberOfLines = 0
            cell.label.textAlignment = .left
            if let label = policyinfo?.result.to_info.low_in_desc{
                cell.label.text = label
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 700
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
