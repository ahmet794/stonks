//
//  StocksViewController.swift
//  Stonker
//
//  Created by Ahmet Cihan on 07/08/2023.
//

import Foundation
import UIKit

class StockTableViewCell: UITableViewCell {
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
}

class StocksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var stocks: [String] = ["AAPL", "GOOGL", "MSFT", "AMZN"] // Add your own list of stock symbols here
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchStockPrices()
    }
    
    func fetchStockPrices() {
        // Call Python function to fetch stock prices using yfinance (Python integration required)
        // Update the 'stocks' array with the fetched stock prices
        // For example, stocks = pythonFunctionToFetchStockPrices()
        // Make sure to handle any errors and update the UI accordingly
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockTableViewCell", for: indexPath) as! StockTableViewCell
        let symbol = stocks[indexPath.row]
        cell.symbolLabel.text = symbol
        // Set the price value from the 'stocks' array
        // For example, cell.priceLabel.text = stocks[indexPath.row].price
        return cell
    }
}




