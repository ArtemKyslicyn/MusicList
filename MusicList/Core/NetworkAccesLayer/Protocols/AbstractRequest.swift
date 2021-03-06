//
//  AbstractRequest.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import Foundation

/// Protocol for absract request
public protocol AbstractRequest {
	associatedtype Item: Codable

	var path: String { get }
	var method: HTTPMethod { get }
	var params: [String: Any?]? { get }
	var headers: [String: String]? { get }
	var resultType: Item.Type { get }
}
