//
//  CryptoCurrency.swift
//  CryptoCrazy-SwiftUI
//
//  Created by Nurşah on 26.12.2021.
//

import Foundation

struct CryptoCurrency :
    Decodable, Identifiable{
    
    let id = UUID()
    let currency : String
    let price : String
    
    /*private enum CodingKeys : String, CodingKey {
        case currency : "currency"
        case price : "price"
    }*/
}
