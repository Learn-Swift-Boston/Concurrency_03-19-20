//
//  ImageCell.swift
//  GetStuff
//
//  Created by Zev Eisenberg on 3/18/20.
//  Copyright © 2020 Zev Eisenberg. All rights reserved.
//

import UIKit

final class ImageCell: UICollectionViewCell {

    enum State {
        case empty
        case loading
        case loaded(UIImage)
    }

    var number: Int {
        get {
            Int(numberLabel.text ?? "") ?? 0
        }
        set {
            numberLabel.text = String(newValue)
        }
    }

    var state: State = .empty {
        didSet {
            switch state {
            case .empty:
                spinner.stopAnimating()
                imageView.isHidden = true
                placeholderImageView.isHidden = false
                placeholderImageView.image = UIImage(systemName: "photo")
            case .loading:
                spinner.startAnimating()
                imageView.isHidden = true
                placeholderImageView.isHidden = true
            case .loaded(let image):
                spinner.stopAnimating()
                imageView.image = image
                imageView.isHidden = false
                placeholderImageView.isHidden = true
            }
        }
    }

    // Private Properties

    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var placeholderImageView: UIImageView!
    @IBOutlet private weak var spinner: UIActivityIndicatorView!

    // Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()

        numberLabel.layer.shadowColor = UIColor.black.cgColor
        numberLabel.layer.shadowOpacity = 0.6
        numberLabel.layer.shadowRadius = 3
        numberLabel.layer.shadowOffset = CGSize(width: 0, height: 1)
    }

}
