//
//  CustomCell.swift
//  SwiftObjLearn
//
//  Created by BinTong on 2019/6/28.
//  Copyright © 2019 tongbin. All rights reserved.
//

import UIKit
import Kingfisher
class CustomCell: UITableViewCell {
    var titleLabel : UILabel?
    var subTitleLabel : UILabel?
    var headerImgView : UIImageView?
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
        self.headerImgView = UIImageView()
        self.contentView.addSubview(self.headerImgView!)

        self.setupContent()
 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContent() {
        self.titleLabel?.frame = CGRect(x: 70, y: 5, width: 400, height: 20)
        self.titleLabel?.text = ""
        self.titleLabel?.textColor = UIColor.blue
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        self.subTitleLabel?.frame = CGRect(x: 70, y: 30, width: 400, height: 20)
        self.subTitleLabel?.text = ""
        self.subTitleLabel?.textColor = UIColor.red
        self.subTitleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        
        self.headerImgView?.frame = CGRect(x: 15, y: 5, width: 40, height: 70)
        self.headerImgView?.kf.setImage(with: URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1561702812490&di=e3b8ebc2b17864f0852a597f7bc9abee&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn%2Fw600h538%2F20180207%2F29ff-fyrhcqz5863402.jpg"))
        self.headerImgView?.contentMode = .scaleAspectFill
        self.headerImgView?.clipsToBounds = true
    }
    
    func buildWithModel(model : SongDetailModel) {
        self.titleLabel?.text = model.songName
        self.subTitleLabel?.text = model.songSingerName
    }
}
