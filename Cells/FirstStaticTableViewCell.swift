//
//  FirstStaticTableViewCell.swift
//  Coloring game
//
//  Created by Mikhail Ladutska on 4/21/20.
//  Copyright © 2020 Mikhail Ladutska. All rights reserved.
//

import UIKit

class FirstStaticTableViewCell: UITableViewCell {

    static let reuseId = "cell1"
    
    @IBOutlet weak var totalScoreLabel: UILabel!
    
    @IBOutlet weak var crossButton: UIButton!
    
    var totalScore = 0
    
    

}
