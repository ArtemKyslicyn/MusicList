
//  AbstractCell.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import UIKit

protocol ReuseIdentifierProtocol: class { }

extension ReuseIdentifierProtocol {
	static var cellIdentifier: String {
		return String(describing: self)
	}
}

extension UITableViewCell: ReuseIdentifierProtocol { }
