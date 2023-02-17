//
//  ViewController.swift
//  KriptoUygulamasi
//
//  Created by ahmet kardesseven on 16.02.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    
    var colorArray = [UIColor]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        self.colorArray = [
            UIColor(red: 0.1, green: 0.2, blue: 0.3, alpha: 0.7),
            UIColor(red: 0.2, green: 0.5, blue: 0.4, alpha: 1),
            UIColor(red: 0.3, green: 0.6, blue: 0.5, alpha: 1),
            UIColor(red: 0.4, green: 0.7, blue: 0.6, alpha: 1),
            UIColor(red: 0.5, green: 0.8, blue: 0.7, alpha: 1),
            UIColor(red: 0.6, green: 0.9, blue: 0.8, alpha: 1),
        ]
        
        
        
        
        
        
        
        getData()
    }
        
        func getData(){
        let url = URL(string:"https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        WebService().downloadCurrencies(url: url) { (cryptos) in
            if let cryptos = cryptos {
                self.cryptoListViewModel = CryptoListViewModel(crytpoCurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! KriptoTableViewCell
        
        let crypoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        
        cell.priceText.text = crypoViewModel.price
        cell.currencyText.text = crypoViewModel.name
        cell.backgroundColor = self.colorArray[indexPath.row % 6]
        
        return cell
        
    }
    


}

