//
//  DetailsPhotoViewController.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 29.11.2022.
//

import UIKit
import SDWebImage

final class DetailsPhotoViewController: BaseViewController<DetailsPhotoRootView> {
    
    var viewModel: PhotoCellViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRightNavigationButton()
        setupViewModel()
    }
}
//MARK: - Private Methods
private extension DetailsPhotoViewController {
    
    func setupRightNavigationButton() {
        
        let savedButton = UIBarButtonItem(image: R.Images.savedButtonImage, style: .done,
                                          target: self, action: #selector(rightBarButtonItemAction))
        savedButton.tintColor = .red
        
        self.navigationItem.rightBarButtonItem = savedButton
    }
    
    func setupViewModel() {
        
        guard let viewModel = viewModel else {
            return
        }

        mainView.authorNameLabel.text = "Author: \(viewModel.authorName)"
        mainView.photoCreateDateLabel.text = "Create: \(viewModel.photoDate)"
        mainView.photoNumberOfLikesLabel.text = "Likes: \(viewModel.photoLikes)"
        
        mainView.detailsImage.sd_setImage(with: URL(string: viewModel.imageName))
    }
}
//MARK: - Actions
@objc
private extension DetailsPhotoViewController {
    func rightBarButtonItemAction() {
        
        guard let viewModel = viewModel else {
            return
        }
        
        SaveStorageServices.shared.addItem(MainPhotoModel(imageUrlString: viewModel.imageName,
                                                          authorName: viewModel.authorName,
                                                          photoDate: viewModel.photoDate,
                                                          photoLikes: viewModel.photoLikes,
                                                          id: viewModel.photoId))
    }
}
