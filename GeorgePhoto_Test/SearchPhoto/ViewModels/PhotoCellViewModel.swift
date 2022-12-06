//
//  PhotoCellViewModel.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 04.12.2022.
//

import Foundation

protocol PhotoCellViewModelProtocol: AnyObject {
    var imageName: String { get }
    var authorName: String { get }
    var photoDate: String { get }
    var photoLikes: String { get }
    var photoId: String { get }
}

class PhotoCellViewModel: PhotoCellViewModelProtocol {
    private var item: MainPhotoModel!
    
    var imageName: String {
        return item.imageUrlString
    }
    var authorName: String {
        return item.authorName
    }
    var photoDate: String {
        return formattedDate ?? ""
    }
    var photoLikes: String {
        return item.photoLikes
    }
    var photoId: String {
        return item.id
    }
    init(item: MainPhotoModel) {
        self.item = item
    }
}

extension PhotoCellViewModel {
    
    private var formattedDate: String? {
        
        Date.getFormattedDate(fromDate: item.photoDate,
                              withFormatter: "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
        
    }
}
