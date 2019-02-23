//
//  AbstractCell.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import UIKit

/// AbstractCell
protocol AbstractCell: ReuseIdentifierProtocol {
	associatedtype Item

	/// metod for configuration Cell
	///
	/// - Parameter item: configuration object for cell
	func configureCell(with item: Item)
}
