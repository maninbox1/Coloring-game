//
//  CategoryCell.swift
//  Coloring game
//
//  Created by Mikhail Ladutska on 4/17/20.
//  Copyright © 2020 Mikhail Ladutska. All rights reserved.
//

import  UIKit


class CategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    weak var delegate: CollectionCellDelegate?

    
    var pictureCategory: PictureCategory? {
        didSet {
            if let name = pictureCategory?.title {
                titleLabel.text = name
            }
            if let image = pictureCategory?.categoryImage {
                categoryImage.image = UIImage(named: image)
            }
        }
    }

    let secondCellId = "secondCellId"


    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .none
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
       
        label.textAlignment = .left
        return label
    }()

    let categoryImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PictureCell.self, forCellWithReuseIdentifier: secondCellId)
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 60).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true

        addSubview(categoryImage)
        categoryImage.leftAnchor.constraint(equalTo: collectionView.leftAnchor, constant: 16).isActive = true
        categoryImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        
        addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: categoryImage.rightAnchor, constant: 16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 24).isActive = true
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = pictureCategory?.imageNames?.count {
            return count
        }
        return 0

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: secondCellId, for: indexPath) as! PictureCell
        cell.pictureNames = pictureCategory?.imageNames?[indexPath.item]
        return cell

    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.height, height: frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            self.delegate?.selectedItem()

      }

}




class PictureCell: UICollectionViewCell {

    
    var pictureNames: PicturesNames? {
        didSet {
            if let imageName = pictureNames?.imageName {
                photoImageView.image = UIImage(named: imageName)
            }
        }
    }


    let photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 9
        iv.layer.masksToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()



    override init(frame: CGRect) {
        super.init(frame: frame)


        addSubview(photoImageView)
        photoImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        photoImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 60).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        photoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 36).isActive = true

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
