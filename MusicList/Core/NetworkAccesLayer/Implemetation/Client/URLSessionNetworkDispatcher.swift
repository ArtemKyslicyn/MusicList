//
//  URLSessionNetworkDispatcher.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import Foundation

public class URLSessionNetworkDispatcher: NetworkDispatcher {
	
	public func dispatch<T>(request: T, onSuccess: @escaping (Data) -> Void, onError: @escaping (Error) -> Void) where T : AbstractRequest {
		guard let url = URL(string: request.path) else {
			onError(ConnError.invalidURL)
			return
		}
	
		var urlRequest = URLRequest(url: url)
		urlRequest.httpMethod = request.method.rawValue
	
		do {
			if let params = request.params {
				urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
			}
		} catch let error {
			onError(error)
			return
		}
		
		URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
			if let error = error {
				onError(error)
				return
			}
			
			guard let data = data else {
				onError(ConnError.noData)
				return
			}
	
			onSuccess(data)
		}.resume()
	}
}


