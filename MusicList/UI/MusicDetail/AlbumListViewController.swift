//
//  MusicListDetail.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 16.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import Foundation
import UIKit

class AlbumListViewController: UIViewController {

	typealias AlbumAlias = AlbumsCell<AlbumItem>
	var tableWorker: TableWorker<AlbumAlias>!
	let listService: AbstractAlbumsListService = AlbumsListService()
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
		self.tableWorker = TableWorker<AlbumAlias>(with: view.tableView)
		self.view = view

	}

	override func viewDidLoad() {
		super.viewDidLoad()

		listService.albumsBy(albumId: self.albumId, success: { albums in

			self.tableWorker.items = albums.map { artist -> AlbumItem in
				AlbumItem(name: artist.artistName ?? "",
						   songName: artist.collectionName ?? "",
						   imageUrl: artist.imageUrl ?? "")
			}

		}, errorBlock: { error in
			print(error)
		})

	}

}
