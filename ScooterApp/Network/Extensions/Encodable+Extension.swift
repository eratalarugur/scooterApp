//
//  Encodable+Extension.swift
//  ScooterApp
//
//  Created by Eratalar, Ali Ugur (401) on 21.02.2022.
//

import Foundation

extension Encodable {
    
    var convertToJson: [String: Any]? {
        
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        
        do {
            let jsonData: Data = try jsonEncoder.encode(self)
            let json = try JSONSerialization.jsonObject(with: jsonData, options: [])
            let dict = json as? [String: Any]
            return dict
        } catch {
            return nil
        }
    }
}
