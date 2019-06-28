//
//  CustomCell.swift
//  SwiftObjLearn
//
//  Created by BinTong on 2019/6/28.
//  Copyright © 2019 tongbin. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    var titleLabel : UILabel?
    var subTitleLabel : UILabel?
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
        self.titleLabel = UILabel()
        self.contentView.addSubview(self.titleLabel!)
        self.subTitleLabel = UILabel()
        self.contentView.addSubview(self.subTitleLabel!)
        self.setupContent()
 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContent() {
        self.titleLabel?.frame = CGRect(x: 15, y: 5, width: 400, height: 20)
        self.titleLabel?.text = ""
        self.titleLabel?.textColor = UIColor.blue
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        self.subTitleLabel?.frame = CGRect(x: 15, y: 30, width: 400, height: 20)
        self.subTitleLabel?.text = ""
        self.subTitleLabel?.textColor = UIColor.red
        self.subTitleLabel?.font = UIFont.systemFont(ofSize: 14)
        
    }
    
    func buildWithModel(model : SongDetailModel) {
        self.titleLabel?.text = model.songName
        self.subTitleLabel?.text = model.songSingerName
    }
}
