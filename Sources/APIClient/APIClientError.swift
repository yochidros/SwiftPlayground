//
//  File.swift
//
//
//  Created by yochidros on 2023/02/05.
//

import Foundation

public enum APIClientError: Error {
    case invalidateRequest(Error)
    case decode(Error)
}
