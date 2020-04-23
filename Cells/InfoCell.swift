//
//  InfoCell.swift
//  Coloring game
//
//  Created by Mikhail Ladutska on 4/18/20.
//  Copyright © 2020 Mikhail Ladutska. All rights reserved.
//

import UIKit

class InfoCell: UICollectionViewCell {
    
    static let reuseID = "newCell"
    
    var infoModel: InfoModel? {
        didSet {
            guard let imageName = infoModel?.imageName else { return }
            guard let labelText = infoModel?.labelText else { return }
            
            infoImage.image = UIImage(named: imageName)
            infoLabel.text = labelText
        }
    }
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial Rounded MT Pro Cyr", size: 12)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    let infoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.widthAnchor.constraint(equalToConstant: 122).isActive = true
        self.heightAnchor.constraint(equalToConstant: 122).isActive = true
        
        
        addSubview(infoImage)
        infoImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 46).isActive = true
        infoImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -46).isActive = true
        infoImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 25).isActive = true

        addSubview(infoLabel)
        infoLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 17.73).isActive = true
        infoLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -17.73).isActive = true
      //  infoLabel.topAnchor.constraint(equalTo: infoImage.bottomAnchor, constant: 18.2).isActive = true
        infoLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 17.75).isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
}
