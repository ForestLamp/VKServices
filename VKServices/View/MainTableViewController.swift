//
//  MainTableViewController.swift
//  VKServices
//
//  Created by Alex Ch. on 12.07.2022.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    // MARK: - Private properties
    
    private let api = Api()
    private let networkManager = NetworkManager()
    private var services: [Service] = []
    
    // MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTable()
        getData()
        setupNavBar()
    }
    
    // MARK: - Private methods
    
    private func getData(){
        let baseURL = api.baseURL
        networkManager.fetchData(url: baseURL)
        networkManager.delegate = self
    }
    
    private func setupTable(){
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.reuseID)
        tableView.backgroundColor = .black
    }
    
    private func setupNavBar(){
        title = "Сервисы VK"
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.rowHeight = 90
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

// MARK: - Extension

extension MainTableViewController: NetworkManagerDelegate {
    func showData(results: [Service]) {
        services = results
        tableView.reloadData()
    }
    
    func showError() {
        let alert = AlertManager.showAlertError(text: "Пожалуйста, проверьте соединение.")
        present(alert, animated: true, completion: nil)
    }
}
