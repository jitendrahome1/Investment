//
//  InvestmentCell.swift
//  Investment
//
//  Created by Jitendra Kumar Agarwal on 05/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class InvestmentCell: BaseTableViewCell {

    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var lblFolderCreatDate: UILabel!
    @IBOutlet weak var lblFolderTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewBG.cornerRadius(value: 8.0)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

   
    }
}


