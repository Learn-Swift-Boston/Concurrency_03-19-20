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
        sender.isUserInteractionEnabled = false
        quoteStack.alpha = 0
        spinner.startAnimating()
        APIClient.getQuotes { result in
            DispatchQueue.main.async {
                // Whether success or failure, make sure this is run to reset
                // the UI to a clean state so we can try again.
                defer {
                    self.spinner.stopAnimating()
                    sender.isUserInteractionEnabled = true
                }
                switch result {
                case .success(let quote):
                    self.quoteLabel.text = quote.quote
                    self.authorLabel.text = "— \(quote.author)"
                    UIView.animate(withDuration: 0.3) {
                        self.quoteStack.alpha = 1
                    }
                case .failure(let error):
                    print("error fetching quote: \(error)")
                    let alert = UIAlertController(title: "Error loading quote", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }

}
