//
//  SavedPhotoRootView.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 30.11.2022.
//

import UIKit

final class SavedPhotoRootView: BaseView {
    let collectionView = SavedPhotoCollectionView()
}
//MARK: - Required Methods
extension SavedPhotoRootView {
    
    override func setupViews() {
        [collectionView].forEach{ addSubview($0) }
    }
}
