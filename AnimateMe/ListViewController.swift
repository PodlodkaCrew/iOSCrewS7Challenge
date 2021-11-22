//
//  ListViewController.swift
//  AnimateMe
//
//  Created by katleta3000 on 21.11.2021.
//

import UIKit

final class ListViewCell: UITableViewCell {
	@IBOutlet var avatar: UIImageView! {
		didSet {
			avatar.layer.cornerRadius = 30
		}
	}
	@IBOutlet var author: UILabel!
	@IBOutlet var title: UILabel!
	@IBOutlet var time: UILabel!
}

final class ListViewController: UITableViewController {

	var myView: UITableView { self.view as! UITableView }
	private var items = [DataItem]()

	override func viewDidLoad() {
		super.viewDidLoad()
		Services.dataService.get { items in
			self.items = items
			self.myView.reloadData()
		}
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		items.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ListViewCell", for: indexPath) as! ListViewCell
		let item = items[indexPath.row]
		cell.author.text = item.author
		cell.title.text = item.title
		cell.time.text = item.time
		cell.avatar.image = UIImage(named: item.image)
		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: false)
	}

}
