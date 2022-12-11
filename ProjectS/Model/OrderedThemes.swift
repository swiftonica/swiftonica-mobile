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
            if value.first?.unwrappedKind.index == index {
                return value.first?.unwrappedKind.name ?? nil
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
            _arr[$0.unwrappedKind.index].append($0)
        }
        return _arr
    }
    
    func recountDictionary(_ themes: Themes) -> ThemesDicionary {
        var _dict = ThemesDicionary()
        themes.forEach {
            if _dict[$0.unwrappedKind] == nil {
                _dict[$0.unwrappedKind] = Themes()
                _dict[$0.unwrappedKind]?.append($0)
            }
            else {
                _dict[$0.unwrappedKind]?.append($0)
            }
        }
        return _dict
    }
}
