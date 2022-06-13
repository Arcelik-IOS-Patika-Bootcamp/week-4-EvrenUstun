//
//  APICaller.swift
//  CryptoApp
//
//  Created by Evren Ustun on 8.06.2022.
//

import Foundation

final class APICaller{
    static let shared = APICaller()
    
    // Constants for api
    private struct Constants {
        static let assetsEnpoint = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc"
    }
    
    private init () {}
    
    // MARK: - Public
    
    // Get all data from api
    public func getAllCryptoData(
        completion: @escaping (Result<[Crypto], Error>) -> Void
    ) {
        guard let url = URL(string: Constants.assetsEnpoint) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                // Decode response
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                completion(.success(cryptos))
            }catch{
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
