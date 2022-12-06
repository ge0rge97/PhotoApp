//
//  SavedPhotoCollectionViewCell.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 30.11.2022.
//

import UIKit

final class SavedPhotoCollectionViewCell: PhotoBaseCollectionViewCell {
    
    static let reuseId: String = R.CellIds.savedPhotoCollectionViewCell
    
    weak var cellViewModel: PhotoCellViewModelProtocol? {
        willSet(viewModel) {
            
            guard let viewModel = viewModel else { return }
            self.photoImageView.sd_setImage(with: URL(string: viewModel.imageName))
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.setButtonImage(withImage: R.Images.removeButtonImage)
        
        self.photoImageView.backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
