//
//  NetworkingViewModel.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 01.12.2022.
//

import Foundation

class NetworkingViewModel {
    
    var networkServices = NetworkingServices()
    
    func fetchSearchImages(withSearchTerm searchTerm: String, completion: @escaping ([Result]?) -> Void) {
        
        networkServices.getSearchRequest(withSearchTerm: searchTerm) { data, error in
            
            if let error = error {
                print("There are some requesting data error:", error.localizedDescription)
                completion(nil)
            }
            
            let decode = self.decodeJSON(withType: PhotoNetworkingDataModel.self, fromData: data)
            completion(decode?.results)
        }
    }
    
    
    func fetchRandomPhoto(completion: @escaping ([Result]?) -> Void) {
        
        networkServices.getRandomPhotoRequest { data, error in
            
            if let error = error {
                print("There are some requesting data error:", error.localizedDescription)
                completion(nil)
            }
            
            let decode = self.decodeJSON(withType: [Result].self, fromData: data)
            completion(decode)
        }
    }
}

//MARK: - Method to Decode JSON
extension NetworkingViewModel {
    
    private func decodeJSON<T: Decodable>(withType type: T.Type, fromData data: Data?) -> T? {
        
        let decoder = JSONDecoder()
        
        guard let data = data else {
            return nil
        }
        
        do {
            
            let items = try decoder.decode(type, from: data)
            return items
            
        } catch let decodingError {
            
            print("Ooops, something went wrong with decoding data:", decodingError)
            return nil
        }
    }
}
