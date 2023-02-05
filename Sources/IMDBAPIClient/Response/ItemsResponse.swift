//
//  ItemsResponse.swift
//  
//
//  Created by yochidros on 2023/02/05.
//

import Foundation

public struct ItemsResponse<T: Decodable & Sendable>: Decodable, Sendable {
    public let items: T
}
