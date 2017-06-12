//
//  GoodListTableViewCell.swift
//  BasketPrice
//
//  Created by Daniel Vela on 11/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import UIKit

protocol GoodListCellDataSource {
    var nameForCell: String { get }
    var priceForCell: String { get }
    var qtyForCell: String { get }
}

class GoodListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var qtyLabel: UILabel!

    func configure(_ data: GoodListCellDataSource?) {
        nameLabel.text = data?.nameForCell
        priceLabel.text = data?.priceForCell
        qtyLabel.text = data?.qtyForCell
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func qtyStepperChanged(_ sender: UIStepper) {
        qtyLabel.text = "\(Int(sender.value))"
    }
}
