//
//  APIError.swift
//  LocalEventExplorer
//
//  Created by Chinghok on 21/10/26.
//

import Foundation

enum APIError: Error {

    case networkUnavailable
    case invalidResponse
    case decodingFailed
    case serverError(Int)
}
