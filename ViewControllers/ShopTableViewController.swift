//
//  ShopTableViewController.swift
//  Coloring game
//
//  Created by Mikhail Ladutska on 4/21/20.
//  Copyright © 2020 Mikhail Ladutska. All rights reserved.
//

import UIKit

class ShopTableViewController: UITableViewController {
    
    weak var delegate: ReturnDataProtocol?
    
    let buyingScores: [Shopping] = [Shopping(score: 1000, bonusScore: nil, bonusText: nil, bonusIsHidden: true, price: "$1.99", detailLabelText: nil, detailLabelIsHidden: true),
                                    Shopping(score: 5000, bonusScore: 2000, bonusText: "+ 2000 free bonus", bonusIsHidden: false, price: "$3.49", detailLabelText: "MOST POPULAR", detailLabelIsHidden: false),
                                    Shopping(score: 10_000, bonusScore: 5000, bonusText: "+ 5000 free bonus", bonusIsHidden: false, price: "$5.99", detailLabelText: nil, detailLabelIsHidden: true),
                                    Shopping(score: 50_000, bonusScore: 5000, bonusText: "+ 5000 free bonus", bonusIsHidden: false, price: "$23.99", detailLabelText: nil, detailLabelIsHidden: true),
                                    Shopping(score: 150_000, bonusScore: 100000, bonusText: "+ 100 000 fee bonus", bonusIsHidden: false, price: "$49.99", detailLabelText: "BEST VALUE", detailLabelIsHidden: false)]
    
    var totalScores = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    
    //button actions
     @objc private func crossButonTapped() {
        delegate?.returnStringData(myData: totalScores)
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return  2
        } else {
            return buyingScores.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstStaticTableViewCell.reuseId) as? FirstStaticTableViewCell else { return UITableViewCell() }
                cell.crossButton.addTarget(self, action: #selector(crossButonTapped), for: .touchUpInside)
                cell.selectionStyle = .none
                return cell
            }
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
               guard let cell = tableView.dequeueReusableCell(withIdentifier: SecondStaticTableViewCell.reuseId) as? SecondStaticTableViewCell else { return UITableViewCell() }
                cell.selectionStyle = .none
                return cell
            } else if indexPath.row == 1 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ThirdStaticTableViewCell.reuseId) as? ThirdStaticTableViewCell else { return UITableViewCell() }
                cell.selectionStyle = .none
                return cell
            }
        } else {
            guard  let cell = tableView.dequeueReusableCell(withIdentifier: ShopTableViewCell.reuseId, for: indexPath) as? ShopTableViewCell else { return UITableViewCell() }
            cell.shopping = buyingScores[indexPath.row]

            return cell
        }
        return UITableViewCell()
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return 300
            }
        }
        return 70
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            var newValue = 0
            let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! FirstStaticTableViewCell
            
            //TODO: - improve and refactor this method
            
            let scoreFromLabel = cell.totalScoreLabel.text   //.deletingSuffix("K")
            if scoreFromLabel!.hasSuffix("K") {
                newValue = Int(scoreFromLabel!.deletingSuffix("K")) ?? 1
                newValue *= 1000
                newValue += buyingScores[indexPath.row].score + (buyingScores[indexPath.row].bonusScore ?? 0)
                if newValue <= 999 {
                    cell.totalScoreLabel.text = "\(newValue)"
                } else {
                    let number = newValue / 1000
                    cell.totalScoreLabel.text = "\(number)K"
                }
            } else {
                var newScore: Int = Int(scoreFromLabel ?? "") ?? 0
                newScore += buyingScores[indexPath.row].score + (buyingScores[indexPath.row].bonusScore ?? 0) 
                if newScore <= 999 {
                    cell.totalScoreLabel.text = "\(newScore)"
                } else {
                    let number = newScore / 1000
                    cell.totalScoreLabel.text = "\(number)K"
                }
            }
            totalScores = cell.totalScoreLabel.text ?? ""
            tableView.deselectRow(at: indexPath, animated: false)
        }
        
    }
    
}


