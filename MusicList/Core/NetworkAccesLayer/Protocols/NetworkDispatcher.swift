//
//  HTTPClientProtocol.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import Foundation

/// Error
///
/// - invalidURL: error with request URL
/// - noData: error with responce data
/// - cantParseData: can't Parse JSON
public enum ConnError: Swift.Error {
	case invalidURL
	case noData
	case cantParseData
}

/// Network Result Enum
///
/// - Success: success Value
/// - Error: errorValue
public enum Result <V, E> {
	case success(V)
	case error(E)
}

/// HTTPMethod
///
/// - get: HTTP get request
/// - post: HTTP post request
/// - put: HTTP put request
/// - delete: HTTP delete
/// - patch: HTTP patch request
public enum HTTPMethod: String {
	case get = "GET"
	case post = "POST"
	case put = "PUT"
	case delete = "DELETE"
	case patch = "PATCH"
}

/// NetworkDispatcher
public protocol NetworkDispatcher {

	/// Dispatch Package
	///
	/// - Parameters:
	///   - request: Request Object
	///   - onSuccess: successClosure
	///   - onError: error Closure
	func dispatch<T>(request: T, queue: DispatchQueue, onResult: @escaping (Result<T.Item, Error>) -> Void) where T: AbstractRequest
}

extension NetworkDispatcher {
	func dispatch<T>(request: T, queue: DispatchQueue = DispatchQueue.main, onResult: @escaping (Result<T.Item, Error>) -> Void) where T: AbstractRequest {
		return dispatch(request: request, queue: queue, onResult: onResult)
	}
}
