//
//  PostsViewController.swift
//  ProjectS
//
//  Created by Jeytery on 30.11.2022.
//

import Foundation
import UIKit
import SnapKit

class PostsViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.collectionView = CollectionView()
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PostsViewController {
    func CollectionView() -> UICollectionView {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = .init(width: 400, height: 300)
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout)
        collectionView.contentInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        return collectionView
    }
    
    func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: "cell")
    }
}

extension PostsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 100
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath)
        cell.backgroundColor = .red
        cell.layer.cornerRadius = 20
        return cell
    }
}
