//
//  CryptoViewModel.swift
//  CryptoCrazy-SwiftUI
//
//  Created by Nurşah on 26.12.2021.
//

import Foundation


class CryptoListViewModel : ObservableObject { // View içinde değişiklik olunca burada da güncelleme olmasını sağlıyor. ObserverObject Structlarda kullanılamaz (inheritance)
     @Published var cryptoList = [CryptoViewModel]()
    
    let webservice  = WebService()
    
    func downloadCryptos(url: URL) {
        webservice.downloadCurrencies(url: url) { result in
            switch result {
                case .failure(let error) :
                    print(error)
                case .success(let cryptos):
                if let cryptos = cryptos {
                    DispatchQueue.main.async {
                        self.cryptoList = cryptos.map(CryptoViewModel.init)
                    }
                }
            }
        }
        
    }
}

struct CryptoViewModel {
    
    let crypto : CryptoCurrency
    var id : UUID? {
        crypto.id
    }
    
    var currency : String {
        crypto.currency
    }
    var price : String {
        crypto.price
    }
}
