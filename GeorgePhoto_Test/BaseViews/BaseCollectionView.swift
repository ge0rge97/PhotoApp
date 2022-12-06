//
//  BaseCollectionView.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 29.11.2022.
//

import UIKit

class BaseCollectionView: UICollectionView {
    // MARK: - Init
    convenience init() {
        let layout = UICollectionViewFlowLayout()
        self.init(frame: .zero, collectionViewLayout: layout)
    }
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        configureAppearance()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
//MARK: -
extension BaseCollectionView {
    @objc func configureAppearance() { }
}
