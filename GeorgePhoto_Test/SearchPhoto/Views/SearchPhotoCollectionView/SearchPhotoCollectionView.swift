//
//  SearchPhotoCollectionView.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 29.11.2022.
//

import UIKit

final class SearchPhotoCollectionView: BaseCollectionView {
    
    override func configureAppearance() {
        
        self.showsHorizontalScrollIndicator = false
        self.backgroundColor = .clear
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
