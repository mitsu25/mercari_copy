require "csv"

root_categories_csv = CSV.readlines("db/root_categories.csv")
root_categories_csv.shift
root_categories_csv.each do |row|
  RootCategory.create(name: row[1], created_at: row[2], updated_at: row[3])
end
