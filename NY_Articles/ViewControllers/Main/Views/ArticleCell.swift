//
//  ArticleCell.swift
//  NY_Articles
//
//  Created by msheikh on 3/20/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var img: RoundedImage!
    @IBOutlet weak var tiitle: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var datelbl: UILabel!
    @IBOutlet weak var section: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
