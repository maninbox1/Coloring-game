//
//  InstructCollectionViewController.swift
//  Coloring game
//
//  Created by Mikhail Ladutska on 4/22/20.
//  Copyright © 2020 Mikhail Ladutska. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class InstructCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    let instructions: [Instruction] = [Instruction(image: "magic stick", title: "Magic Wand Tool", instruction: "Color any shape in your field of view", price: "1", priceIsHidden: nil, pictrureIsHidden: nil), Instruction(image: "magic search", title: "Magic Search Tool", instruction: "Find lose shapes for choosen color", price: "20", priceIsHidden: nil, pictrureIsHidden: nil), Instruction(image: "ananas", title: "Zoom Tool", instruction: "Discover more details with smart zoom", price: "", priceIsHidden: true, pictrureIsHidden: true)]
    
    // to observe current page
    var pageNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.alpha = 0.9
        setupBottomControls()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "Arial Rounded MT Pro Cyr", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext() {
        if pageNum < instructions.count - 1 {
        let nextIndex = min(pageControl.currentPage + 1, instructions.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageNum = pageControl.currentPage
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = instructions.count
        pc.currentPageIndicatorTintColor = .white
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
    fileprivate func setupBottomControls() {
        let bottomStackView = UIStackView(arrangedSubviews: [pageControl, nextButton])
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.distribution = .fillEqually
        bottomStackView.spacing = view.frame.width / 4

        view.addSubview(bottomStackView)

        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            bottomStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }

    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        let contentOffsetX = scrollView.contentOffset.x
        pageControl.currentPage = Int(x / view.frame.width)
        pageNum = Int(x / view.frame.width)
        if contentOffsetX <= -10 || contentOffsetX > scrollView.contentSize.width - scrollView.bounds.width {
            dismiss(animated: true, completion: nil)
        }
    }
    

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return instructions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! InstructionCollectionViewCell
        
        cell.instructions = instructions[indexPath.item]
        cell.backgroundColor = .black
    
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
