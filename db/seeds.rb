require "csv"

root_categories_csv = CSV.readlines("db/root_categories.csv")
root_categories_csv.shift
root_categories_csv.each do |row|
  RootCategory.create(name: row[1], created_at: row[2], updated_at: row[3])
end

categories_csv = CSV.readlines("db/categories.csv")
categories_csv.shift
categories_csv.each do |row|
  Category.create(name: row[1], root_category_id: row[2], created_at: row[3], updated_at: row[4])
end

sub_categories_csv = CSV.readlines("db/sub_categories.csv")
sub_categories_csv.shift
sub_categories_csv.each do |row|
  SubCategory.create(name: row[1], category_id: row[2], created_at: row[3], updated_at: row[4])
end
