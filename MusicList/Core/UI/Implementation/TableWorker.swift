//
//  File.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import UIKit

class TableWorker<Cell: AbstractCell> : NSObject, UITableViewDelegate, UITableViewDataSource {

	private let tableView: UITableView
	public var items: [Cell.Item] = [] {
		didSet {
			self.tableView.reloadData()
		}
	}

	public var selectedItem: ((Cell.Item) -> Void)?

	init(with tableView: UITableView) {
		self.tableView = tableView
		self.tableView.register(Cell.self, forCellReuseIdentifier: Cell.cellIdentifier)
		super.init()
		self.tableView.delegate = self
		self.tableView.dataSource = self
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if items.count > indexPath.row {
			self.selectedItem?(items[indexPath.row])
		}
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: Cell.cellIdentifier, for: indexPath)

		if items.count > indexPath.row, let cell = cell as? Cell {
			cell.configureCell(with: self.items[indexPath.row])
		}

		return cell
	}
}
