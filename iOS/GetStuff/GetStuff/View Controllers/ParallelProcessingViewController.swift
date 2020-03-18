//
//  ParallelProcessingViewController.swift
//  GetStuff
//
//  Created by Zev Eisenberg on 3/8/20.
//  Copyright © 2020 Zev Eisenberg. All rights reserved.
//

import UIKit

class ParallelProcessingViewController: UIViewController {

    // Outlets

    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet private weak var fetchButton: UIButton!

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
        flowLayout.estimatedItemSize = newSize
    }
}

private extension ParallelProcessingViewController {

    @IBAction func fetchImagesTapped(_ sender: UIButton) {

    }

}

extension ParallelProcessingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as? ImageCell else { fatalError("Problem dequeueing cell") }
        // configure cell
        cell.number = indexPath.item
        cell.state = .empty
        return cell
    }


}

extension ParallelProcessingViewController: UICollectionViewDelegateFlowLayout {

}


