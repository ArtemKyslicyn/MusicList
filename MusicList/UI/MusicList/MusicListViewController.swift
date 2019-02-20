//
//  ViewController.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 16.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import UIKit

class MusicListViewController: UIViewController {

	var musicListService: AbstractMusicListService!
	var tableWorker: AbstractWorker!
	let listService: AbstractMusicListService = MusicListService()

	override func loadView() {

		let view = MusicListView()
		self.tableWorker = TableWorker <TableItem, ArtistCell>(tableView: view.tableView)
		self.view = view

	}
	override func viewDidLoad() {
		super.viewDidLoad()

		listService.searchBy(string: "jack jonhson", success: { artists in

			self.tableWorker.items = artists.map { artist -> ArtistItem in
				 ArtistItem(name: artist.artistName,
						   songName: artist.trackName,
						   imageUrl: artist.imageUrl,
						   artistId: artist.artistId)
			}

		}, errorBlock: { error in
			print(error)
		})

		self.tableWorker.selectedItem = {item in
			if let item = item as? ArtistItem {
				let viewController = MusicDeatilViewController(albumId: item.artistId ?? 0)
			    self.present(viewController, animated: true, completion: nil)
			}

		}
	}
}
