//
//  ExtensionPin.swift
//  beeline
//
//  Created by Asf on 09.11.2022.
//

import UIKit

extension UIView{
    func pin(to superVIew: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superVIew.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superVIew.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superVIew.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superVIew.bottomAnchor).isActive = true
    }
}
