import Foundation
import APIClient
import IMDBAPIClient

extension APIClient {
    static let imdb: APIClient = {
        APIClient.init(didMakeRequest: { req in
            guard let url = req.url else {
                return
            }
            if let apiKey = ProcessInfo.processInfo.environment["IMDB_API_KEY"] {
                req.url = URL(string: url.absoluteString.replacingOccurrences(of: "_apiKey_", with: apiKey))
            }
        })
    }()

    func send<T: Decodable & Sendable>(request: IMDBAPIRequest, response: T.Type) async throws -> T {
        try await Self.imdb.send(request: request, decodeTo: response)
    }
}

async let v = Task.detached {
    let res = try await APIClient.imdb.send(
        request: .init(path: .top250TVs, method: .get),
        response: ItemsResponse<[IMDBMovie]>.self
    )
}
async let v2 = Task.detached {
    do {
        let res = try await APIClient.imdb.send(
            request: .init(path: .search(term: "inception"), method: .get),
            response: SearchResultResponse<[SearchResult]>.self
        )
    } catch {
        print(error)
    }
}

let (v11, v22) = try await (v, v2)
Thread.sleep(forTimeInterval: 5)

