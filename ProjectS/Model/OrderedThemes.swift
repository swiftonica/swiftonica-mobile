//
//  OrderedThemes.swift
//  ProjectS
//
//  Created by Jeytery on 10.12.2022.
//

import Foundation

struct OrderedThemes {
    typealias ThemesDicionary = [Theme.Kind: Themes]
    
    func kindName(by index: Int) -> String? {
        for (_, value) in dictionary {
            if value.first?.kind.index == index {
                return value.first?.kind.name ?? nil
            }
        }
        return nil
    }
    
    init(themes: Themes) {
        self.themes = themes
        self.arrays = recountArrays(self.themes)
        self.dictionary = recountDictionary(self.themes)
    }
    
    var themes: Themes {
        didSet {
            self.arrays = recountArrays(self.themes)
            self.dictionary = recountDictionary(self.themes)
        }
    }
    
    var arrays: [Themes] = []
    var dictionary: ThemesDicionary = [:]
}

private extension OrderedThemes {
    func recountArrays(_ themes: Themes) -> [Themes] {
        var _arr = [Themes]()
        for kind in Theme.Kind.allCases {
            _arr.insert(Themes(), at: kind.index)
        }
        themes.forEach {
            _arr[$0.kind.index].append($0)
        }
        return _arr
    }
    
    func recountDictionary(_ themes: Themes) -> ThemesDicionary {
        var _dict = ThemesDicionary()
        themes.forEach {
            if _dict[$0.kind] == nil {
                _dict[$0.kind] = Themes()
                _dict[$0.kind]?.append($0)
            }
            else {
                _dict[$0.kind]?.append($0)
            }
        }
        return _dict
    }
}
