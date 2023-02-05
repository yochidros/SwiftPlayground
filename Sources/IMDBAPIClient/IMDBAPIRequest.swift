//
//  IMDBAPIRequest.swift
//
//
//  Created by yochidros on 2023/02/05.
//

import APIClient
import Foundation
#if os(Linux) && canImport(FoundationNetworking)
    import FoundationNetworking
#endif

public struct IMDBAPIRequest: Sendable, RequestProtocol {
    public let path: String
    public let method: HTTPMethod
    public let query: [String: String]?
    public let body: Data?

    public let baseURLString: String = "https://imdb-api.com/API"
    private let encoder = JSONEncoder()

    public init(
        path: IMDBAPIEndpoint,
        method: HTTPMethod,
        query: [String: Any?]? = nil,
        body: Data? = nil
    ) {
        self.path = path.path
        self.method = method
        self.query = query?.compactMapValues { $0 as? String }
        self.body = body
    }

    public func makeRequest() throws -> URLRequest {
        guard var url = URLComponents(string: baseURLString + path) else {
            throw RequestError.invalidURLString
        }
        url.queryItems = query?.compactMap {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        guard let _url = url.url else {
            throw RequestError.invalidURLString
        }
        var req = URLRequest(url: _url)
        req.httpMethod = method.rawValue
        if let body {
            req.httpBody = body
        }
        req.timeoutInterval = 10.0
        return req
    }
}
