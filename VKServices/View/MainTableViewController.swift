//
//  MainTableViewController.swift
//  VKServices
//
//  Created by Alex Ch. on 12.07.2022.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    // MARK: - Private properties
    
    private let testArray: [String] = ["First cell", "Second cell", "Third cell"]
    private let api = Api()
    private let networkManager = NetworkManager()
    private var services: [Service] = []
    
    
    // MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        tableView.backgroundColor = .black
        getData()
    }
    
    // MARK: - Private methods
    
    private func registerCell(){
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.reuseID)
    }
    
    private func getData(){
        
        let baseURL = api.baseURL
        networkManager.fetchData(url: baseURL) { (result) in
            switch result {
            case .success(let service):
                DispatchQueue.main.async {
                    self.services = service?.body.services ?? []
                    self.tableView.reloadData()
                }
            case .failure(_):
                self.showAlertError(text: "Пожалуйста, проверьте соединение.")
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.rowHeight = 100
        return services.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.reuseID, for: indexPath) as? CustomTableViewCell{
            cell.backgroundColor = .black
            let service = services[indexPath.row]
            cell.setupCell(model: service)
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // переход в сервис
    }
    
}
