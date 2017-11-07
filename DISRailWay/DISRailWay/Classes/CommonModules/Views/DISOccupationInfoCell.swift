//
//  DISOccupationInfoCell.swift
//  DISRailWay
//
//  Created by dis on 2017/11/01.
//  Copyright © 2017年 jp.co.disol. All rights reserved.
//

import UIKit

enum DISOccupationInfoCellStatus: Int {
    case none = 0
    case required = 1
}

class DISOccupationInfoCell: UITableViewCell {
    
    @IBOutlet weak var infoBackground: UIView!
    
    var status: DISOccupationInfoCellStatus? {
        didSet {
            if status?.rawValue == 0 {
                infoBackground.backgroundColor = UIColor.white
                inputRequiredLabel.isHidden = true
            }
            
            if status?.rawValue == 1 {
                infoBackground.backgroundColor = UIColor.yellow
                inputRequiredLabel.isHidden = false
            }
        }
    }
    /// 名称
    @IBOutlet weak var infoNameLabel: UILabel!
    /// 必須選択肢
    @IBOutlet weak var inputRequiredLabel: UILabel!
    /// 結果
    @IBOutlet weak var resultLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

    func setResultLabel(with text:String) {
        resultLabel.text = text
    }
    
}
