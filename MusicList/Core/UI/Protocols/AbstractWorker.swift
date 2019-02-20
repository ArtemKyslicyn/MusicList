//
//  AbstractWorker.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import Foundation

typealias  SelectedWorkerItem = (AbstractItem) -> Void

protocol AbstractWorker {
	var selectedItem: SelectedWorkerItem? { get set }
	var items: [AbstractItem]? { get set }
}
