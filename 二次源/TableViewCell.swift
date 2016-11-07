//
//  TableViewCell.swift
//  二次源
//
//  Created by 李建文 on 2016/10/16.
//  Copyright © 2016年 二次源. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var infoImage: UIImageView!
    
    @IBOutlet weak var Address: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
