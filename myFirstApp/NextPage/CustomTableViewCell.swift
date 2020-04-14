 //
//  CustomTableViewCell.swift
//  myFirstApp
//
//  Created by Sind Bad on 13.04.2020.
//  Copyright © 2020 Still Beat. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
