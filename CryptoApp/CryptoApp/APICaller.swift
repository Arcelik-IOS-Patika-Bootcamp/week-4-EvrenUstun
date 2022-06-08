//
//  APICaller.swift
//  CryptoApp
//
//  Created by Evren Ustun on 8.06.2022.
//

import Foundation

final class APICaller{
    static let shared = APICaller()
    
    private struct Constants {
        static let apiKey = "2365EB53-C1D2-4765-A671-1111698437C0"
        static let assetsEnpoint = "https://rest-sandbox.coinapi.io/v1/assets/"
    }
    
    private init () {}
    
    // MARK: - Public
    
    public func getAllCryptoData(
        completion: @escaping (Result<[String], Error>) -> Void
    ) {
        guard let url = URL(string: Constants.assetsEnpoint + "?apikey=" + Constants.apiKey) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                // Decode response
            }catch{
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
