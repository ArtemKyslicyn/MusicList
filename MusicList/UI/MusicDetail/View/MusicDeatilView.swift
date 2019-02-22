//
//  AlbumsView.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 19.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import UIKit

class MusicDetailView: UIView {

	var tableView: UITableView = UITableView()

	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .red
		tableView.backgroundColor = UIColor.green

		self.addSubview(tableView)

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
