//
//  DispatchGroupsViewController.swift
//  GetStuff
//
//  Created by Zev Eisenberg on 3/8/20.
//  Copyright © 2020 Zev Eisenberg. All rights reserved.
//

import UIKit

class DispatchGroupsViewController: UIViewController {

    // Outlets

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var stockLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    @IBOutlet weak var productStackView: UIStackView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the right views to be visible initially

        // Don't hide this, because we still want it taking up space
        // in the stack view
        productStackView.alpha = 0
        spinner.stopAnimating()
    }

}

// MARK: - Actions
private extension DispatchGroupsViewController {

    @IBAction func loadProductTapped(_ sender: UIButton) {
        // Put the UI in a loading state. Probably better to put this in a
        // separate function.
        sender.isEnabled = false

        titleLabel.text = nil
        stockLabel.text = nil
        descriptionLabel.text = nil
        productStackView.alpha = 0
        spinner.startAnimating()

        // Variables to store the stuff we've fetched
        var product: Product?
        var inventory: Inventory?
        var error: Error?

        let group = DispatchGroup()
        group.enter()

        let productId = "123"
        APIClient.getProduct(withId: productId) { result in
            switch result {
            case .success(let fetchedProduct):
                product = fetchedProduct
            case .failure(let getProductError):
                error = getProductError
            }
            group.leave()
        }

        group.enter()
        APIClient.getInventory(forProductWithId: productId) { result in
            switch result {
            case .success(let fetchedInventory):
                inventory = fetchedInventory
            case .failure(let getInventoryError):
                error = getInventoryError
            }
            group.leave()
        }

        group.notify(queue: .main) {
            self.spinner.stopAnimating()
            sender.isEnabled = true
            if let product = product,
                let inventory = inventory {
                self.titleLabel.text = product.name
                self.stockLabel.text = "\(inventory.stock) in stock"
                self.descriptionLabel.text = product.description
                UIView.animate(withDuration: 0.3) {
                    self.productStackView.alpha = 1
                }
            }
            else if let error = error {
                print("Error fetching product: \(error)")
                let alert = UIAlertController(title: "Error Fetching Product", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }

}
