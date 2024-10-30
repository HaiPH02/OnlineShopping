//
//  Helpers.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 17/07/2023.
//

import Foundation

enum NetworkErr: Error {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case httpStatusCodeFaild
    case noData
    case decodingError
    case serializationError
}

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) from bundle.")
        }
        
        return loadedData
    }
    
    func fetchData<T: Decodable>(url: String, model: T.Type, completion:@escaping(T) -> (), failure:@escaping(Error) -> ()) {
            guard let url = URL(string: url) else { return }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else {
                    // If there is an error, return the error.
                    if let error = error { failure(error) }
                    return }
                
                do {
                    let serverData = try JSONDecoder().decode(T.self, from: data)
                    // Return the data successfully from the server
                    completion((serverData))
                } catch {
                    // If there is an error, return the error.
                    failure(error)
                }
            }.resume()
    }
    
    func fetchData<T: Decodable>(email: String, password: String, model: T.Type, completion: @escaping (Result<T, NetworkErr>) -> Void) {
        guard let url = URL(string: "http://localhost:3002/auth/register?=") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        var queryItems = [URLQueryItem(name: "email", value: email)]
        queryItems.append(URLQueryItem(name: "password", value: password))
        urlComponents.queryItems = queryItems
        guard let finalURL = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            if let _ = error {
                completion(.failure(.serializationError))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.httpStatusCodeFaild))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            guard let movie = try? JSONDecoder().decode(T.self, from: data) else {
                completion(.failure(.decodingError))
                return
            }
            
            completion(.success(movie))
        }.resume()
    }
}

