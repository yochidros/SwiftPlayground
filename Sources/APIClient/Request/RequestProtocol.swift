//
//  File.swift
//  
//
//  Created by yochidros on 2023/02/05.
//

import Foundation
#if os(Linux) && canImport(FoundationNetworking)
import FoundationNetworking
#endif

public protocol RequestProtocol: Sendable {
    var path: String { get }
    var query: [String: String]? { get }
    func makeRequest() throws -> URLRequest
}
extension RequestProtocol {
    public var query: [String: String]? {
        nil
    }
}
