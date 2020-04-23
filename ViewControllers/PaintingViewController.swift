//
//  PaintingViewController.swift
//  Coloring game
//
//  Created by Mikhail Ladutska on 4/18/20.
//  Copyright © 2020 Mikhail Ladutska. All rights reserved.
//

import UIKit
import CoreGraphics

class PaintingViewController: UIViewController {

    //MARK: -IBOutlets for painting vc
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backButton: UIButton! = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageRect(forContentRect: CGRect(x: 0, y: 0, width: 50, height: 50))
        return button
    }()
    
    @IBOutlet var settingButtons: [UIButton]!
    
    @IBOutlet weak var infoMagicButton: UIButton!
    
    @IBOutlet weak var magicBoosterLabel: UILabel!
    
    @IBOutlet weak var finderScoresLabel: UILabel!
    
    @IBOutlet weak var totalScoreLabel: UILabel!
    
    
    var image: UIImage?
    var colorFromButton = UIColor.clear
    
    var buttons: [Button] = [Button(title: "1", hexColor: "#D490F8"),
                             Button(title: "2", hexColor: "#7024D4"),
                             Button(title: "3", hexColor: "B287F8"),
                             Button(title: "4", hexColor: "53A5F8"),
                             Button(title: "5", hexColor: "#45914B"),
                             Button(title: "6", hexColor: "#1D4ABF"),
                             Button(title: "7", hexColor: "#8EE2CF")]
    
    var arrayOfColorButtons = [UIButton]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ChooseColorButtonsCell.self, forCellWithReuseIdentifier: ChooseColorButtonsCell.reuseId)
        navigationItem.hidesBackButton = true
        imageView.image = UIImage(named: "1")
        setupLabels()
    }
    
    private func setupLabels() {
        infoMagicButton.layer.cornerRadius = infoMagicButton.frame.width / 2
        magicBoosterLabel.textColor = UIColor(hexString: "#E84393")
        finderScoresLabel.textColor = UIColor(hexString: "#E84393")
        totalScoreLabel.textColor = UIColor(hexString: "#E84393")
    }
    
    @IBAction func buyButtonTapped(_ sender: Any) {
        print("buy")
    }
    
    @IBAction func finderButtonTapped(_ sender: Any) {
        print("finder tapped")
    }
    
    
    @IBAction func magicButtonTapped(_ sender: Any) {
        print("magic button tapped")
    }
    
    @IBAction func infoMagicButtonTapped(_ sender: Any) {
        guard let instructViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InstructCollectionViewController") as? InstructCollectionViewController else {
            return
        }
        instructViewController.modalPresentationStyle = .overFullScreen
        present(instructViewController, animated: true, completion: nil)
    }
    
    //make drop down when seeting's button tapped
    @IBAction func settingsButtonTapped(_ sender: UIButton) {
        settingButtons.forEach { (button) in
            UIView.animate(withDuration: 0.3) {
                button.isHidden = !button.isHidden
            }
        }
    }
    
    //for color buttons
    @objc private func buttonTapped(_ sender: UIButton) {
        updateButtonsAppearance(allButtons: arrayOfColorButtons, selectedButton: sender)
        let item = sender.tag
        colorFromButton = UIColor(hexString: buttons[item].hexColor)
    }
    
    
    //update selected color button's appearance
    private func updateButtonsAppearance(allButtons: [UIButton], selectedButton: UIButton) {
        for button in allButtons {
            let isSelected = button == selectedButton
            button.layer.borderWidth = isSelected ? 2 : 0
            button.layer.borderColor = isSelected ? CGColor(srgbRed: 100, green: 0, blue: 0, alpha: 1) : CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
            button.isHighlighted = isSelected
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "shop" {
            let controller = segue.destination as! ShopTableViewController
                controller.delegate = self
            
        }
    }
    
    @IBAction func tapAction(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let image = imageView.image else {
            return
        }
        var point = gestureRecognizer.location(in: imageView)
        let imageRect = imageView.contentClippingRect
        if imageRect.contains(point) {
            point = CGPoint(x: point.x - imageRect.origin.x, y: point.y - imageRect.origin.y)
            let imageTouchPoint: (Int, Int) = (Int(point.x * image.size.width/imageRect.size.width) , Int(point.y * image.size.height/imageRect.size.height))
            var toBeRemoved = [CALayer]()
            for layer in imageView.layer.sublayers ?? [] {
                let content = layer.contents as! CGImage
                if content.pointHasData(point: imageTouchPoint) {
                    toBeRemoved.append(layer)
                }
            }
            
            for layer in toBeRemoved {
                layer.removeFromSuperlayer()
            }
            
            var image: UIImage!
         
           image = imageView.image!.processPixels(from: imageTouchPoint, color: colorFromButton, tolerance: 10)
            let imageLayer = CALayer()
            imageLayer.frame = imageRect
            imageLayer.contents = image.cgImage
            imageView.layer.addSublayer(imageLayer)
            imageLayer.opacity = 0.5
             
        }
    }

}

extension PaintingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChooseColorButtonsCell.reuseId, for: indexPath) as! ChooseColorButtonsCell
        cell.colorButton.setTitle(buttons[indexPath.item].title, for: .normal)
        cell.colorButton.backgroundColor = UIColor(hexString: buttons[indexPath.item].hexColor)
        cell.colorButton.tag = indexPath.item
        cell.colorButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        //populate array of color buttons
        arrayOfColorButtons.append(cell.colorButton)
        return cell
    }
    
}

//subscribing for return data protocol
extension PaintingViewController: ReturnDataProtocol {
    func returnStringData(myData: String) {
        totalScoreLabel.text = myData
    }
}
