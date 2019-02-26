//
//  ViewController.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 16.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import UIKit

let deafaultSearchString = "John Johnson"

final class MusicListViewController: UIViewController, UISearchBarDelegate {

	typealias ArtistAlias = ArtistCell<ArtistItem>

	private var tableWorker: TableWorker<ArtistAlias>!
	private let listService: AbstractMusicListService
	private let listView = MusicListView()

	/// Albums list init with injection
	///
	/// - Parameters:
	///   - listService: injected albu, list service
	init(listService: MusicListService = MusicListService() ) {
		self.listService = listService
		super.init(nibName: nil, bundle: nil)
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	override func loadView() {
		self.view = listView
	}

	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		searchBar.resignFirstResponder()
		if let searchString = searchBar.text, !searchString.isEmpty {
			searchByString(searchString: searchString)
		}
	}

	func searchByString(searchString: String) {
		listService.searchBy(string: searchString, success: { [weak self] artists in

			self?.tableWorker.items = artists.map { artist -> ArtistItem in
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
        self.view.backgroundColor = .green
		listView.searchBar.delegate = self
		listView.searchBar.text = deafaultSearchString
		searchByString(searchString: deafaultSearchString)
		self.tableWorker = TableWorker<ArtistAlias>(with: listView.tableView)
		self.tableWorker.selectedItem = { [weak self] item in
			let viewController = AlbumListViewController(albumId: item.artistId ?? 0)
			self?.navigationController?.pushViewController(viewController, animated: true)
		}
		listView.setNeedsLayout()
	}
}
