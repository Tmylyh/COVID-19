////
////  ViewController.swift
////  Convenience Service
////
////  Created by mac on 2022/8/25.
////
//
//import UIKit
//import Alamofire
//import SwiftyJSON
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//
//        AF.request("http://v.juhe.cn/toutiao/index?type=top&key=9417547417f4a43a945b6ed4b467c917").responseJSON { response in
//            if let data = response.value{
//                let newsJSON = JSON(data)
//                let newsData = try! newsJSON.rawData()
//                do{
//                    let decoder = JSONDecoder()
//                    decoder.keyDecodingStrategy = .convertFromSnakeCase
//                    let news = try decoder.decode(NewsModel.self, from: newsData)
//                    print(news.result.data[0].title)
//                }catch{
//                    print(error)
//                }
//            }
//        }
////        AF.request("http://apis.juhe.cn/springTravel/risk?key=8d5d3b91d6db3c50b0f3e96bdc022c05").responseJSON { response in
////            if let data = response.value{
////                let travelJSON = JSON(data)
////                print(travelJSON)
////            }
////        }
//        //        AF.request("http://apis.juhe.cn/fapig/nba/query?key=dea369fc19114d506d598032f18daee0").responseJSON { response in
//        //            if let data = response.value{
//        //                let nbaJSON = JSON(data)
//        //                print(nbaJSON)
//        //            }
//        //        }
//    }
//
//
//}
//
