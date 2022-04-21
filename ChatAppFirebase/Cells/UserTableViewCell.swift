//
//  UserTableViewCell.swift
//  ChatAppFirebase
//
//  Created by Yeskendir on 21.04.2022.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userLogin: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
