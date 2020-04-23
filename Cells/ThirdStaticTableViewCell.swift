//
//  ThirdStaticTableViewCell.swift
//  Coloring game
//
//  Created by Mikhail Ladutska on 4/21/20.
//  Copyright © 2020 Mikhail Ladutska. All rights reserved.
//

import UIKit

class ThirdStaticTableViewCell: UITableViewCell {
    
    static let reuseId = "cell3"

    @IBOutlet weak var joinButton: UIButton!
    
    @IBOutlet weak var unlockGiftLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupLabels()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    private func setupLabels() {
        
        let fullString = NSMutableAttributedString()
        
        let imageToAttach = NSTextAttachment()
        imageToAttach.image = UIImage(named: "small gift")
        
        let imageString = NSAttributedString(attachment: imageToAttach)
        
        fullString.append(imageString)
        fullString.append(NSAttributedString(string: " unlock gifts"))
        
        unlockGiftLabel.attributedText = fullString
        unlockGiftLabel.layer.cornerRadius = 24
        
        joinButton.layer.cornerRadius = 16
    }
    
}
