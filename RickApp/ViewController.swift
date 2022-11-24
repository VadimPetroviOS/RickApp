//
//  ViewController.swift
//  RickApp
//
//  Created by Вадим on 15.11.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView = UITableView()
    let parser = Parser()
    var result = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(
            TableViewCell.self,
            forCellReuseIdentifier: TableViewCell.identifier
        )
        self.navigationItem.title = "Characters"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.addSubview(self.tableView)
        parser.parse { data in
            self.result = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableView.frame = view.bounds
    }
    
}

extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        
        cell.setImage(result: result[indexPath.row].image)
        cell.setName(result: result[indexPath.row].name)
        cell.setSpecies(speciesResult: result[indexPath.row].species, genderResult: result[indexPath.row].gender)
        cell.setOrigin(result: result[indexPath.row].origin.name)
        cell.setStatus(result: result[indexPath.row].status)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
