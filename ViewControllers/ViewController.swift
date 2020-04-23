//
//  ViewController.swift
//  Coloring game
//
//  Created by Mikhail Ladutska on 4/17/20.
//  Copyright © 2020 Mikhail Ladutska. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, CollectionCellDelegate {
    
    //conforming protocol for collection cell delegate
    func selectedItem() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let paintingController = storyboard.instantiateViewController(withIdentifier: "PaintingViewController") as! PaintingViewController
        navigationController?.pushViewController(paintingController, animated: true)
    }
    
    


    let firstCellId = "cellfirstCellIdId"

    var pictureCategories: [PictureCategory]?

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var mainButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        pictureCategories = PictureCategory.fetchCategories()
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: firstCellId)
        mainButton.layer.borderWidth = 1
        mainButton.layer.cornerRadius = 16
        mainButton.layer.borderColor = CGColor(srgbRed: 100, green: 0, blue: 0, alpha: 1)
    }

    
    @IBAction func infoButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "info", sender: nil)
    }
    

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: firstCellId, for: indexPath) as! CategoryCell
        cell.delegate = self
        cell.pictureCategory = pictureCategories?[indexPath.item]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if let count = pictureCategories?.count {
            return count
        }
        return 0
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
  

}
