//
//  OpenspaceGetter.swift
//  ProjectS
//
//  Created by Jeytery on 11.12.2022.
//

import Foundation

class WrappedOpenspace {
    init(json: String) {
        
    }
}

extension WrappedOpenspace {
    var openspace: Openspace {
        return  Openspace(name: "", id: "", themes: [])
    }
}

struct Content1 {
    private let _content: String
    let kind: Kind
    
    enum Kind: Int {
        case url = 0
        case openspace = 1
        case markdown = 2
    }
    
    func get() -> String {
        return _content
    }
    
    init(content: String, kind: Int) {
        self._content = content
        self.kind = Kind.init(rawValue: kind) ?? .url
    }
    
    init(content: String, kind: Kind) {
        self._content = content
        self.kind = kind
    }
}



//
//let a: Content1 = .openspace
//a.get() // stirng url link to config
//a.get() // strgin of json
//a.get() // openspace
