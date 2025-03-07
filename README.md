# RubyTest
ruby assessment from invisible technologies

# The CSV file, products.csv, has the following columns:



product_id

name

category

price

stock

supplier_email



The data has several issues:



Duplicate Product IDs: Some rows have the same product_id. Only keep the first occurrence of each product ID.

Price Formatting: The price column contains prices with inconsistent formatting, such as extra spaces, currency symbols, or missing decimal places. Normalize the prices to a consistent format.

Stock Values: The stock column should contain integers, but some rows have non-integer values or empty fields. Set non-integer values to 0 and fill empty fields with 0.

Supplier Emails: Ensure that all email addresses in the supplier_email column are in lowercase.



Process the data and save it in a new csv file.
