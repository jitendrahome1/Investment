//
//  MenuListCell.swift
//  Investment
//
//  Created by Jitendra Kumar Agarwal on 02/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class MenuListCell: BaseTableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgIcone: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
