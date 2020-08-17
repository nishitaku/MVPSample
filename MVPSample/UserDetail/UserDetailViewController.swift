//
//  UserDetailViewController.swift
//  MVPSample
//
//  Created by SRA01 on 2020/08/17.
//  Copyright © 2020 nishitaku. All rights reserved.
//

import UIKit
import GitHub

final class UserDetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var presenter: UserDetailPresenterInput!
    func inject(presenter: UserDetailPresenterInput) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        presenter.viewDidLoad()
    }
    
    private func setUp() {
        tableView.estimatedRowHeight = 64
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "RepositoryCell", bundle: nil), forCellReuseIdentifier: "RepositoryCell")
    }
}

extension UserDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell") as! RepositoryCell
        if let repository = presenter.repository(forRow: indexPath.row) {
            cell.configure(repository: repository)
        }
        return cell
    }
}

extension UserDetailViewController: UserDetailPresenterOutput {
    func updateRepositories(_ repositories: [Repository]) {
        tableView.reloadData()
    }
}
