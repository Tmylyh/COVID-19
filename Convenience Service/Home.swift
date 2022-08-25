//
//  Home.swift
//  Convenience Service
//
//  Created by mac on 2022/8/25.
//

import UIKit
import Alamofire
import SwiftyJSON
import SnapKit
import Kingfisher

class Home: UIViewController {

    let images = [UIImage(named: "p700-300-1"),
                  UIImage(named: "p700-300-2"),
                  UIImage(named: "p700-300-3"),
                  UIImage(named: "p700-300-4"),
                  UIImage(named: "p700-300-5")]
    
    private lazy var cycleView1: ZCycleView = {
        let width = view.bounds.width - 20
        let cycleView1 = ZCycleView()
        cycleView1.placeholderImage = #imageLiteral(resourceName: "placeholder")
        cycleView1.scrollDirection = .horizontal
        cycleView1.delegate = self

        cycleView1.itemZoomScale = 1.2
        cycleView1.itemSpacing = 10
        cycleView1.initialIndex = 1
        cycleView1.isAutomatic = true
        cycleView1.timeInterval = 2
//        cycleView1.isInfinite = false
        cycleView1.itemSize = CGSize(width: width - 50, height: width - 100)
        return cycleView1
    }()
    
    
    let imagewhile = imageWhile()
    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request("http://v.juhe.cn/toutiao/index?type=top&key=c624f80fda6dcc7701845509a8c75482").responseJSON { response in
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
                            //print(news.result.data)
                            for i in 0..<7{
                                //print(item)
                                if URL(string: newsJSON["result","data",i,"thumbnail_pic_s"].stringValue) == nil{
                                    continue
                                }else{
                                    let image = newsJSON["result","data",i,"thumbnail_pic_s"].stringValue
                                    self.imagewhile.images.append(URL(string: image)!)
                                }
                            }
                            self.cycleView1.reloadItemsCount(self.imagewhile.images.count)
                            self.cycleView1.reloadInputViews()
                            print(self.imagewhile.images)
                        }catch{
                            print(error)
                        }
                    }
                }
        
        view.addSubview(cycleView1)
        cycleView1.snp.makeConstraints {
            $0.left.equalTo(10)
            $0.top.equalTo(70)
            $0.right.equalTo(-10)
            $0.height.equalTo(cycleView1.snp.width)
        }
    }

}

extension Home: ZCycleViewProtocol{
    func cycleViewRegisterCellClasses() -> [String: AnyClass] {
        return ["CustomCollectionViewCell": CustomCollectionViewCell.self]
    }

    func cycleViewConfigureCell(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath, realIndex: Int) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
      
        cell.imageView.kf.setImage(with: imagewhile.images[realIndex])
        return cell
    }
    
    func cycleViewDidScrollToIndex(_ cycleView: ZCycleView, index: Int) {
        
    }
    
    func cycleViewConfigurePageControl(_ cycleView: ZCycleView, pageControl: ZPageControl) {
        pageControl.isHidden = false
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.pageIndicatorTintColor = .darkGray
        pageControl.frame = CGRect(x: 0, y: cycleView.bounds.height-25, width: cycleView.bounds.width, height: 25)
    }
}
