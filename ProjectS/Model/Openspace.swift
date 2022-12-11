//
//  Openspace.swift
//  ProjectS
//
//  Created by Jeytery on 06.12.2022.
//

import Foundation

struct Openspace: Codable {
    let name: String
    let id: String
    
    let themes: Themes
}

// OPENSPACE PROTOCOL

// - openspace is a json created by specification
// - openspace has to have parser: json -> full markdown, full json, json -> folders

// folders contains:
// all content in folders + json, markdown (only with links) for each directory

// fulll markdonw, full json contains
// all content from all directories in one file

// app is going to undestand both of variants - as full json/markdown as folders

func SwiftonicaOpenspace() -> Openspace {
    return .init(
        name: "Swifonica",
        id: "swiftonica.openspace.id",
        themes: [
            // posts
            .init(
                title: "NEW POST",
                title2: nil,
                icon: nil,
                contentImageUrl: nil,
                content: .init(
                    content: "https://github.com/",
                    kind: 0
                ),
                kind: 0
            ),
            
            // pins
            .init(
                title: "iOS developer road map",
                title2: nil,
                icon: nil,
                contentImageUrl: nil,
                content: .init(
                    content: "https://github.com/",
                    kind: 0
                ),
                kind: 0
            ),
            
            // content
            .init(
                title: "VIPER",
                title2: nil,
                icon: nil,
                contentImageUrl: nil,
                content: .init(
                    content: "https://github.com/",
                    kind: 0
                ),
                kind: 0
            )
        ]
    )
}
