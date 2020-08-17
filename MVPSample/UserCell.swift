//
//  UserCell.swift
//  MVPSample
//
//  Created by SRA01 on 2020/08/17.
//  Copyright © 2020 nishitaku. All rights reserved.
//

import UIKit
import GitHub

class UserCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    private var task: URLSessionTask?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        task?.cancel()
        task = nil
        imageView?.image = nil
    }
    
    func configure(user: User) {
        task = {
            let url = user.avatarURL
            let task = URLSession.shared.dataTask(with: url) {data, response, error in
                guard let imageData = data else { return }
                
                DispatchQueue.global().async { [weak self] in
                    guard let image = UIImage(data: imageData) else { return }
                    
                    DispatchQueue.main.async {
                        self?.iconImageView?.image = image
                        self?.setNeedsLayout()
                    }
                }
            }
            task.resume()
            return task
        }()
        
        nameLabel.text = user.login
    }
    
}
