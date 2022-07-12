//
//  MainTableViewController.swift
//  VKServices
//
//  Created by Alex Ch. on 12.07.2022.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    // MARK: - Private properties
    
  //  private let testArray: [String] = ["First cell", "Second cell", "Third cell"]
    private let cellID = "Cell"
    
    // MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
    
    // MARK: - Private methods
    
    private func registerCell(){
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: cellID)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 20
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? CustomTableViewCell{
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // переход в сервис
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
