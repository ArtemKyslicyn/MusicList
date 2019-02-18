//
//  MusicListView.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import UIKit

class MusicListView: UIView{
	
	var tableView : UITableView = UITableView()
	var searchBar : UISearchBar = UISearchBar()
	
	override init(frame: CGRect) {
		super.init(frame:frame)
		 self.backgroundColor = UIColor.red
		 tableView.backgroundColor = UIColor.green
		 self.addSubview(searchBar)
		 self.addSubview(tableView)
		
		 self.translatesAutoresizingMaskIntoConstraints = false
		 tableView.translatesAutoresizingMaskIntoConstraints = false
		
		setupSearchBarwConstraints()
		setupTableViewConstraints()
	}
	
	func setupSearchBarwConstraints(){
		NSLayoutConstraint.activate([
			searchBar.leftAnchor.constraint(equalTo: self.leftAnchor),
			searchBar.rightAnchor.constraint(equalTo: self.rightAnchor),
			searchBar.topAnchor.constraint(equalTo: self.topAnchor),
			searchBar.heightAnchor.constraint(equalToConstant: 64),
			])
	}
	
	func setupTableViewConstraints(){
		NSLayoutConstraint.activate([
			tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
			tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
			tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
			tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			])
	}
	
//	tableView.widthAnchor.constraint(equalToConstant: 64),
//	tableView.heightAnchor.constraint(equalToConstant: 64),
//	tableView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//	tableView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
