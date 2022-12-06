//
//  SearchPhotoRootView.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 29.11.2022.
//

import UIKit

final class SearchPhotoRootView: BaseView {
    
    let collectionView = SearchPhotoCollectionView()
}
//MARK: - Required Methods
extension SearchPhotoRootView {
    override func setupViews() {
        
        [collectionView].forEach{ addSubview($0) }
    }
}
