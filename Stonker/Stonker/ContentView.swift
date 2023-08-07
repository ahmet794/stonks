//
//  ContentView.swift
//  Stonker
//
//  Created by Ahmet Cihan on 07/08/2023.
//

import SwiftUI

struct StockRowView: View {
    let symbol: String
    let price: String // Change the type to match the actual type of the stock price

    var body: some View {
        HStack {
            Text(symbol)
            Spacer()
            Text(price)
        }
    }
}

struct ContentView: View {
    @State private var stocks: [String] = ["AAPL", "GOOGL", "MSFT", "AMZN"] // Add your own list of stock symbols here

    var body: some View {
        VStack {
            List(stocks, id: \.self) { symbol in
                StockRowView(symbol: symbol, price: "Loading...") // Replace "Loading..." with the actual stock price from the fetched data
            }
        }
        .onAppear {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
