//
//  AcidViewController.swift
//  Convenience Service
//
//  Created by mac on 2022/8/30.
//

import UIKit
import Alamofire
import SwiftyJSON

class AcidViewController: UIViewController {

    var cityapi = "10191"
    var AcidLocation: AcidModel?
    var currentCity = ""
    @IBOutlet weak var AcidTableView: UITableView!
    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    var cityinfomation: CityModel1?
    var cityIDandName: [String:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RequestCity()
        searchText.becomeFirstResponder()
        searchButton.addTarget(self, action: #selector(search), for: .touchUpInside)
        AcidTableView.delegate = self
        AcidTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    @objc func search(){
        if !searchText.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            if (cityinfomation) != nil{
                cityapi = cityIDandName[searchText.text!] ?? "10191"
            }
        }
        searchText.resignFirstResponder()
        searchText.text = nil
        RequestAcid()
    }

  

}

extension AcidViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let num = AcidLocation?.result.data.count{
            return num
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AcidCell", for: indexPath) as! AcidTableViewCell
        cell.locationLabel.numberOfLines = 0
        cell.locationLabel.adjustsFontSizeToFitWidth = true
        cell.numberLabel.numberOfLines = 0
        cell.numberLabel.adjustsFontSizeToFitWidth = true
        cell.nameLabel.numberOfLines = 0
        cell.nameLabel.adjustsFontSizeToFitWidth = true
        if let label = AcidLocation?.result.data[indexPath.row].name{
            cell.nameLabel.text = label
            cell.numberLabel.text = AcidLocation!.result.data[indexPath.row].phone
            cell.locationLabel.text = AcidLocation!.result.data[indexPath.row].address
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
