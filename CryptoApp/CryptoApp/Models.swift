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
    let priceUsd: Float?
    let idIcon: String?
    
    enum CodingKeys: String, CodingKey {
        case assetId = "asset_id"
        case name
        case priceUsd = "price_usd"
        case idIcon = "id_icon"
    }
}
