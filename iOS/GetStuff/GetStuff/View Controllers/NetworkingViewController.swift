//
//  NetworkingViewController.swift
//  GetStuff
//
//  Created by Zev Eisenberg on 3/8/20.
//  Copyright © 2020 Zev Eisenberg. All rights reserved.
//

import UIKit

class NetworkingViewController: UIViewController {

    // Outlets

    @IBOutlet private weak var quoteLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var quoteStack: UIStackView!
    @IBOutlet private weak var spinner: UIActivityIndicatorView!

    // Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Configure the right views to be visible initially

        // Don't hide this, because we still want it taking up space
        // in the stack view
        quoteStack.alpha = 0
        spinner.stopAnimating()
    }

}

// MARK: - Actions

private extension NetworkingViewController {

    @IBAction func getQuoteTapped(_ sender: UIButton) {
        // TODO
    }

}
