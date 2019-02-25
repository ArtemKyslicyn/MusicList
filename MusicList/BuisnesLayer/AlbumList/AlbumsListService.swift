//
//  MusicDetailSercvice.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import Foundation

typealias AlbumsSuccesBlock = ([Albums]) -> Void

///Protocol for getting list service
protocol AbstractAlbumsListService {

	func albumsBy(albumId: UInt64, success:@escaping AlbumsSuccesBlock, errorBlock:@escaping ErrorBlock)
}

/// Service for getting list of albums for Artist
final class AlbumsListService: AbstractAlbumsListService {

	let networkDispatcher: NetworkDispatcher!

	/// init service
	///
	/// - Parameter networkDispatcher: injection for network dispatcher
	init(networkDispatcher: NetworkDispatcher = URLSessionNetworkDispatcher()) {
		self.networkDispatcher = networkDispatcher
	}

	/// get artist by album id
	///
	/// - Parameters:
	///   - albumId: identifier of album
	///   - success: Success closure
	///   - errorBlock: error closure
	func albumsBy(albumId: UInt64, success: @escaping ([Albums]) -> Void, errorBlock: @escaping (Error) -> Void) {

		guard var components = URLComponents(string: ApiURL.lookup.rawValue) else {
			errorBlock(ConnError.invalidURL)
			return
		}

		let searchItem = URLQueryItem(name: ApiKeys.idKey, value: String(albumId))
		let albumItem = URLQueryItem(name: ApiKeys.entityKey, value: ApiKeys.albumCategory)
		components.queryItems = [searchItem, albumItem]
		let url = components.string ?? ApiURL.lookup.rawValue

		let request = PacketRequest(path: url, type: AlbumsResult.self)

		networkDispatcher.dispatch(request: request) { resultObject in

			switch resultObject {
			case .error(let error):
				errorBlock(error)
			case .success(let result):
				success(result.results)
			}

		}
	}
}
