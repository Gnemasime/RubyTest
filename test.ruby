require 'csv'

# Read the CSV file
input_file = 'products.csv'
output_file = 'cleaned_products.csv'

# Initialize an array to store the cleaned rows
cleaned_data = []
product_ids = Set.new

# Process the CSV file row by row
CSV.foreach(input_file, headers: true) do |row|
  product_id = row['product_id']

  # Skip if product_id is a duplicate
  next if product_ids.include?(product_id)
  product_ids.add(product_id)

  # Clean the price field: Remove currency symbols, spaces, and ensure two decimal places
  price = row['price'].to_s.strip
  price.gsub!(/[^\d.]/, '') # Remove non-numeric characters except decimal
  price = sprintf('%.2f', price.to_f) # Ensure two decimal places

  # Clean the stock field: Ensure it's an integer or 0 if invalid
  stock = row['stock'].to_s.strip
  stock = stock.match(/\A\d+\z/) ? stock.to_i : 0

  # Clean the supplier email field: Ensure it's in lowercase
  supplier_email = row['supplier_email'].to_s.strip.downcase

  # Prepare the cleaned row
  cleaned_row = {
    'product_id' => product_id,
    'name' => row['name'].to_s.strip,
    'category' => row['category'].to_s.strip,
    'price' => price,
    'stock' => stock,
    'supplier_email' => supplier_email
  }

  # Add the cleaned row to the cleaned_data array
  cleaned_data << cleaned_row
end

# Write the cleaned data to a new CSV file
CSV.open(output_file, 'wb') do |csv|
  # Write the headers
  csv << ['product_id', 'name', 'category', 'price', 'stock', 'supplier_email']
  
  # Write the cleaned rows
  cleaned_data.each do |row|
    csv << row.values
  end
end

puts "Data processing complete. Cleaned data saved to #{output_file}."
