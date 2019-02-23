//
//  URLSessionNetworkDispatcher.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import Foundation

/// Network Dispatcher
public class URLSessionNetworkDispatcher: NetworkDispatcher {

	/// Dispatch Package
	///
	/// - Parameters:
	///   - request: Request Object
	///   - onSuccess: successClosure
	///   - onError: error Closure
	public func dispatch<T>(request: T, onSuccess: @escaping (T.Item) -> Void, onError: @escaping (Error) -> Void) where T: AbstractRequest {

		guard let url = URL(string: request.path) else {
			onError(ConnError.invalidURL)
			return
		}

		var urlRequest = URLRequest(url: url)
		urlRequest.httpMethod = request.method.rawValue

		URLSession.shared.dataTask(with: urlRequest) { data, _, error in
			if let error = error {
				onError(error)
				return
			}

			guard let data = data, let result = try? JSONDecoder().decode(T.Item.self, from: data) else {
					onError(ConnError.noData)
					return
			}
			onSuccess(result)

		}.resume()

	}
}
