//
//  BaseViewController+ IndexPath.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 05.12.2022.
//

import UIKit

extension BaseViewController {
    
    func getCurrentIndexPath(withSender sender: UIButton,
                             andCollectionView collectionView: UICollectionView)
    -> IndexPath? {
        
        var superview = sender.superview
        while let view = superview, !(view is UICollectionViewCell) {
            superview = view.superview
        }
        
        guard let cell = superview as? UICollectionViewCell else { return nil }
        
        guard let indexPath = collectionView.indexPath(for: cell) else { return nil }
        
        return indexPath
    }
}
