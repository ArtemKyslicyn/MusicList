//
//  MusicListService.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import Foundation

typealias ArtistSuccesBlock = ([Artist]) -> Void
typealias ErrorBlock = (Error) -> Void

protocol AbstractMusicListService {

	/// searchin by string
	///
	/// - Parameters:
	///   - string: search string
	///   - success: success closure
	///   - errorBlock: error closure
	func searchBy(string: String, success:@escaping ArtistSuccesBlock, errorBlock:@escaping ErrorBlock)
}

/// service for getting artissts
final class MusicListService: AbstractMusicListService {

	let networkDispatcher: NetworkDispatcher

	/// init service
	///
	/// - Parameter networkDispatcher: injection for network dispatcher
	init(networkDispatcher: NetworkDispatcher = URLSessionNetworkDispatcher()) {
		self.networkDispatcher = networkDispatcher
	}

	/// searchin by string
	///
	/// - Parameters:
	///   - string: search string
	///   - success: success closure
	///   - errorBlock: error closure
	func searchBy(string: String, success: @escaping ([Artist]) -> Void, errorBlock: @escaping (Error) -> Void) {
		let requestString = string.replacingOccurrences(of: " ", with: "+")
		guard var components = URLComponents(string: ApiURL.search.rawValue) else {
			errorBlock(ConnError.invalidURL)
			return
		}

		let searchItem = URLQueryItem(name: ApiKeys.termKey, value: requestString)
		components.queryItems = [searchItem]
		let url = components.string ?? ApiURL.search.rawValue
		let request = PacketRequest(path: url, type: SearchResult.self)
		networkDispatcher.dispatch(request: request, onSuccess: { searchResult in

			DispatchQueue.main.async {
				let results = searchResult.results.filter { $0.artistId != nil }
				success(results)
			}
		}, onError: { error in
			DispatchQueue.main.async {
				errorBlock(error)
			}
		})
	}

}
