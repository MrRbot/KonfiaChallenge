//
//  DogCell.swift
//  KonfioChallenge
//
//  Created by Javier on 12/12/19.
//  Copyright © 2019 MrRobot. All rights reserved.
//

import UIKit
import Kingfisher

class DogCell: UITableViewCell {

    @IBOutlet var cardView: UIView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var dogImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.roundAllCorners()
        dogImageView.roundAllCorners()
        dogImageView.contentMode = .scaleAspectFill
    }
    
    func configCell(_ dog: Dog) {
        self.dogImageView.kf.setImage(with: URL(
            string: dog.url.removeEmptySpaces()))
        self.nameLabel.text = dog.dogName
        self.descriptionLabel.text = dog.description
        self.ageLabel.text = "Almost \(dog.age) years"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
