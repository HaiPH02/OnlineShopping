//
//  Network.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 11/07/2023.
//

import Foundation
import Alamofire

enum NetworkError: Error, Identifiable, Hashable {
    var id: NetworkError { self }
    
    case urlError
    case requestError(errorCode: Int, message: String?)
    case networkError(error: ErrorMessage)
    case dataNull
    case parseObjectError(String)
    
    var description: String {
        switch self {
        case .urlError:
            return "URL error"
        case .requestError(let _, let message):
            return message ?? "Request Error"
        case .networkError(let error):
            return error.message.joined(separator: "\n")
        case .dataNull:
            return "There is no Data"
        case .parseObjectError(let string):
            return string
        }
    }
}

struct ErrorMessage: Codable, Identifiable, Equatable, Hashable {
    var id: String = UUID().uuidString

    let message: [String]
    
    private enum CodingKeys: String, CodingKey {
        case message
    }

}


class NetworkHelper {
    static func get<T: Codable>(_ urlPath: String,
                                parameters: [String: Any] = [:],
                                completionHandler: @escaping (_ response: T) -> Void,
                                errorHandler: @escaping(_ error: NetworkError) -> Void) {
        sendRequest(urlPath,
                    method: .get,
                    parameters: parameters,
                    completionHandler: completionHandler,
                    errorHandler: errorHandler)
    }
    
    static func post<T: Codable>(_ urlPath: String,
                                parameters: [String: Any] = [:],
                                completionHandler: @escaping (_ response: T) -> Void,
                                errorHandler: @escaping(_ error: NetworkError) -> Void) {
        sendRequest(urlPath,
                    method: .post,
                    parameters: parameters,
                    completionHandler: completionHandler,
                    errorHandler: errorHandler)
    }
    
    
    
}

extension NetworkHelper {
    private static func sendRequest<T: Codable>(_ urlPath: String,
                                                method: HTTPMethod,
                                                parameters: [String: Any],
                                                completionHandler: @escaping (_ response: T) -> Void,
                                                errorHandler: @escaping(_ error: NetworkError) -> Void) {
        let request = AF.request(urlPath,
                                 method: method,
                                 parameters: parameters)
        
        request
            .validate(statusCode: 200..<300)
            .responseData { response in
                self.handleReponse(response: response,
                                   completionHandler: completionHandler,
                                   errorHandler: errorHandler)
            }
    }
    
    private static func handleReponse<T: Codable>(response: AFDataResponse<Data>,
                                                  completionHandler: (_ reponse: T) -> Void,
                                                  errorHandler: (_ error: NetworkError) -> Void) {
        switch response.result {
        case .success(let data):
            do {
                let decodedData: T = try decode(from: data)
                completionHandler(decodedData)
            } catch let err {
                #if DEBUG
                print(
                    """
                    ===================== RequestError =====================
                    \(String(describing: err))
                    =====================     End      =====================
                    """
                )
                #else
                #endif
                errorHandler(NetworkError.parseObjectError(err.localizedDescription))
            }
        case .failure(let error):
            do {
                if let data = response.data {
                    let decodeData: ErrorMessage = try decode(from: data)
                    errorHandler(.networkError(error: decodeData))

                } else {
                    errorHandler(NetworkError.dataNull)
                }
            } catch let error {
                errorHandler(NetworkError.parseObjectError(error.localizedDescription))
            }
            /// decode response.data
            
        }
    }
    
    private static func decode<T: Codable>(from data: Data) throws -> T {
        do {
            let decodedObject = try JSONDecoder().decode(T.self, from: data)
            return decodedObject
        } catch let DecodingError.dataCorrupted(context) {
            throw NetworkError.parseObjectError(("\(context.debugDescription) at \(context.codingPath)"))
        } catch let DecodingError.keyNotFound(key, context) {
            throw NetworkError.parseObjectError("Key '\(key)' not found: \(context.debugDescription) at \(context.codingPath)")
        } catch let DecodingError.valueNotFound(value, context) {
            throw NetworkError.parseObjectError("Value '\(value)' not found: \(context.debugDescription) at \(context.codingPath)")
        } catch let DecodingError.typeMismatch(type, context)  {
            throw NetworkError.parseObjectError("Type '\(type)' mismatch: \(context.debugDescription) at \(context.codingPath)")
        } catch {
            throw NetworkError.parseObjectError("bad data")
        }
    }
}
