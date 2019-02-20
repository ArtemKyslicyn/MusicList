//
//  MusicListDetail.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 16.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import Foundation
import UIKit

class MusicDeatilViewController: UIViewController {

	var musicListService: AbstractMusicListService!
	var tableWorker: AbstractWorker!
	let listService: AbstractMusicDetailtService = MusicDetailService()
	let albumId: UInt64

	init(albumId: UInt64) {
		self.albumId = albumId
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func loadView() {

		let view = MusicDetailView()
		self.tableWorker = TableWorker <TableItem, AlbumsCell>(tableView: view.tableView)
		self.view = view

	}
	override func viewDidLoad() {
		super.viewDidLoad()

		listService.albumsBy(albumId: self.albumId, success: { artists in

			self.tableWorker.items = artists.map { artist -> AlbumItem in
				AlbumItem(name: artist.artistName,
						   songName: artist.trackName,
						   imageUrl: artist.imageUrl,
						   artistId: artist.artistId)
			}

		}, errorBlock: { error in
			print(error)
		})

	}

}
