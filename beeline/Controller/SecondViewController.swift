//
//  SecondViewController.swift
//  beeline
//
//  Created by Asf on 09.11.2022.
//

import UIKit
import Cosmos

class SecondViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
    
    private let data: Product
    
    var productLabel = UILabel()
    
    var collection: UICollectionView!

    
   private var titleLabel: UILabel = {
       let title = UILabel()
       title.font = .boldSystemFont(ofSize: 25)
        return title
    }()
    
    private var priceLabel: UILabel = {
        let price = UILabel()
        price.font = .systemFont(ofSize: 25)
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "\(price)")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        price.attributedText = attributeString
         return price
     }()
     
    private var discountLabel: UILabel = {
        let discount = UILabel()
        discount.font = .boldSystemFont(ofSize: 25)
         return discount
     }()
    
    private var categoryLabel: UILabel = {
        let category = UILabel()
        category.font = .boldSystemFont(ofSize: 25)
        category.textColor = .lightGray
         return category
     }()
    private var brandLabel: UILabel = {
         let brand = UILabel()
        brand.font = .boldSystemFont(ofSize: 25)
        brand.textColor = .lightGray
          return brand
      }()
    private var descriptionLabel: UILabel = {
        let description = UILabel()
        description.numberOfLines = 0
         return description
     }()
     
    
    private var ratingView: CosmosView = {
            let view = CosmosView()
            view.settings.starSize = 30
            view.settings.updateOnTouch = false
            view.settings.fillMode = .precise
            return view
        }()
    
    var newPrice: Double {
        let newPrice = Double(data.price) - (Double(data.price) * data.discountPercentage/100.0)
        let numberOfPlaces = 2.0
        let multiplier = pow(10.0, numberOfPlaces)
        let rounded = round(newPrice * multiplier) / multiplier
        return rounded
    }
    
    
    init(data: Product) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = data.title
        view.backgroundColor = .white
        titleLabel.text = data.title
        discountLabel.text = "\(newPrice) $"
        priceLabel.text = "\(data.price) $"
        ratingView.rating = data.rating
        descriptionLabel.text = data.productDescription
        categoryLabel.text = "category: \(data.category)"
        brandLabel.text = "Brand: \(data.brand)"
        setupUI()
        setTitleContraints()
        setDiscountContraints()
        setPriceContraints()
        setRatingContraints()
        setCategoryContraints()
        setBrandContraints()
        setDescriprionContraints()
    }
    
    
     func setupUI() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
         
         view.addSubview(collection)
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0 ).isActive = true
        collection.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collection.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collection.dataSource = self
        collection.delegate = self
    }
    
    
    func setTitleContraints() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: collection.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
    }
    
    func setDiscountContraints() {
        view.addSubview(discountLabel)
        discountLabel.translatesAutoresizingMaskIntoConstraints = false
        discountLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        discountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        discountLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true

    }
    
    func setPriceContraints() {
        view.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: discountLabel.trailingAnchor, constant: 20).isActive = true
        
        priceLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true

    }
    func setRatingContraints() {
        view.addSubview(ratingView)
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        ratingView.topAnchor.constraint(equalTo: discountLabel.bottomAnchor).isActive = true
        ratingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        ratingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        
        ratingView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    func setDescriprionContraints() {
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: brandLabel.bottomAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        
    }
    func setCategoryContraints() {
        view.addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.topAnchor.constraint(equalTo: ratingView.bottomAnchor).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        
        categoryLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    func setBrandContraints() {
        view.addSubview(brandLabel)
        brandLabel.translatesAutoresizingMaskIntoConstraints = false
        brandLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor).isActive = true
        brandLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        brandLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        brandLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        guard let url = URL(string: data.images[indexPath.row]) else {fatalError()}
        let imageView = UIImageView()
        imageView.sd_setImage(with: url)
        cell.addSubview(imageView)
        cell.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 8 ).isActive = true
        imageView.leadingAnchor.constraint(equalTo: cell.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: cell.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: 0).isActive = true
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.75, height: 400)
    }
    
    
  
}
