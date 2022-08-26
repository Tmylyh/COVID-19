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
    
    // MARK: -轮播图
     lazy var cycleView1: ZCycleView = {
        let width = view.bounds.width - 20
        let cycleView1 = ZCycleView()
        cycleView1.placeholderImage = #imageLiteral(resourceName: "placeholder")
        cycleView1.scrollDirection = .horizontal
        cycleView1.delegate = self
        cycleView1.reloadItemsCount(images.count)
        cycleView1.itemZoomScale = 1.2
        cycleView1.itemSpacing = 10
        cycleView1.initialIndex = 1
        cycleView1.isAutomatic = true
        cycleView1.timeInterval = 5
//        cycleView1.isInfinite = false
        cycleView1.itemSize = CGSize(width: width - 50, height: (width - 150) / 1.3)
        return cycleView1
    }()

    // MARK: -TableView
    
    @IBOutlet weak var tableView: UITableView!
   
    // MARK: -布局
    var news: NewsModel?
    let imagewhile = imageWhile()
    let imageTable = imageTableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.layer.cornerRadius = 20
        Request()
        view.addSubview(cycleView1)
        cycleView1.snp.makeConstraints {
            $0.left.equalTo(10)
            $0.top.equalTo(30)
            $0.right.equalTo(-10)
            $0.height.equalTo(cycleView1.snp.width)
        }
    }

}

// MARK: - 轮播图
extension Home: ZCycleViewProtocol{
    func cycleViewRegisterCellClasses() -> [String: AnyClass] {
        return ["CustomCollectionViewCell": CustomCollectionViewCell.self]
    }

    func cycleViewConfigureCell(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath, realIndex: Int) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
      
        
//        cell.imageView.image = images[realIndex]
        cell.label.font = .systemFont(ofSize: 16)
        //cell.label.layer.cornerRadius = 20
        cell.label.numberOfLines = 0
        cell.label.textAlignment = .left
        cell.label.adjustsFontSizeToFitWidth = true
        if let text = news?.result.data[realIndex].title{
            cell.imageView.kf.setImage(with: imagewhile.images[realIndex])
            cell.label.text = text}else{
                cell.label.text = "李跃行今天学会了snapkit"
            }
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

// MARK: - TableView
extension Home:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.labelTable.textAlignment = .left
        cell.labelTable.font = .systemFont(ofSize: 20)
        cell.labelTable.numberOfLines = 0
        cell.labelTable.adjustsFontSizeToFitWidth = true
        cell.labelTable.text = "我曾把完整的镜子打碎，夜晚的枕头都是眼泪，我多想过去重来，再给我一次机会"
        if let label = news?.result.data[indexPath.row + 7].title{
            cell.labelTable.text = label
            cell.imageTable.kf.setImage(with: imageTable.images[indexPath.row])
          //  cell.imageTable.contentMode = .scaleAspectFit
        }
        
//        if let image = news?.result.data[indexPath.row + 7].thumbnail_pic_s{
//            cell.imageTable.kf.setImage(with: image)
//        }else{
//            cell.imageTable.image = UIImage(named: "p700-300-1")
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageTable.images.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.width - 270
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
