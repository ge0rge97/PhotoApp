//
//  SearchPhotoViewController.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 29.11.2022.
//

import UIKit

final class SearchPhotoViewController: BaseViewController<SearchPhotoRootView> {
    
    private var networkingViewModel = NetworkingViewModel()
    
    private var searchViewModel: PhotoViewModelProtocol?
    private var randomPhotoViewModel: PhotoViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupNavigationTitle()
        setupSearchBar()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        networkingViewModel.fetchRandomPhoto { result in
            
            self.randomPhotoViewModel = RandomPhotoViewModel(photoData: result ?? [])
            self.mainView.collectionView.reloadData()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Private methods
extension SearchPhotoViewController {
    
    private func setupCollectionView() {
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
        mainView.collectionView.register(SearchPhotoCollectionViewCell.self,
                                         forCellWithReuseIdentifier: SearchPhotoCollectionViewCell.reuseId)
    }
    
    private func setupNavigationTitle() {
        self.navigationItem.title = R.Strings.SearchPhotoVC.navigationTitle
    }
}
//MARK: - CollectionView Delegate & DataSource
extension SearchPhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int)
    -> Int {
        
        searchViewModel?.photoData.count != nil
            ? searchViewModel?.photoData.count ?? 0
                : randomPhotoViewModel?.photoData.count ?? 0
        
        
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                SearchPhotoCollectionViewCell.reuseId,
                                                            for: indexPath)
                as? SearchPhotoCollectionViewCell else { return UICollectionViewCell() }
        
        
        if searchViewModel?.photoData.count != nil {
            
            cell.cellViewModel = searchViewModel?.cellViewModel(forIndexPath: indexPath)
        } else {
            
            cell.cellViewModel = randomPhotoViewModel?.cellViewModel(forIndexPath: indexPath)
        }
        
        cell.setActionButtonAction(forTarget: self, action: #selector(cellButtonAction))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        let detailsVC = DetailsPhotoViewController()
        
        if searchViewModel?.photoData.count != nil {
            
            searchViewModel?.selectRow(atIndexPath: indexPath)
            detailsVC.viewModel = searchViewModel?.viewModelForSelectedRow()
        } else {
            
            randomPhotoViewModel?.selectRow(atIndexPath: indexPath)
            detailsVC.viewModel = randomPhotoViewModel?.viewModelForSelectedRow()
        }
        
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}
//MARK: - CollectionView FlowLayout
extension SearchPhotoViewController: UICollectionViewDelegateFlowLayout {
    
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int)
    -> UIEdgeInsets {
        
        return Constants.sectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int)
    -> CGFloat {
        
        return Constants.sectionInserts.left
    }
}
//MARK: - Actions
@objc
extension SearchPhotoViewController {
    
    func cellButtonAction(sender: UIButton) {
        
        let currentIndexPath = self.getCurrentIndexPath(withSender: sender,
                                                        andCollectionView: mainView.collectionView)
        var photoData: MainPhotoModel?
        
        if searchViewModel?.photoData.count != nil {
            
            photoData = searchViewModel?.photoData[currentIndexPath?.item ?? 0]
        } else {
            
            photoData = randomPhotoViewModel?.photoData[currentIndexPath?.item ?? 0]
        }

        SaveStorageServices.shared.addItem(MainPhotoModel(imageUrlString: photoData?.imageUrlString ?? "",
                                                          authorName: photoData?.authorName ?? "",
                                                          photoDate: photoData?.photoDate ?? "",
                                                          photoLikes: photoData?.photoLikes ?? "",
                                                          id: photoData?.id ?? ""))
    }
}
//MARK: - SearchBar Delegate
extension SearchPhotoViewController: UISearchBarDelegate {
    private func setupSearchBar() {
        
        let searchController = UISearchController(searchResultsController: nil)
        
        navigationItem.searchController                         = searchController
        navigationItem.hidesSearchBarWhenScrolling              = false
        
        searchController.hidesNavigationBarDuringPresentation   = false
        searchController.obscuresBackgroundDuringPresentation   = false
        searchController.searchBar.delegate                     = self
    }
    
    func searchBar(_ searchBar: UISearchBar,
                   textDidChange searchText: String) {
        
        networkingViewModel.fetchSearchImages(withSearchTerm: searchText) { result in
            
            guard let result = result else { return }
            
            self.searchViewModel = SearchPhotoViewModel(withData: result)
            
            self.mainView.collectionView.reloadData()
        }
    }
}
//MARK: - Constants
private extension SearchPhotoViewController {
    
    enum Constants {
        static let cellSideSpacing: CGFloat = 10
        
        static let itemPerRow: CGFloat = 2
        static let sectionInserts: UIEdgeInsets = .init(top: 20, left: 20,
                                                        bottom: 20, right: 20)
    }
}
