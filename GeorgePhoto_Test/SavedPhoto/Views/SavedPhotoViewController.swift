//
//  SavedPhotoViewController.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 30.11.2022.
//

import UIKit

final class SavedPhotoViewController: BaseViewController<SavedPhotoRootView> {
    
    private var savedViewModel: PhotoViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        savedViewModel = SavedPhotoViewModel()
        
        setupCollectionView()
        setupNavigationItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mainView.collectionView.reloadData()
    }
}
//MARK: - Private Methods
private extension SavedPhotoViewController {
    
    func setupCollectionView() {
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
        mainView.collectionView.register(SavedPhotoCollectionViewCell.self,
                                         forCellWithReuseIdentifier: SavedPhotoCollectionViewCell.reuseId)
    }
    
    func setupNavigationItem() {
        
        self.navigationItem.title = R.Strings.SavedPhotoVC.navigationTitle
    }
}
//MARK: - CollectionView Delegate + DataSource
extension SavedPhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int)
    -> Int {
        return savedViewModel?.photoData.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SavedPhotoCollectionViewCell.reuseId,
                                                            for: indexPath)
                as? SavedPhotoCollectionViewCell else { return UICollectionViewCell() }
        
        
        cell.cellViewModel = savedViewModel?.cellViewModel(forIndexPath: indexPath)
        
        cell.setActionButtonAction(forTarget: self, action: #selector(cellButtonAction))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        let detailsVC = DetailsPhotoViewController()
        
        savedViewModel?.selectRow(atIndexPath: indexPath)
        detailsVC.viewModel = savedViewModel?.viewModelForSelectedRow()
        
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}
//MARK: - CollectionView FlowLayout
extension SavedPhotoViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath)
    -> CGSize {
        
        let paddingSpace = Constants.sectionInserts.left * (Constants.itemPerRow + 1)
        
        let availableWidth = mainView.bounds.width - paddingSpace
        let widthPerItem = availableWidth / Constants.itemPerRow
        
        let availableHeight = mainView.bounds.height / 2
        let heightItem = CGFloat(availableHeight) * widthPerItem / CGFloat(availableWidth)
        
        return CGSize(width: widthPerItem, height: heightItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int)
    -> UIEdgeInsets {
        
        return Constants.sectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int)
    -> CGFloat {
        
        return Constants.sectionInserts.left
    }
}
//MARK: - Action
@objc
private extension SavedPhotoViewController {
    func cellButtonAction(sender: UIButton) {
        
        let currentIndexPath = self.getCurrentIndexPath(withSender: sender,
                                                        andCollectionView: mainView.collectionView)
        let photoData = savedViewModel?.photoData[currentIndexPath?.item ?? 0]

        SaveStorageServices.shared.addItem(MainPhotoModel(imageUrlString: photoData?.imageUrlString ?? "",
                                                          authorName: photoData?.authorName ?? "",
                                                          photoDate: photoData?.photoDate ?? "",
                                                          photoLikes: photoData?.photoLikes ?? "",
                                                          id: photoData?.id ?? ""))
        
        DispatchQueue.main.async {
            self.mainView.collectionView.reloadData()
        }
    }
}

//MARK: - Constants
private extension SavedPhotoViewController {
    
    enum Constants {
        static let cellSideSpacing: CGFloat = 10
        
        static let itemPerRow: CGFloat = 2
        static let sectionInserts: UIEdgeInsets = .init(top: 20, left: 20, bottom: 20, right: 20)
    }
}
