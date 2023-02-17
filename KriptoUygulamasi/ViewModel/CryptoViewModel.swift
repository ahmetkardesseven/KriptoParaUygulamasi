//
//  CryptoViewModel.swift
//  KriptoUygulamasi
//
//  Created by ahmet kardesseven on 17.02.2023.
//

import Foundation

struct CryptoListViewModel {
    let crytpoCurrencyList : [CryptoCurrency]
    
    func numberOfRowsInSection() -> Int {
        return self.crytpoCurrencyList.count
    }
    func cryptoAtIndex(_ index: Int) -> CrytoViewModel {
        let crypto = self.crytpoCurrencyList[index]
        return CrytoViewModel(cryptoCurrency: crypto)
    }
    
}

struct CrytoViewModel {
    let cryptoCurrency : CryptoCurrency
    
    var name : String {
        return self.cryptoCurrency.currency
    }
    var price : String {
        return self.cryptoCurrency.price
    }
    
    
}
