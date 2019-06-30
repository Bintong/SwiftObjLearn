//
//  NormalTableViewCell.swift
//  SwiftObjLearn
//
//  Created by BinTong on 2019/6/28.
//  Copyright © 2019 tongbin. All rights reserved.
//

import UIKit

class NormalTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.accessoryView?.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: self.frame.size.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
