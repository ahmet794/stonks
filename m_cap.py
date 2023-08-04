import requests
from bs4 import BeautifulSoup

# Send a GET request to the URL
url = "https://companiesmarketcap.com/apple/marketcap/"
response = requests.get(url)

# Parse the HTML content using BeautifulSoup
soup = BeautifulSoup(response.content, "html.parser")

# Find the table containing the market cap data
table = soup.find("table", {"class": "table"})

# Initialize empty lists to store the data
companies = []
market_caps = []

# Loop through each row in the table
for row in table.find_all("tr")[1:]:  # Skip the header row (index 0)
    # Extract the company name and market cap from the row
    company = row.find("td").text.strip()
    market_cap = row.find_all("td")[1].text.strip()

    # Append the data to the lists
    companies.append(company)
    market_caps.append(market_cap)

# Print the data
for company, market_cap in zip(companies, market_caps):
    print(f"Year: {company}, Market Cap: {market_cap}")


