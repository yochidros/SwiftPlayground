//
//  File.swift
//  
//
//  Created by yochidros on 2023/02/05.
//

import Foundation

public struct SearchResultResponse<T: Decodable & Sendable>: Decodable, Sendable {
    public let searchType: String
    public let expression: String
    public let results: T
}

public struct SearchResult: Decodable, Sendable {
    public let id: String
    public let image: String
    public let title: String
    public let description: String
}
