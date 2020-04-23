//
//  SecondStaticTableViewCell.swift
//  Coloring game
//
//  Created by Mikhail Ladutska on 4/21/20.
//  Copyright © 2020 Mikhail Ladutska. All rights reserved.
//

import UIKit

class SecondStaticTableViewCell: UITableViewCell {

    static let reuseId = "cell2"
    
    @IBOutlet weak var watchVideoButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        watchVideoButton.layer.cornerRadius = 16

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func watchVideoButtonTapped(_ sender: Any) {
        print("show video")
    }
    
}
