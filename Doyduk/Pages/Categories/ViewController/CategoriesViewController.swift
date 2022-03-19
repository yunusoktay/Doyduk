//
//  CategoriesViewController.swift
//  Doyduk
//
//  Created by yunus oktay on 18.03.2022.
//

import UIKit


class CategoriesViewController: UIViewController {
    
    
    @IBOutlet weak var favoriteCategoryLabel: UILabel!
    @IBOutlet weak var favoriteCategoryImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var favoriteProductTitleLabel: UILabel!
    
    var categories: [Category] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getCategories()
    }
    
    func configureUI() {
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        
        let nib = UINib(nibName: "CategoryTableViewCell", bundle: Bundle(for: CategoryTableViewCell.self))
        tableView.register(nib, forCellReuseIdentifier: "CategoryTableViewCell")
    }
    
    func getCategories() {
        
        let service = Service()
        
        service.getCategories { categoriesResponse in
            self.categories = categoriesResponse.result
            self.setFavoriteItems()
        }
        
    }
    
    func setFavoriteItems() {
        
        DispatchQueue.main.async {
            
            let favoriteProduct: FavoriteProduct
            
            if let data = UserDefaults.standard.data(forKey: "favoriteProduct") {
                
                let username = UserDefaults.standard.string(forKey: "name")!
                self.favoriteProductTitleLabel.text = "\(username) kullanıcısının favori ürünü"
                let decoder = JSONDecoder()
                favoriteProduct = try! decoder.decode(FavoriteProduct.self, from: data)
            }
            else {
                self.favoriteProductTitleLabel.text = "Bugünün favori kategorisi"
                let randomIndex = Int.random(in: 0 ..< self.categories.count)
                favoriteProduct = FavoriteProduct(name: self.categories[randomIndex].name, imageUrl: self.categories[randomIndex].imageUrl)
            }
            
            self.favoriteCategoryLabel.text = favoriteProduct.name
            self.favoriteCategoryImageView.kf.setImage(with: favoriteProduct.imageUrl)
        }
        
    }
    
}

extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        
        let category = self.categories[indexPath.row]
        cell.configure(with: category)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    
}
