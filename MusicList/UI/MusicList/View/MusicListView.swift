//
//  MusicListView.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import UIKit

class MusicListView: UIView {

	var tableView: UITableView = UITableView()
	var searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 0, height: 50))

	override init(frame: CGRect) {
		super.init(frame: frame)
		 self.addSubview(tableView)
         self.tableView.tableHeaderView = searchBar
		 tableView.translatesAutoresizingMaskIntoConstraints = false
		setupTableViewConstraints()
	}

	func setupTableViewConstraints() {
			tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
			tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
			tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
			tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
