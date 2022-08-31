//
//  AcidTableViewCell.swift
//  Convenience Service
//
//  Created by mac on 2022/8/30.
//

import UIKit

class AcidTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        // Configure the view for the selected state
    }
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: "AcidCell")
//        contentView.addSubview(nameLabel)
//        contentView.addSubview(locationLabel)
//        contentView.addSubview(numberLabel)
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        contentView.addSubview(nameLabel)
//        contentView.addSubview(locationLabel)
//        contentView.addSubview(numberLabel)
//    }
    

}
