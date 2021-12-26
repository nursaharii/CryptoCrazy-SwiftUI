//
//  WebService.swift
//  CryptoCrazy-SwiftUI
//
//  Created by Nurşah on 26.12.2021.
//

import Foundation

class WebService {
    
    
    func downloadCurrenciesContinuation (url : URL) async throws -> [CryptoCurrency] { //Continuation kullanılarak önceki fonksiyon async ve await syntaxına çevrilebilir.
       
       try await withCheckedThrowingContinuation { continuation in
           
           downloadCurrencies(url: url) { result in
               switch result {
                    case .success(let cryptos) :
                        continuation.resume(returning: cryptos ?? [])
                    case .failure(let error):
                        continuation.resume(throwing: error)
               }
           
           }
            
        }
    }
    
    func downloadCurrencies(url: URL,completion: @escaping (Result<[CryptoCurrency]?,DownloaderError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.badURL))
            }
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data) else {
                return completion(.failure(.dataParseError))
            }
            completion(.success(currencies))
        }.resume()
        
    }
}

enum DownloaderError : Error {
    case badURL
    case noData
    case dataParseError
}
