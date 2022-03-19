//
//  CategoriesTableViewCell.swift
//  Doyduk
//
//  Created by yunus oktay on 18.03.2022.
//

import UIKit
import Kingfisher

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var prefixLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with category: Category) {
        prefixLabel.text = category.prefix
        nameLabel.text = category.name
        logoImageView.kf.setImage(with: category.imageUrl)
    }
}
