//
//  function.swift
//  Convenience Service
//
//  Created by mac on 2022/8/26.
//

import UIKit
import SwiftyJSON
import Alamofire
import Kingfisher

let newsApiKey1 = "9417547417f4a43a945b6ed4b467c917"
let newsApiKey2 = "c624f80fda6dcc7701845509a8c75482"

extension Home{
    
func Request(){
    AF.request("http://v.juhe.cn/toutiao/index?type=top&key=\(newsApiKey1)").responseJSON { response in
                if let data = response.value{
                    let newsJSON = JSON(data)
                    //print(newsJSON)
                    let newsData = try! newsJSON.rawData()
                    //print(newsData)
                   // print(newsJSON["result","data",0,"title"].stringValue)
                    
                   // print(newsJSON["result","data",0,"thumbnail_pic_s"].stringValue)
                    do{
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                         let news = try decoder.decode(NewsModel.self, from: newsData)
                        self.news = news
                        //print(news.result.data)
                        for i in 0..<10{
                            //print(item)
                            if URL(string: newsJSON["result","data",i,"thumbnail_pic_s"].stringValue) == nil{
                                continue
                            }else{
                                let image = newsJSON["result","data",i,"thumbnail_pic_s"].stringValue
                                let title = newsJSON["result","data",i,"title"].stringValue
                                let url = newsJSON["result","data",i,"url"].url
                                self.imagewhile.images.append(URL(string: image)!)
                                self.imagewhile.title.append(title)
                                self.imagewhile.url.append(url!)
                                self.whileIndex.append(i)
                            }
                        }
                        for i in 10..<30{
                            if URL(string: newsJSON["result","data",i,"thumbnail_pic_s"].stringValue) == nil{
                                continue
                            }else{
                                let image = newsJSON["result","data",i,"thumbnail_pic_s"].stringValue
                                let title = newsJSON["result","data",i,"title"].stringValue
                                let url = newsJSON["result","data",i,"url"].url
                                self.imageTable.images.append(URL(string: image)!)
                                self.imageTable.title.append(title)
                                self.imageTable.url.append(url!)
                                self.whileIndex.append(i)
                            }
                        }
                        self.cycleView1.reloadItemsCount(self.imagewhile.images.count)
                        self.cycleView1.reloadInputViews()
                        self.tableView.reloadData()
                        //print(self.imagewhile.images)
                    }catch{
                        print(error)
                    }
                }
            }
}
}
