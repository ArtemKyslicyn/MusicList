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
	func getArtists(success:ArtistSuccesBlock, errorBlock:ErrorBlock)
	
	func searchBy(string:String , success:@escaping ArtistSuccesBlock, errorBlock:@escaping ErrorBlock)
}

class MusicListService : AbstractMusicListService {
	
	func searchBy(string: String, success: @escaping ([Artist]) -> Void, errorBlock: @escaping (Error) -> Void) {
		let requestString = string.replacingOccurrences(of: " ", with: "+")
		if var components = URLComponents(string: ApiURL.search.rawValue){
			let searchItem = URLQueryItem(name:termKey, value: requestString)
			components.queryItems = [searchItem]
			let url = components.string ?? ApiURL.search.rawValue
			let request = PacketRequest(path: url)
			networkDispatcher.dispatch(request: request, onSuccess: { (data) in
				let artists = self.converter.convertDataToObjects(data: data)
				DispatchQueue.main.async {
					success(artists)
				}
				
			}, onError: { (error) in
				
				DispatchQueue.main.async {
					errorBlock(error)
				}
			})
		}
	}
	
	
	let networkDispatcher:NetworkDispatcher = URLSessionNetworkDispatcher()
	let converter = ArtistConverter()
	
//	func searchBy(string: String, success: @escaping ([Artist]) -> Void, errorBlock: (Error) -> Void) {
//
//		let request = PacketRequest(path: ApiURL.search.rawValue,params:[termKey:string])
//		networkDispatcher.dispatch(request: request, onSuccess: { (data) in
//			let arctists = self.converter.convertDataToObjects(data: data)
//			success(arctists)
//		}, onError: { (error) in
//
//		})
//	}
	
	
	func getArtists(success: ([Artist]) -> Void, errorBlock: (Error) -> Void) {
		
		
		let request = PacketRequest(path: ApiURL.search.rawValue)
		networkDispatcher.dispatch(request: request, onSuccess: { (data) in
			
		}, onError: { (error) in
			
		})
	}
	
}
