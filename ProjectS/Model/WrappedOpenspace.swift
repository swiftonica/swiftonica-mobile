//
//  WrappedOpenspace.swift
//  ProjectS
//
//  Created by Jeytery on 11.12.2022.
//

import Foundation

struct WrappedOpenspace {
    let urlString: String
    
    static let swiftonica = WrappedOpenspace(
        urlString: "https://api.github.com/repos/swiftonica/swiftonica-database/contents/swiftonica-openspace.md"
    )
}

class DataOpenspace {
    private let data: Data
    
    struct UnwrapError: Error {}
    
    init(data: Data) {
        self.data = data
    }
    
    func unwrap() -> Openspace? {///-> Result<Openspace, Error> {
        
        do {
            return try JSONDecoder().decode(Openspace.self, from: data)
        }
        catch(let error) {
            print(error)
        }
        
        return nil 
//        guard let openspace = Openspace.unarchive(data: data) else {
//            return .failure(UnwrapError())
//        }
        //return .success(openspace)
    }
}
