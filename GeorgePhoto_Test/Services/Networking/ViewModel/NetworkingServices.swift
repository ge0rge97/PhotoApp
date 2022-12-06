//
//  NetworkingServices.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 04.12.2022.
//

import Foundation

class NetworkingServices {
    
    //MARK: - Networking Search Photo
    
    func getSearchRequest(withSearchTerm searchTerm: String,
                          completion: @escaping (Data?, Error?)
                          -> Void) {
        
        let parameters = self.prepareSearchParameters(withSearchTerm: searchTerm)
        let url = self.getSearchPhotoUrl(withParameters: parameters)
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = self.prepareHeaderRequest()
        request.httpMethod = "GET"
        
        let task = self.createDataTask(fromRequest: request,
                                       completion: completion)
        task.resume()
    }
    
    private func getSearchPhotoUrl(
        withParameters parameters: [String: String])
    -> URL {
        
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = parameters.map { URLQueryItem(name: $0,
                                                              value: $1)}
        
        return components.url!
    }
    
    private func prepareSearchParameters(
        withSearchTerm searchTerm: String?)
    -> [String: String] {
        
        var parameters = [String: String]()
        
        parameters["query"] = searchTerm
        parameters["page"] = String(1)
        parameters["per_page"] = String(10)
        
        return parameters
    }
    
    //MARK: - Networking Random Photo
    
    func getRandomPhotoRequest(
        completion: @escaping (Data?, Error?)
        -> Void) {
            
            let parameters = self.prepareRandomPhotoParameters()
            let url = self.getRandomPhotoUrl(withParameters: parameters)
            
            var request = URLRequest(url: url)
            request.allHTTPHeaderFields = self.prepareHeaderRequest()
            request.httpMethod = "GET"
            
            let task = self.createDataTask(fromRequest: request,
                                           completion: completion)
            task.resume()
            
            print(url)
        }
    
    private func getRandomPhotoUrl(
        withParameters parameters: [String: String])
    -> URL {
        
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/photos/random"
        components.queryItems = parameters.map { URLQueryItem(name: $0,
                                                              value: $1)}
        
        return components.url!
    }
    
    private func prepareRandomPhotoParameters(
    )-> [String: String] {
        
        var parameters = [String: String]()
        
        parameters["count"] = String(10)
        
        return parameters
    }
    
    //MARK: - General Header
    
    private func prepareHeaderRequest()
    -> [String: String]? {
        
        var header = [String: String]()
        
        header["Authorization"] = "Client-ID \(R.ApiKeys.unsplashAPIKey)"
        
        return header
    }
}

//MARK: - Create DataTask
extension NetworkingServices {
    
    private func createDataTask(
        fromRequest request: URLRequest,
        completion: @escaping (Data?, Error?) -> Void)
    -> URLSessionDataTask {
        
        return URLSession.shared.dataTask(with: request) { data, _, error in
            
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
