//
//  SearchPhotoCollectionViewCell.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 29.11.2022.
//

import UIKit
import SDWebImage

final class SearchPhotoCollectionViewCell: PhotoBaseCollectionViewCell {
    
    static let reuseId: String = R.CellIds.searchPhotoCollectionViewCell
    
    weak var cellViewModel: PhotoCellViewModelProtocol? {
        willSet(viewModel) {
            
            guard let viewModel = viewModel else { return }
            self.photoImageView.sd_setImage(with: URL(string: viewModel.imageName))
        }
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        
        self.setButtonImage(withImage: R.Images.savedButtonImage)
        self.photoImageView.backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
