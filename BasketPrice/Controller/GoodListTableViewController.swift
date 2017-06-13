//
//  GoodListTableViewController.swift
//  BasketPrice
//
//  Created by Daniel Vela on 11/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import UIKit

class GoodListTableViewController: UITableViewController {

    var viewModel: GoodListViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let goodList = GoodList.load() {
            let basket = Basket()
            self.viewModel = GoodListViewModel(data: goodList, basket: basket)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSections ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.rowsPersection[section] ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketCell",
                                                 for: indexPath)
        if let cell = cell as? GoodListTableViewCell {
            let data = viewModel?.dataForCell(section: indexPath.section,
                                              row: indexPath.row)
            cell.configure(data, viewModel: viewModel)

        }
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "checkOutSegue" {
            if let controller = segue.destination as? CheckOutViewController,
                let basket = self.viewModel?.basket {
                let viewModel = CheckOutViewModel(basket: basket)
                controller.viewModel = viewModel
            }
        }
    }
}
