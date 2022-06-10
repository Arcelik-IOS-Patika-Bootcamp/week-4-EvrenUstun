//
//  Models.swift
//  CryptoApp
//
//  Created by Evren Ustun on 8.06.2022.
//

import Foundation

struct Crypto: Decodable {
    let assetId: String
    let name: String?
    let price: String?
    let iconUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case assetId = "id"
        case name
        case price
        case iconUrl = "logo_url"
    }
}
