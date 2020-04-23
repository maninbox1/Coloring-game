//
//  ShopTableViewCell.swift
//  Coloring game
//
//  Created by Mikhail Ladutska on 4/21/20.
//  Copyright © 2020 Mikhail Ladutska. All rights reserved.
//

import UIKit

class ShopTableViewCell: UITableViewCell {

    static let reuseId = "shopCell"
    
    var shopping: Shopping? {
        didSet {
            guard let shop = shopping else { return }
            
            scoreLabel.text = "\(shop.score)"
            bonusLabel.isHidden = shop.bonusIsHidden
            bonusLabel.text = shop.bonusText
            detailsLabel.isHidden = shop.detailLabelIsHidden
            detailsLabel.text = shop.detailLabelText
            priceLabel.text = shop.price
        }
    }
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var bonusLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    

}
