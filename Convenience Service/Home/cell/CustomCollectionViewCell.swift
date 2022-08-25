//
//  CustomCollectionViewCell.swift
//  Example for ZCycleView
//
//  Created by bigPro on 2021/3/12.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    lazy var imageView = UIImageView()
    lazy var label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.frame = contentView.bounds
       // label.frame = CGRect(x: 50, y: 20, width: 200, height: 100)
        
        label.backgroundColor = .brown
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(imageView).offset(180)
//            make.bottom.equalTo(imageView).offset(-20)
//            make.left.equalTo(imageView).offset(20)
//            make.right.equalTo(imageView).offset(-20)
           // make.edges.equalToSuperview().inset(UIEdgeInsets(top: 100, left: 20, bottom: 20, right: 50))
           // make.bottom.equalTo(20)
            make.left.equalTo(60)
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
