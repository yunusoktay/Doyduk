//
//  ProductTableViewCell.swift
//  Doyduk
//
//  Created by yunus oktay on 19.03.2022.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with product: Product) {
        
        logoImageView.kf.setImage(with: product.imageUrl)
        nameLabel.text = product.name
        priceLabel.text = "₺\(product.price)"
        descriptionLabel.text = product.description
    }
    
}
