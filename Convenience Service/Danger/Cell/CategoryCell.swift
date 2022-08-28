//
//  CategoryCell.swift
//  Convenience Service
//
//  Created by mac on 2022/8/28.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var textlabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        contentView.backgroundColor = selected ? .systemBackground : .clear
        textlabel.font = selected ? .boldSystemFont(ofSize: 15) : .systemFont(ofSize: 15)
        textlabel.textColor = selected ? .label : .secondaryLabel
        // Configure the view for the selected state
    }

}
