//
//  AlbumsView.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 19.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import UIKit

/// Album ofdetail list
class MusicDetailView: UIView {

	/// tableView of albums lis
	var tableView: UITableView = UITableView()

	/// init
	///
	/// - Parameter frame: rect
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.addSubview(tableView)
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
