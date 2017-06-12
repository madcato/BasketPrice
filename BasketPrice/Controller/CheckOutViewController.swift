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
            viewModel?.numberOfComponentsDidChange = { [unowned self] viewModel in
            }
            viewModel?.numberOfRowsDidChange = { [unowned self] viewModel in
            }
            viewModel?.totaAmountDidChange = { [unowned self] viewModel in
                if let qtyStr = viewModel.totaAmount {
                    self.stopAmountActivity()
                    self.priceLabel.text = qtyStr
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 0
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
