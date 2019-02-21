//
//  ViewController.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 16.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import UIKit

let deafaultSearchString = "John Johnson"

class MusicListViewController: UIViewController, UISearchBarDelegate {

	var musicListService: AbstractMusicListService!
	var tableWorker: AbstractWorker!
	let listService: AbstractMusicListService = MusicListService()

	override func loadView() {

		let view = MusicListView()
		view.searchBar.delegate = self
		view.searchBar.text = deafaultSearchString
		searchByString(searchString: deafaultSearchString)
		self.tableWorker = TableWorker <TableItem, ArtistCell>(tableView: view.tableView)
		self.view = view

	}

	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		searchBar.resignFirstResponder()
		if let searchString = searchBar.text, !searchString.isEmpty {
			searchByString(searchString: searchString)
		}
	}

	func searchByString(searchString: String) {
		listService.searchBy(string: searchString, success: { artists in

			self.tableWorker.items = artists.map { artist -> ArtistItem in
				ArtistItem(name: artist.artistName,
						   songName: artist.trackName,
						   imageUrl: artist.imageUrl,
						   artistId: artist.artistId)
			}

		}, errorBlock: { error in
			print(error)
		})
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		self.tableWorker.selectedItem = {item in
			if let item = item as? ArtistItem {
				let viewController = MusicDeatilViewController(albumId: item.artistId ?? 0)
			    self.present(viewController, animated: true, completion: nil)
			}

		}
	}
}
