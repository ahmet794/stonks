//
//  StockMarketView.swift
//  Stonker
//
//  Created by Ahmet Cihan on 07/08/2023.
//

import SwiftUI

struct StockMarketView: View {
    @State private var stocks: [String] = ["AAPL", "GOOGL", "MSFT", "AMZN"] // Add more tickers
    
    var body: some View {
        VStack{
            List(stocks, id: \.self){ symbol in
                StockRowView(symbol: symbol, price: "Soon...") // Replace loading in future with prices
            }
        }
        .onAppear() {
            fetchStockPrices()
        }
    }
    
    func fetchStockPrices() {
            // Call Python function to fetch stock prices using yfinance (Python integration required)
            // Update the 'stocks' array with the fetched stock prices
            // For example, stocks = pythonFunctionToFetchStockPrices()
            // Make sure to handle any errors and update the UI accordingly
    }
}

struct StockMarketView_Previews: PreviewProvider {
    static var previews: some View {
        StockMarketView()
    }
}
