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

    var data: GoodListCellDataSource?
    var viewModel: GoodListViewModelProtocol?

    func configure(_ data: GoodListCellDataSource?, viewModel: GoodListViewModelProtocol?) {
        self.data = data
        self.viewModel = viewModel
        nameLabel.text = data?.nameForCell
        priceLabel.text = data?.priceForCell
        if let data = data {
            let qty = viewModel?.qty(for: data) ?? 0
            qtyLabel.text = "\(qty)"
        }
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
        if let qtyLabel = qtyLabel {
            let qty = Int(sender.value)
            qtyLabel.text = "\(qty)"
            if let data = self.data {
                viewModel?.update(good: data, qty: qty)
            }
        }
    }
}
