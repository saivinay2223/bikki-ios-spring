//
//  ViewController.swift
//  table view demo
//
//  Created by sai vinay kumar bikki on 4/8/25.
//

import UIKit

class Product{
    var productName:String
    var productDescription:String
    
    init(prodName: String, ProdDesc: String){
        self.productName = prodName
        self.productDescription = ProdDesc
    }
    
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the productarray count
        return productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewOL.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        cell.textLabel?.text = productArray[indexPath.row].productName
        return cell
    }
    
    var productArray = [Product]()
    

    @IBOutlet weak var TableViewOL: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TableViewOL.dataSource = self
        TableViewOL.delegate = self
        
        
        
        let product1 = Product(prodName: "iPhone 13", ProdDesc: "This is iPhone 13")
        productArray.append(product1)
        let product2 = Product(prodName: "MacBook Pro", ProdDesc: "This is MacBook Pro")
        productArray.append(product2)
        let product3 = Product(prodName: "AirPods Pro", ProdDesc: "This is AirPods Pro")
        productArray.append(product3)
        let product4 = Product(prodName: "Apple Watch Series 7", ProdDesc: "This is Apple Watch Series 7")
        productArray.append(product4)
        let product5 = Product(prodName: "iMac 24-inch", ProdDesc: "This is iMac 24-inch")
        productArray.append(product5)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        _ = segue.identifier ?? ""
        if segue.identifier == "Resultsegue" {
            if let indexPath = TableViewOL.indexPathForSelectedRow {
                let destinationVC = segue.destination as! ResultViewController
                destinationVC.product = productArray[indexPath.row]
            }
        }
    }


}

