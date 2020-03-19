//
//  ParallelProcessingViewController.swift
//  GetStuff
//
//  Created by Zev Eisenberg on 3/8/20.
//  Copyright © 2020 Zev Eisenberg. All rights reserved.
//

import UIKit

enum Item {
    case empty
    case loading
    case loaded(input: Int, output: Double)
}

class ParallelProcessingViewController: UIViewController {

    private var items: [Item] = Array(repeating: .empty, count: 150)

    private let mathQueue = DispatchQueue(label: "mathQueue", attributes: [.concurrent])

    // Outlets

    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet private weak var fetchButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    // Computed Properties

    var itemSize: CGSize {
        // Without floor(), the cells are too wide, but with it,
        // they're a hair too narrow, so we get white lines between the cells.
        let sideLength = floor(view.bounds.width / 4)
        return CGSize(width: sideLength, height: sideLength)
    }

    // Lifecycle

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        flowLayout.itemSize = itemSize
    }
}

private extension ParallelProcessingViewController {

    @IBAction func doMathTapped(_ sender: UIButton) {
        // set all states to .loading initially
        items = Array(repeating: .loading, count: items.count)
        collectionView.reloadData()

        for index in self.items.indices {
            mathQueue.async {
                let result = self.doExpensiveMath(index)
                DispatchQueue.main.async {
                    let newItem = Item.loaded(input: index, output: result)
                    self.updateItem(to: newItem, atIndex: index)
                }
            }
        }
    }

    func updateItem(to newItem: Item, atIndex index: Int) {
        items[index] = newItem
        collectionView.reloadItems(at: [IndexPath(item: index, section: 0)])
    }

    func doExpensiveMath(_ input: Int) -> Double {
        (0...1_000_000)
            .reduce(Double(input)) { accumulator, next in sin(accumulator) }
    }

}

extension ParallelProcessingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "resultCell", for: indexPath) as? ResultCell else { fatalError("Problem dequeueing cell") }
        // configure cell
        let item = items[indexPath.item]
        cell.item = item
        return cell
    }
}

extension ParallelProcessingViewController: UICollectionViewDelegateFlowLayout {

}


