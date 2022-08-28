//
//  HomeModel.swift
//  Convenience Service
//
//  Created by mac on 2022/8/25.
//

import UIKit

// MARK: - 主页所有数据
struct NewsModel: Codable{
    let result: result
    
    struct result: Codable{
        let data: [detail]
    }
}

// MARK: - 每条新闻详细信息

struct detail:Codable{
    //新闻图片
    var thumbnail_pic_s: URL?
    //日期
    let date: String
    //标题
    let title: String
    //新闻id
    let uniquekey: String
    //来源
    let authorName: String
    //网址
    let url:URL
}

// MARK: - 轮播图中的图片
class imageWhile {
    var images: [URL] = []
    var title: [String] = []
}

class imageTableView {
    var images: [URL] = []
    var title: [String] = []
}
