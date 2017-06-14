//
//  CheckOutViewController.swift
//  BasketPrice
//
//  Created by Daniel Vela on 11/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import UIKit

class CheckOutViewController: UIViewController,
UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceActivity: UIActivityIndicatorView!
    @IBOutlet weak var currenciesPicker: UIPickerView!

    var viewModel: CheckOutViewModelProtocol? {
        didSet {
            viewModel?.numberOfRowsDidChange = { [unowned self] viewModel in
                self.currenciesPicker.reloadAllComponents()
            }
            viewModel?.totaAmountDidChange = { [unowned self] viewModel in
                if let qty = viewModel.totaAmount {
                    self.stopAmountActivity()
                    self.priceLabel.text = qty
                } else {
                    self.startAmountActivity()
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        priceLabel.text = viewModel?.totaAmount
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.viewModel?.numberOfRows[component] ?? 0
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.viewModel?.title(for: row, in: component) ?? ""
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.viewModel?.calculateAmount(for: row, in: component)
    }

    func startAmountActivity() {
        self.priceLabel.text = ""
        priceActivity.startAnimating()
    }

    func stopAmountActivity() {
        self.priceLabel.text = ""
        priceActivity.stopAnimating()
    }
}
