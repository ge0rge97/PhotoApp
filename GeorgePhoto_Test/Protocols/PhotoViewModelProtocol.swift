//
//  PhotoViewModelProtocol.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 05.12.2022.
//

import Foundation

protocol PhotoViewModelProtocol {
    
    var photoData: [MainPhotoModel] { get }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> PhotoCellViewModelProtocol?
    func selectRow(atIndexPath indexPath: IndexPath)
    func viewModelForSelectedRow() -> PhotoCellViewModelProtocol?
}
