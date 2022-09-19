//
//  PolicyTableViewCell.swift
//  Convenience Service
//
//  Created by mac on 2022/9/1.
//

import UIKit
import SnapKit

class PolicyTableViewCell: UITableViewCell {
    
    lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "policyCell1")
        contentView.addSubview(label)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        contentView.addSubview(label)
        setUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setUI(){
        label.snp.makeConstraints { make in
            make.left.top.bottom.right.equalTo(0)
        }
    }
}
