//
//  ServiceTableViewCell.swift
//  VKServices
//
//  Created by gleba on 14.07.2022.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {

    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var serviceIconView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        activityIndicator.startAnimating()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
