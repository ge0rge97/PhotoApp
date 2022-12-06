//
//  SavedPhotoViewModel.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 05.12.2022.
//

import Foundation

class SavedPhotoViewModel: PhotoViewModelProtocol {
    
    private var selectedIndexPath: IndexPath?
    
    var photoData: [MainPhotoModel] {
        
        return SaveStorageServices.shared.items
    }
}
//MARK: - CellViewModel
extension SavedPhotoViewModel {
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> PhotoCellViewModelProtocol? {
        let item = photoData[indexPath.item]
        return PhotoCellViewModel(item: item)
    }
}
//MARK: - Selected Items for DetailVMProtocol
extension SavedPhotoViewModel {
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func viewModelForSelectedRow() -> PhotoCellViewModelProtocol? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        let item = photoData[selectedIndexPath.item]
        return PhotoCellViewModel(item: item)
    }
}
