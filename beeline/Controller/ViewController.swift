//
//  ViewController.swift
//  beeline
//
//  Created by Asf on 08.11.2022.
//

import UIKit

class ViewController: UIViewController{
    var tableview = UITableView()
    var product: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Beeline Shop"
        configureTableView()
        getProduct()
        view.frame = view.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        
    }
    
    func configureTableView() {
        view.addSubview(tableview)
        
        setTableViewDelegates()
        tableview.rowHeight = 100
        tableview.layer.borderWidth = 1
        tableview.layer.cornerRadius = 4
        tableview.separatorStyle = .none
        tableview.pin(to: view)
        tableview.register(ProductsViewCell.self, forCellReuseIdentifier: "productCell")
    }

    func setTableViewDelegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    private func getProduct() {
        APICaller.share.getProducts { [weak self] result in
            switch result {
            case .success(let product):
                self?.product = product
                DispatchQueue.main.async {
                    self?.tableview.reloadData()
                }
            case .failure(let error):
                    print(error)
            }
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "productCell") as! ProductsViewCell
        let products = product[indexPath.row]
        cell.set(product: products)
        cell.layer.masksToBounds = true
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let data = product[indexPath.row]
        let detail = SecondViewController(data: data)
        navigationController?.pushViewController(detail, animated: true)
    }
    
}


