//
//  TableViewCell.swift
//  Convenience Service
//
//  Created by mac on 2022/8/26.
//

import UIKit

class TableViewCell2: UITableViewCell {
    
    lazy var labelTable: UILabel = {
       let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "Cell2")
        contentView.addSubview(labelTable)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        contentView.addSubview(labelTable)
        setUI()
    }
    
    func setUI(){
        labelTable.snp.makeConstraints { make in
            make.left.top.bottom.right.equalTo(0)
        }
    }

}
