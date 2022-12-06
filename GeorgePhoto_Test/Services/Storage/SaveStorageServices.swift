//
//  SaveStorageServices.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 05.12.2022.
//

import Foundation

class SaveStorageServices {
    
    static let shared = SaveStorageServices()
    
    var items: [MainPhotoModel] = []
    
    func addItem(_ item: MainPhotoModel?) {
        
        guard let item = item else { return }
        if let index = items.firstIndex(where: { (arrayItem) -> Bool in
            return arrayItem.id == item.id
        }) {
            
            print("\(item.id) removed from favourite.")
            items.remove(at: index)
            
        } else {
            
            print("\(item.id) added to favourite.")
            items.insert(item, at: items.endIndex)
        }
    }
}
