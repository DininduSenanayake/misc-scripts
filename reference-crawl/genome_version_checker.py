import requests
from bs4 import BeautifulSoup
import re

def check_ensembl(species):
    url = f"https://www.ensembl.org/species/{species.replace(' ', '_')}"
    response = requests.get(url)
    if response.status_code == 200:
        soup = BeautifulSoup(response.text, 'html.parser')
        version_info = soup.find('p', class_='assembly-version')
        if version_info:
            return version_info.text.strip()
    return "Not found"

def check_ncbi(species):
    url = f"https://www.ncbi.nlm.nih.gov/genome/?term={species.replace(' ', '+')}"
    response = requests.get(url)
    if response.status_code == 200:
        soup = BeautifulSoup(response.text, 'html.parser')
        version_info = soup.find('span', class_='assembly-name')
        if version_info:
            return version_info.text.strip()
    return "Not found"

def check_ucsc(species):
    url = "https://genome.ucsc.edu/cgi-bin/hgGateway"
    response = requests.get(url)
    if response.status_code == 200:
        soup = BeautifulSoup(response.text, 'html.parser')
        options = soup.find_all('option')
        for option in options:
            if species.lower() in option.text.lower():
                match = re.search(r'\((.*?)\)', option.text)
                if match:
                    return match.group(1)
    return "Not found"

def main():
    species = input("Enter the species name (e.g., Saccharomyces cerevisiae): ")
    
    print(f"\nChecking for the latest version of {species} genome:")
    print(f"Ensembl: {check_ensembl(species)}")
    print(f"NCBI: {check_ncbi(species)}")
    print(f"UCSC: {check_ucsc(species)}")

if __name__ == "__main__":
    main()