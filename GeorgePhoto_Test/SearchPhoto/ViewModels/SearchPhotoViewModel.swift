//
//  SearchPhotoViewModel.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 04.12.2022.
//

import Foundation

class SearchPhotoViewModel: PhotoViewModelProtocol {
    
    private var selectedIndexPath: IndexPath?
    
    private var searchPhotoData: [Result]?
    
    var photoData: [MainPhotoModel] {
        
        var array: [MainPhotoModel] = []
        
        for (index, _) in searchPhotoData?.enumerated() ?? [].enumerated() {
            
            array.append(MainPhotoModel(imageUrlString: searchPhotoData?[index].urls?.regular ?? "",
                                        authorName: searchPhotoData?[index].user?.username ?? "",
                                        photoDate: searchPhotoData?[index].createdAt ?? "",
                                        photoLikes: "\(searchPhotoData?[index].likes ?? 0)",
                                        id: searchPhotoData?[index].id ?? ""))
        }
        
        return array
    }
    
    init(withData data: [Result]) {
       
        self.searchPhotoData = data
    }
}
//MARK: - CellViewModel
extension SearchPhotoViewModel {
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> PhotoCellViewModelProtocol? {
        let item = photoData[indexPath.item]
        return PhotoCellViewModel(item: item)
    }
}
//MARK: - Selected Items for DetailVMProtocol
extension SearchPhotoViewModel {
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func viewModelForSelectedRow() -> PhotoCellViewModelProtocol? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        let item = photoData[selectedIndexPath.item]
        return PhotoCellViewModel(item: item)
    }
}
