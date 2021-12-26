//
//  WebService.swift
//  CryptoCrazy-SwiftUI
//
//  Created by Nurşah on 26.12.2021.
//

import Foundation

class WebService {
    
    func downloadCurrenciesAsync(url : URL) async throws-> [CryptoCurrency] {
        let (data,_) = try await URLSession.shared.data(from: url)
        
        let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
        
        return currencies ?? []
    }
    
    
   
}

enum DownloaderError : Error {
    case badURL
    case noData
    case dataParseError
}
