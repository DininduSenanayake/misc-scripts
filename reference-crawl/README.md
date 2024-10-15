**This script is just a starting point for ref scraping across Ensembl, NCBI and UCSC** (some websites may have terms of service that restrict scraping, so it's a good idea to check their policies and consider using official APIs if available).

1. defines functions to check each database (Ensembl, NCBI, and UCSC) for the most recent genome version of a given species.
2. Each function uses web scraping techniques to extract version information from the respective websites.
3. The main function prompts the user for a species name and then checks all three databases, printing the results.

To use this script:
* Install the required libraries: `pip install requests beautifulsoup4`


Please note that web scraping can be fragile if websites change their structure. Also, 