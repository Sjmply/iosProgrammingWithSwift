//
//  PetTableViewCell.swift
//  ExampleStoryboard
//
//  Created by Nguyen Duc Hoang on 7/16/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class PetTableViewCell: UITableViewCell {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
