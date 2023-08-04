import requests
import pandas as pd
from bs4 import BeautifulSoup

def get_m_caps(name):
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
        "Market Cap": market_caps
    }

    df = pd.DataFrame(data)

    return df



