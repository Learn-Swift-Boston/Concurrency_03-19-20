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
        // TODO
    }

}
