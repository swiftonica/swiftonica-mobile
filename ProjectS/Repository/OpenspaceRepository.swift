//
//  OpenspaceRepository.swift
//  ProjectS
//
//  Created by Jeytery on 11.12.2022.
//

import Foundation

class OpenscapeRepository {
    static let swiftonica = OpenscapeRepository(
        wrappedOpenspace: .init(
            urlString: "https://api.github.com/repos/swiftonica/swiftonica-database/contents/swiftonica-openspace.md"
        )
    )
    
    private let wrappedOpenspace: WrappedOpenspace
    
    init(wrappedOpenspace: WrappedOpenspace) {
        self.wrappedOpenspace = wrappedOpenspace
    }
    
    func openspace(completion: @escaping (Openspace) -> Void) {
        API.shared.getOpenspace(
            by: wrappedOpenspace.urlString,
            completion: { completion($0) }
        )
    }
}
