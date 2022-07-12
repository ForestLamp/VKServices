//
//  MainTableTableViewController.swift
//  VKServices
//
//  Created by Alex Ch. on 12.07.2022.
//

import UIKit

class MainTableTableViewController: UITableViewController {
    
    // MARK: - Private properties
    
    private let testArray: [String] = ["First cell", "Second cell", "Third cell"]
    private let cellID = "Cell"
    
    // MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
    
    // MARK: - Private methods
    
    private func registerCell(){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return testArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = testArray[indexPath.row]

        return cell
    }

}
