//
//  TableViewCell.swift
//  Convenience Service
//
//  Created by mac on 2022/8/26.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    lazy var labelTable: UILabel = {
       let label = UILabel()
        return label
    }()
    
    lazy var imageTable: UIImageView = {
        let imageTable = UIImageView()
        return imageTable
    }()
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "Cell")
        contentView.addSubview(imageTable)
        contentView.addSubview(labelTable)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        contentView.addSubview(imageTable)
        contentView.addSubview(labelTable)
        setUI()
    }
    
    func setUI(){
        labelTable.snp.makeConstraints { make in
            make.left.top.bottom.equalTo(0)
            make.right.equalTo(-137)
        }
        imageTable.snp.makeConstraints { make in
            make.right.top.bottom.equalTo(0)
            make.left.equalTo(250)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
