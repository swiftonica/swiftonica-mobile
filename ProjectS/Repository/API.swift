//
//  API.swift
//  ProjectS
//
//  Created by Jeytery on 11.12.2022.
//

import Foundation
import Alamofire

class API {
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    func getOpenspace(
        by configLink: String,
        completion: @escaping (Openspace) -> Void
    ) {
        AF.request(configLink, method: .get)
            .responseData {
                value in
                guard let data = value.data else {
                    return
                }
                
                let stroke = String(decoding: data, as: UTF8.self)
                
                guard let dict = self.convertToDictionary(text: stroke) else {
                    return
                }
                
                guard let content = dict["content"] as? String else {
                    print("content is nil")
                    return
                }
                
                guard let _data = Data(base64Encoded: content, options: .ignoreUnknownCharacters) else { return }
                
                guard let final = String(data: _data, encoding: .utf8) else {
                    print("wrong data")
                    return
                }
                
                let __data = final.data(using: .utf8)!
                print(final)
                
                let dataOpenspace = DataOpenspace(data: __data)
                guard let unwrap = dataOpenspace.unwrap() else { return }
                completion(unwrap)
            }
    }
    
    func getSwitonica(completion: @escaping (Openspace) -> Void) {
        let link = "https://api.github.com/repos/swiftonica/swiftonica-database/contents/swiftonica-openspace.md"
        getOpenspace(by: link, completion: completion)
    }
}

