//
//  HTTPRequest.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import Foundation

public struct PacketRequest<T: Codable> : AbstractRequest {

	public let path: String
	public let method: HTTPMethod
	public let params: [String: Any?]?
	public let headers: [String: String]?
	public let resultType: T.Type

	public init (
		path: String,
		type: T.Type,
		method: HTTPMethod = .get,
		params: [String: Any?]? = nil,
		headers: [String: String]? = nil
		) {
		self.path = path
		self.resultType = type
		self.method = method
		self.params = params
		self.headers = headers
	}
}
