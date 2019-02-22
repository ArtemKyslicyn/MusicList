//
//  AbstractCell.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import UIKit

protocol AbstractCell: ReuseIdentifierProtocol {
	associatedtype Item

	func configureCell(with item: Item)
}
