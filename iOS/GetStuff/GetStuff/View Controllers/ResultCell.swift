//
//  ResultCell.swift
//  GetStuff
//
//  Created by Zev Eisenberg on 3/18/20.
//  Copyright © 2020 Zev Eisenberg. All rights reserved.
//

import UIKit

final class ResultCell: UICollectionViewCell {

    var item: Item = .empty {
        didSet {
            switch item {
            case .empty:
                spinner.stopAnimating()
                placeholderImageView.isHidden = false
                numberLabel.isHidden = true
            case .loading:
                spinner.startAnimating()
                numberLabel.isHidden = true
                placeholderImageView.isHidden = true
            case .loaded(let index, let result):
                spinner.stopAnimating()
                numberLabel.text = "ƒ(\(index)) = \(result)"
                numberLabel.isHidden = false
                placeholderImageView.isHidden = true
            }
        }
    }

    // Private Properties

    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var placeholderImageView: UIImageView!
    @IBOutlet private weak var spinner: UIActivityIndicatorView!

    // Lifecycle

}
