//
//  File.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import UIKit

class TableWorker <Item:TableItem ,Cell:ConstructorCell> :NSObject ,UITableViewDelegate, UITableViewDataSource ,AbstractWorker {

	
	private unowned let tableView : UITableView
	public var items : [AbstractItem]?{
		didSet{
			self.tableView.reloadData()
		}
	}
	
	public var selectedItem : SelectedWorkerItem?

	
	
	init(tableView:UITableView) {
		self.tableView = tableView
		self.tableView.register(Cell.self, forCellReuseIdentifier: Cell.cellIdentifier())
		super.init()
		self.tableView.delegate = self
		self.tableView.dataSource = self
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let item = items?[indexPath.row]
		{
			self.selectedItem?(item)
		}
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: Cell.cellIdentifier(), for: indexPath as IndexPath) as! ConstructorCell
		
		if let item = self.items?[indexPath.row]{
			cell.configureCellWithItem(item: item)
		}

		return cell
	}
}
