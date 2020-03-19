//
//  ParallelProcessingViewController.swift
//  GetStuff
//
//  Created by Zev Eisenberg on 3/8/20.
//  Copyright © 2020 Zev Eisenberg. All rights reserved.
//

import UIKit

enum Item: Hashable {
    case empty
    case loading
    case loaded(UIImage)
}

class ParallelProcessingViewController: UIViewController {

    private var items: [Item] = Array(repeating: .empty, count: 150)

    func updateItem(to newItem: Item, atIndex index: Int) {
        items[index] = newItem
        collectionView.reloadItems(at: [IndexPath(item: index, section: 0)])
    }

    // Outlets

    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet private weak var fetchButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    // Lifecycle

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Without floor(), the cells are too wide, but with it,
        // they're a hair too narrow, so we get white lines between the cells.
        let imageSideLength = floor(view.bounds.width / 4)
        let newSize = CGSize(
            width: imageSideLength,
            height: imageSideLength
        )
        flowLayout.itemSize = newSize
    }
}

private extension ParallelProcessingViewController {

    @IBAction func fetchImagesTapped(_ sender: UIButton) {
        // set all states to .loading initially
        items = Array(repeating: .loading, count: items.count)
        collectionView.reloadData()

        // fetch images
        for index in items.indices {
            APIClient.getImageData(withId: index, onQueue: .main) { result in
                switch result {
                case .success(let imageData):
                    if let uiImage = UIImage(data: imageData) {
                        self.updateItem(to: .loaded(uiImage), atIndex: index)
                    } else {
                        print("Error decoding image \(index) from data: \(String(data: imageData, encoding: .utf8) ?? imageData.description)")
                        // TODO: add error state to cell
                        self.updateItem(to: .empty, atIndex: index)
                    }
                case .failure(let error):
                    print("Error loading image \(index): \(error)")
                    // TODO: add error state to cell
                    self.updateItem(to: .empty, atIndex: index)
                }
            }
        }
    }

}

extension ParallelProcessingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as? ImageCell else { fatalError("Problem dequeueing cell") }
        // configure cell
        let item = items[indexPath.item]
        cell.item = item
        cell.number = indexPath.item
        return cell
    }
}

extension ParallelProcessingViewController: UICollectionViewDelegateFlowLayout {

}


