//
//  InstructionCollectionViewCell.swift
//  Coloring game
//
//  Created by Mikhail Ladutska on 4/22/20.
//  Copyright © 2020 Mikhail Ladutska. All rights reserved.
//

import UIKit

class InstructionCollectionViewCell: UICollectionViewCell {
    
    var instructions: Instruction? {
        didSet {
            guard let instruct = instructions else { return }
            
            mainImageView.image = UIImage(named: instruct.image)
            nameLabel.text = instruct.title
            informationLabel.text = instruct.instruction
            priceLabel.text = instruct.price
            priceLabel.isHidden = instruct.priceIsHidden ?? false
            magicFillImage.isHidden = instruct.pictrureIsHidden ?? false
            
        }
    }
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var magicFillImage: UIImageView!
    

    
}
