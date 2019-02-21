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
		 self.translatesAutoresizingMaskIntoConstraints = false
		 tableView.translatesAutoresizingMaskIntoConstraints = false
		setupTableViewConstraints()
	}

	func setupTableViewConstraints() {
		NSLayoutConstraint.activate([
			tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
			tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
			tableView.topAnchor.constraint(equalTo: self.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
		])
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
