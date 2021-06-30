//
//  Articles.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation

struct Source: Codable {
    let id: String
    let name: String
}

struct Articles: Codable {
    let author: String
    let title: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
    let description: [Source]
}
