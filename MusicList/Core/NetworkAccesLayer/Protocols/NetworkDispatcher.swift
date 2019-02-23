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
	func dispatch<T: AbstractRequest>(request: T, onSuccess: @escaping (T.Item) -> Void, onError: @escaping (Error) -> Void)
}
