//
//  APIClient.swift
//  ScooterApp
//
//  Created by Eratalar, Ali Ugur (401) on 21.02.2022.
//

import Foundation

protocol NetworkService {
    func request<T>(response: T.Type, router: Routable, completion: @escaping (APIResponse<T>) -> Void) where T: Decodable
}

final class APIClient: NetworkService {
    
    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
    private var session = URLSession.shared
    static private(set) var shared = APIClient()
    
    func request<T>(response: T.Type, router: Routable, completion: @escaping (APIResponse<T>) -> Void) where T: Decodable {
        let request = URLRequest(router: router)
        let task = session.dataTask(with: request, completionHandler: { [weak self] data, response, error in
            DispatchQueue.main.async {
                let httpResponse = response as? HTTPURLResponse
                self?.handleDataResponse(data: data, response: httpResponse, error: error, completion: completion)
            }
        })
        task.resume()
    }
    
    private func handleDataResponse<T: Decodable>(data: Data?, response: HTTPURLResponse?, error: Error?, completion: (APIResponse<T>) -> Void) {
        guard error == nil else {
            return completion(.failure(.unknown))
        }
        guard let response = response else {
            return completion(.failure(.noJSONData))
        }
        
        switch response.statusCode {
        case 200...299:
            guard let data = data else {
                return completion(.failure(.unknown))
            }
            do {
                let baseResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(baseResponse))
            } catch let error {
                return completion(.failure(.decodingError(error)))
            }
        default:
            guard let dataJson = String(data: data!, encoding: String.Encoding.utf8) else {
                return completion(.failure(.unknown))
            }
            print("dataJson: \(dataJson)")
            completion(.failure(.unknown))
        }
    }
    
}
