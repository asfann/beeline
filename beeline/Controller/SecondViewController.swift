//
//  SecondViewController.swift
//  beeline
//
//  Created by Asf on 09.11.2022.
//

import UIKit

class SecondViewController: UIViewController {
    private let data: Product
    
    
    var productLabel = UILabel()

    private let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    
    init(data: Product) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = data.brand
        view.backgroundColor = .white
        
        var lineView = UIView(frame: CGRect(x: 0, y: 100, width: 490, height: 1.0))
        lineView.layer.borderWidth = 1.0
        lineView.center = CGPoint(x: 160, y: 230)
        lineView.layer.borderColor = UIColor.lightGray.cgColor
        self.view.addSubview(lineView)
        
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 21))
        title.center = CGPoint(x: 160, y: 285)
        title.textAlignment = .left
        title.text = data.title
        view.addSubview(title)
        
        
        let rating = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 21))
        rating.center = CGPoint(x: 160, y: 320)
        rating.textAlignment = .left
        rating.text = "\(data.rating) ⭐️"
        view.addSubview(rating)
        
        
        let price = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 21))
        price.center = CGPoint(x: 160, y: 380)
        price.textAlignment = .left
        price.text = "\(data.price) $"
        view.addSubview(price)
        
        var lineView1 = UIView(frame: CGRect(x: 0, y: 100, width: 490, height: 1.0))
        lineView1.layer.borderWidth = 1.0
        lineView1.center = CGPoint(x: 160, y: 350)
        lineView1.layer.borderColor = UIColor.lightGray.cgColor
        self.view.addSubview(lineView1)
        
//        let category = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 21))
//        category.center = CGPoint(x: 160, y: 250)
//        category.textAlignment = .left
//        category.text = data.category
//        view.addSubview(category)
//
        
        let discount = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 21))
        discount.center = CGPoint(x: 240, y: 370)
        discount.textAlignment = .right
        discount.text = "discount \(data.discountPercentage) %"
        view.addSubview(discount)
        
        
        let stock = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 21))
        stock.center = CGPoint(x: 270, y: 390)
        stock.textAlignment = .center
        stock.text = "stock: \(data.stock)"
        view.addSubview(stock)
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
  
}
