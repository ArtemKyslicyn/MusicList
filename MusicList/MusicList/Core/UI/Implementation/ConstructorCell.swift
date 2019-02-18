//
//  ConstructorCell.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import UIKit

class ConstructorCell : UITableViewCell, AbstractCell {
	
//	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//		self.init()
//	}
//
	class func cellIdentifier() -> String{
		return "AbstractCell"
	}
	
//	required init?(coder aDecoder: NSCoder) {
//		fatalError("init(coder:) has not been implemented")
//	}
//	
	func configureCellWithItem(item:AbstractItem)
	{
		
	}
}
