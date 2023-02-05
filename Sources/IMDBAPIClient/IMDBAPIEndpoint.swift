//
//  IMDBAPIEndpoint.swift
//
//
//  Created by yochidros on 2023/02/05.
//

import Foundation

public enum IMDBAPIEndpoint: Sendable {
    case top250Movies // = "Top250Movies"
    case top250TVs // = "Top250TVs"
    case search(term: String)

    public var path: String {
        switch self {
        case .top250Movies:
            return "/Top250Movies/_apiKey_"
        case .top250TVs:
            return "/Top250TVs/_apiKey_"
        case let .search(term: term):
            return "/Search/_apiKey_/\(term)"
        }
    }
}
