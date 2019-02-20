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

	func searchBy(string: String, success:@escaping ArtistSuccesBlock, errorBlock:@escaping ErrorBlock)
}

class MusicListService: AbstractMusicListService {

	func searchBy(string: String, success: @escaping ([Artist]) -> Void, errorBlock: @escaping (Error) -> Void) {
		let requestString = string.replacingOccurrences(of: " ", with: "+")
		guard var components = URLComponents(string: ApiURL.search.rawValue) else {
			errorBlock(ConnError.invalidURL)
			return
		}

		let searchItem = URLQueryItem(name: termKey, value: requestString)
		components.queryItems = [searchItem]
		let url = components.string ?? ApiURL.search.rawValue
		let request = PacketRequest(path: url)
		networkDispatcher.dispatch(request: request, onSuccess: { data in

			guard let searchResult = try? self.converter.convertDataToObject(SearchResult.self, data: data) else {
				errorBlock(ConnError.cantParseData)
				return
			}
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
	let converter = ArtistConverter()
}
