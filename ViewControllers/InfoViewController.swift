//
//  InfoViewController.swift
//  Coloring game
//
//  Created by Mikhail Ladutska on 4/15/20.
//  Copyright © 2020 Mikhail Ladutska. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var infoButton: UIButton!
    
    let reusID = "cell"
    
    let infoModel = [InfoModel(imageName: "restore", labelText: "Restore Purchases"),
                    InfoModel(imageName: "tell-a-friend", labelText: "Tell a friend"),
                    InfoModel(imageName: "rate-review", labelText: "Rate & Review"),
                    InfoModel(imageName: "privacy", labelText: "Privacy Polciy"),
                    InfoModel(imageName: "law", labelText: "Terms of Use"),
                    InfoModel(imageName: "support", labelText: "Support & Feedback")]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationItem.title = "INFO SUGGESTIONS"
        collectionView.delegate = self
        collectionView.dataSource = self
        infoButton.layer.cornerRadius = 16
        infoButton.layer.borderWidth = 1
        infoButton.layer.borderColor = CGColor(srgbRed: 100, green: 0, blue: 0, alpha: 1)
        collectionView.register(InfoCell.self, forCellWithReuseIdentifier: InfoCell.reuseID)
    }
    

    @IBAction func mainButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}

extension InfoViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return infoModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoCell.reuseID, for: indexPath) as! InfoCell
        cell.infoModel = infoModel[indexPath.item]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 30, bottom: 8, right: 30)
    }
}
