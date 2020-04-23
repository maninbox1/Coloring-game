//
//  ChooseColorButtonsCell.swift
//  Coloring game
//
//  Created by Mikhail Ladutska on 4/20/20.
//  Copyright © 2020 Mikhail Ladutska. All rights reserved.
//

import UIKit

class ChooseColorButtonsCell: UICollectionViewCell {
    
    static let reuseId = "cell"
       

    
    let colorButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(colorButton)
        colorButton.layer.cornerRadius = colorButton.frame.size.width / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
