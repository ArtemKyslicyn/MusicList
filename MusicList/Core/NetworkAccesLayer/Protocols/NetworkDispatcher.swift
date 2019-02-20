//
//  HTTPClientProtocol.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import Foundation

public enum ConnError: Swift.Error {
	case invalidURL
	case noData
	case cantParseData
}

public enum HTTPMethod: String {
	case get = "GET"
	case post = "POST"
	case put = "PUT"
	case delete = "DELETE"
	case patch = "PATCH"
}


public protocol NetworkDispatcher {
	func dispatch<T: AbstractRequest>(request: T, onSuccess: @escaping (Data) -> Void, onError: @escaping (Error) -> Void)
}


