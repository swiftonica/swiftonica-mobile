//
//  Theme.swift
//  ProjectS
//
//  Created by Jeytery on 29.11.2022.
//

import Foundation
import UIKit

struct Theme {
//    enum Content {
//        var index: Int {
//            switch self {
//            case .url: return 0
//            case .markdown: return 1
//            case .openspace: return 2
//            }
//        }
//
//        case url(String)
//        case markdown(String)
//        case openspace(WrappedOpenspace)
//    }
//
    
    struct Content {
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
    
    struct Kind: CaseIterable, Hashable {
        static let post = Kind(index: 0, name: "Posts")
        static let pin = Kind(index: 1, name: "Pins")
        static let content = Kind(index: 2, name: "All Themes")
        
        static let allCases: [Theme.Kind] = [.post, .pin, .content]
        
        let index: Int
        let name: String
    }

    struct Icon: CaseIterable {
        let icon: UIImage
        let typeIndex: Int
        
        static let youtube = Icon(icon: UIImage(), typeIndex: 0)
        static let telegram = Icon(icon: UIImage(), typeIndex: 1)
        
        static let allCases: [Theme.Icon] = [
            .telegram, .youtube
        ]
        
        static func byIndex(_ index: Int) -> Icon? {
            return allCases.first { $0.typeIndex == index }
        }
    }
    
    let title: String
    let title2: String?
    let icon: Icon?
    
    let contentImageUrl: String?
    let content: Content
    let kind: Kind
}

typealias Themes = [Theme]


// openspace kind of content can has inside
// - link to openspace config (support only github links in fuv1)
// - openspace json
