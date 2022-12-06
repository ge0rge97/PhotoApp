//
//  RandomPhotoViewModel.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 05.12.2022.
//

import Foundation

class RandomPhotoViewModel: PhotoViewModelProtocol {
    
    private var selectedIndexPath: IndexPath?
    
    private var randomPhotoData: [Result]?
    
    var photoData: [MainPhotoModel] {

        var array: [MainPhotoModel] = []

        for (index, _) in randomPhotoData?.enumerated() ?? [].enumerated() {

            array.append(MainPhotoModel(imageUrlString: randomPhotoData?[index].urls?.regular ?? "",
                                          authorName: randomPhotoData?[index].user?.username ?? "",
                                          photoDate: randomPhotoData?[index].createdAt ?? "",
                                          photoLikes: "\(randomPhotoData?[index].likes ?? 0)",
                                            id: randomPhotoData?[index].id ?? ""))

        }

        return array
    }
    
    init(photoData: [Result]) {
        
        self.randomPhotoData = photoData
    }
}
//MARK: - CellViewModel
extension RandomPhotoViewModel {
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> PhotoCellViewModelProtocol? {
        let item = photoData[indexPath.item]
        return PhotoCellViewModel(item: item)
    }
}
//MARK: - Selected Items for DetailVMProtocol
extension RandomPhotoViewModel {
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func viewModelForSelectedRow() -> PhotoCellViewModelProtocol? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        let item = photoData[selectedIndexPath.item]
        return PhotoCellViewModel(item: item)
    }
}
