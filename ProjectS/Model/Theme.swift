//
//  Theme.swift
//  ProjectS
//
//  Created by Jeytery on 29.11.2022.
//

import Foundation
import UIKit

struct Theme: Codable {
    struct Content: Codable {
        let content: String
        let kind: Int
        
        var unwrapedKind: Kind? {
            return Kind(rawValue: kind)
        }
        
        enum Kind: Int, Codable {
            case url = 0
            case openspace = 1
            case markdown = 2
        }
          
        func get() -> String {
            return content
        }
        
//        init(content: String, kind: Kind) {
//            self.content = content
//            self.kind = kind.rawValue
//        }
    }
    
    struct Kind: CaseIterable, Hashable, Codable {
        static let post = Kind(index: 0, name: "Posts")
        static let pin = Kind(index: 1, name: "Pins")
        static let content = Kind(index: 2, name: "All Themes")
        
        static let allCases: [Theme.Kind] = [.post, .pin, .content]
        
        let index: Int
        let name: String
        
        static func byIndex(_ index: Int) -> Kind? {
            return allCases.first { $0.index == index }
        }
    }

    enum Icon: Int, CaseIterable, Codable {
        case telegram = 0
        case youtube = 1
        
        var icon: UIImage {
            let icons = [UIImage(), UIImage()]
            return icons[self.rawValue]
        }
    }
    
    let title: String
    let title2: String?
    
    let icon: Int?
    
    var unwrappedIcon: Icon? {
        return Icon.init(rawValue: icon ?? -1)
    }
    
    let contentImageUrl: String?
    let content: Content
    let kind: Int
    
    var unwrappedKind: Kind {
        return Kind.byIndex(kind) ?? .content
    }
    
}

typealias Themes = [Theme]


// openspace kind of content can has inside
// - link to openspace config (support only github links in fuv1)
// - openspace json
