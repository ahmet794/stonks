import requests
import pandas as pd
import matplotlib.pyplot as plt
from bs4 import BeautifulSoup

def get_m_caps(name, ticker):

    # Send a GET request to the URL
    url = f"https://companiesmarketcap.com/{name}/marketcap/"
    response = requests.get(url)

    # Parse the HTML content using BeautifulSoup
    soup = BeautifulSoup(response.content, "html.parser")

    # Find the table containing the market cap data
    table = soup.find("table", {"class": "table"})

    # Initialize empty lists to store the data
    years = []
    market_caps = []

    # Loop through each row in the table
    for row in table.find_all("tr")[1:]:  # Skip the header row (index 0)
        # Extract the year and market cap from the row
        year = row.find("td").text.strip()
        market_cap = row.find_all("td")[1].text.strip()

        
        # Append the data to the lists
        years.append(year)
        market_caps.append(market_cap)

    data = {
    "Year": years,
    f"{ticker}": market_caps
    }

    df = pd.DataFrame(data)

    return df


def m_cap_db(name, ticker):
    csv = pd.read_csv('market_caps.csv')

    if f"{ticker}" not in csv.columns:
        df = get_m_caps(name, ticker)
        new_data = df[f"{ticker}"]
        csv[ticker] = new_data
        csv.to_csv('market_caps.csv', index=False)
        return csv
    else:
        return "This ticker is already in db"

def update_chart(stock_data):
    # Fetch real-time data using yfinance
    real_time_data = stock_data.history(period="1d")

    # Clear the previous chart and plot the new data
    plt.clf()
    plt.plot(real_time_data["Close"])
    plt.title("Real-Time Stock Price")
    plt.xlabel("Time")
    plt.ylabel("Price")
    plt.grid()
    plt.pause(10)