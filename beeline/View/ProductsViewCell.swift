//
//  ProductsViewCell.swift
//  beeline
//
//  Created by Asf on 09.11.2022.
//

import UIKit
import SDWebImage
class ProductsViewCell: UITableViewCell {
    
    var button = UIButton()
    var productImageView = UIImageView()
    var productLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(productImageView)
        addSubview(productLabel)
        configureImageView()
        configureTitleLabel()
        setImageContraints()
        setLabelContraints()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(product: Product){
        guard let url = URL(string: product.thumbnail) else {return}
        productImageView.sd_setImage(with: url)
        productLabel.text = product.title
    }
    
     func configureImageView() {
        productImageView.layer.cornerRadius = 10
        productImageView.clipsToBounds = true    }
    
    func configureTitleLabel() {
        productLabel.numberOfLines = 0
        productLabel.adjustsFontSizeToFitWidth = true
    }
    
    
    
    func setImageContraints() {
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        productImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        productImageView.widthAnchor.constraint(equalTo: productImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func setLabelContraints() {
        productLabel.translatesAutoresizingMaskIntoConstraints = false
        productLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        productLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 20).isActive = true
        productLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        productLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        
    }
    
}
