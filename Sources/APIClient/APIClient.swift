//
//  APIClient.swift
//  
//
//  Created by yochidros on 2023/02/04.
//

import Foundation
#if os(Linux) && canImport(FoundationNetworking)
import FoundationNetworking
#endif

public struct APIClient: Sendable {
    let urlSession: URLSession
    /// Change url-request to adding header values, change url path that is contains this like ApiKey in dynamic
    let didMakeRequest: @Sendable (inout URLRequest) -> Void

    // TODO: Todo
    /// - use actor for url-session is thread safe
    /// - Adding
    ///    - Header handler
    ///    - Authorization handler
    ///    - ChangeBaseURL handler
    ///    - etc.
    public init(
        configuration: URLSessionConfiguration = .default,
        didMakeRequest: @Sendable @escaping (inout URLRequest) -> Void
    ) {
        self.urlSession = .init(configuration: configuration)
        self.didMakeRequest = didMakeRequest
    }

    @Sendable public func send<Request: RequestProtocol, Response: Decodable>(
        request: Request,
        decodeTo response: Response.Type
    ) async throws -> Response {
        var req: URLRequest
        do {
            req = try request.makeRequest()
            didMakeRequest(&req)
        } catch {
            throw APIClientError.invalidateRequest(error)
        }
        #if DEBUG
            print("Final Request:", req)
        #endif
        let (data, _response) = try await urlSession.data(for: req)
//        if let httpResponse = response as? HTTPURLResponse {
//            httpResponse.statusCode
//        }
        print(data, _response)
        do {
            return try JSONDecoder().decode(response, from: data)
        } catch {
            throw APIClientError.decode(error)
        }
    }
}


