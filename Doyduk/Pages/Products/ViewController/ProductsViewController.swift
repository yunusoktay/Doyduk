//
//  ProductsViewController.swift
//  Doyduk
//
//  Created by yunus oktay on 19.03.2022.
//

import UIKit

class ProductsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var categoryName: String = ""
    
    var products: [Product] = [] {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    deinit {
        print(#function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        self.title = categoryName
        
        configureTableView()
        getProducts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    
    func getProducts() {
        
        let service = Service()
        
        service.getProducts() { productsResponse in
            self.products = productsResponse.result
        }
    }
    
    func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ProductTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        let product = products[indexPath.row]
        cell.configure(with: product)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let productDetails = ProductDetailsViewController(productId: products[indexPath.row].id)
        self.navigationController?.pushViewController(productDetails, animated: true)
    }
}
