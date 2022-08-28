//
//  DangerViewController.swift
//  Convenience Service
//
//  Created by mac on 2022/8/26.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

let DangerousData = ["高风险地区","中风险地区"]


class DangerViewController: UIViewController {
    
    var dangerousLocation: DangerousModel?
    
    @IBOutlet weak var TableView2: UITableView!
    @IBOutlet weak var CategoryTableView: UITableView!
    
    var TableView2GoDown = true
    
    var TableView2CurrentContentOffsetY: CGFloat = 0//用于判断上滑下滑
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoryTableView.sectionHeaderTopPadding = 0
        TableView2.sectionHeaderTopPadding = 0
        //TableView3.register(TableViewCell2.self, forCellReuseIdentifier: "Cell2")
        //self.view.backgroundColor = .black
        TableView2.delegate = self
        TableView2.dataSource = self
        //TableView2.register(TableViewCell2.self, forCellReuseIdentifier: "Cell2")
        TableView2.register(UINib(nibName: "CategoryHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "CategoryHeaderID")
        
        CategoryTableView.delegate = self
        CategoryTableView.dataSource = self
        Request()
        CategoryTableView.selectRow(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .none)
        // Do any additional setup after loading the view.
    }
    

}

extension DangerViewController: UITableViewDelegate, UITableViewDataSource{
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if tableView == CategoryTableView{
             return 2
         }else{
         if section == 0{
             if let num = dangerousLocation?.result2.high_list.count{
                 return num
             }else{
                 return 4
             }
         }else{
             if let num = dangerousLocation?.result2.high_list.count{
                 return num
             }else{
                 return 4
             }
         }
         }
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         if tableView == CategoryTableView{
             let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCellID", for: indexPath) as! CategoryCell
             cell.textlabel.text = indexPath.row == 0 ? "高风险" : "中风险"
             return cell
         }else{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! TableViewCell2
        //cell.backgroundColor = .black
         cell.labelTable.adjustsFontSizeToFitWidth = true
         cell.labelTable.numberOfLines = 0
         cell.labelTable.textAlignment = .left
         if indexPath.section == 0{
             if let label = dangerousLocation?.result2.high_list[indexPath.row].area_name{
                 let label2 = dangerousLocation!.result2.high_list[indexPath.row].communitys[0]
                 cell.labelTable.text = label + " " + label2
             }
         }else{
             if let label = dangerousLocation?.result2.middle_list[indexPath.row].area_name{
                 let label2 = dangerousLocation!.result2.middle_list[indexPath.row].communitys[0]
                 cell.labelTable.text = label + " " + label2
             }
         }
        return cell
         }
    }

     func numberOfSections(in tableView: UITableView) -> Int {
         if tableView == CategoryTableView{
             return 1
         }else{
      return 2
    }
     }
    
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         return DangerousData[section]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        tableView == CategoryTableView ? 0 : 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == CategoryTableView{
            TableView2.scrollToRow(at: IndexPath(row: 0, section: indexPath.row), at: .top, animated: true)
            
            CategoryTableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
    
    //判断滚动方向
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let tableView = scrollView as! UITableView
        if tableView == TableView2{
            TableView2GoDown = TableView2CurrentContentOffsetY < tableView.contentOffset.y
            TableView2CurrentContentOffsetY = tableView.contentOffset.y
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        //向上滚动且因为拖拽或惯性
        if tableView == TableView2 && !TableView2GoDown && (TableView2.isDragging || TableView2.isDecelerating){
        CategoryTableView.selectRow(at: IndexPath(row: section, section: 0), animated: true, scrollPosition: .top)
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        if tableView == TableView2 && TableView2GoDown && (TableView2.isDragging || TableView2.isDecelerating){
            CategoryTableView.selectRow(at: IndexPath(row: section+1, section: 0), animated: true, scrollPosition: .top)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView == CategoryTableView{
            return nil
        }else{
            let categoryHeader = TableView2.dequeueReusableHeaderFooterView(withIdentifier: "CategoryHeaderID") as! CategoryHeader
            categoryHeader.CatergoryName.text = DangerousData[section] + "共计："
            if section == 0{
                if let count = dangerousLocation?.result2.high_count{
                    categoryHeader.CategoryNumber.text = count
                }
            }else{
                if let count = dangerousLocation?.result2.middle_count{
                    categoryHeader.CategoryNumber.text = count
                }
            }
            return categoryHeader
        }
    }
    
    
}
