//
//  SavedPhotoCollectionView.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 30.11.2022.
//

import UIKit

final class SavedPhotoCollectionView: BaseCollectionView {
    
    override func configureAppearance() {
        
        self.showsHorizontalScrollIndicator = false
        self.backgroundColor = .clear
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
