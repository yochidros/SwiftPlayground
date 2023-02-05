//
//  IMDBMovie.swift
//
//
//  Created by yochidros on 2023/02/05.
//

import Foundation

public struct IMDBMovie: Decodable, Sendable {
    public let id: String
    public let rank: String
    public let title: String
    public let fullTitle: String
    public let year: String
    public let image: String
    public let crew: String
    public let imDbRating: String
    public let imDbRatingCount: String
}
