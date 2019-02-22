//
//  MusicDetailSercvice.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import Foundation

typealias AlbumsSuccesBlock = ([Albums]) -> Void

protocol AbstractAlbumsListService {

	func albumsBy(albumId: UInt64, success:@escaping AlbumsSuccesBlock, errorBlock:@escaping ErrorBlock)
}

class AlbumsListService: AbstractAlbumsListService {

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
		networkDispatcher.dispatch(request: request, onSuccess: { searchResult in

			DispatchQueue.main.async {
				success(searchResult.results)
			}
		}, onError: { error in

			DispatchQueue.main.async {
				errorBlock(error)
			}
		})
	}

	let networkDispatcher: NetworkDispatcher = URLSessionNetworkDispatcher()
}
