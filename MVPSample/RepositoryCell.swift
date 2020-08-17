//
//  RepositoryCell.swift
//  MVPSample
//
//  Created by SRA01 on 2020/08/17.
//  Copyright © 2020 nishitaku. All rights reserved.
//

import UIKit
import GitHub

class RepositoryCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var falkLabel: UILabel!
    
    func configure(repository: Repository) {
        nameLabel.text = repository.name
        descriptionLabel.text = repository.description
        languageLabel.text = repository.language
        starLabel.text = "star: \(repository.stargazersCount)"
        falkLabel.text = "falk: \(repository.forksCount)"
    }
}
