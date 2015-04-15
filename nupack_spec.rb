require_relative 'nupack'

# The top of your testing block
# More examples of tests can be found here: https://github.com/rspec/rspec-expectations
RSpec.describe Package, "#new" do

  it "initializes base_price" do
    expect(Package.new(9.99, "2 people", "food").base_price).to eql(9.99)
  end

  it "initializes people" do
    expect(Package.new(9.99, "2 people", "food").people).to eql(2)
  end

  it "initializes product_category" do
    expect(Package.new(9.99, "2 people", "food").product_category).to eql("food")
  end

  it "calculates flat_markup as 5% of base_price" do
    expect(Package.new(1, "2 people", "food").flat_markup).to eql(0.05)
    expect(Package.new(20.05, "2 people", "food").flat_markup).to eql(20.05*0.05)
  end

  it "calculates labour_markup as 1.2% of base_price plus flat_markup" do
    expect(Package.new(20.05, "2 people", "food").labour_markup).to eql(20.05*1.05*0.012*2)
    expect(Package.new(20.05, "1 person", "food").labour_markup).to eql(20.05*1.05*0.012)
    expect(Package.new(20.05, 3, "food").labour_markup).to eql(20.05*1.05*0.012*3)
  end

  it "calculates product_markup for food as 13% of base_price plus flat_markup" do
    expect(Package.new(20.05, "2 people", "food").product_markup).to eql(20.05*1.05*0.13)
  end

  it "calculates product_markup for drugs as 7.5% of base_price plus flat_markup" do
    expect(Package.new(20.05, "2 people", "drugs").product_markup).to eql(20.05*1.05*0.075)
  end

  it "calculates product_markup for electronics as 2% of base_price plus flat_markup" do
    expect(Package.new(20.05, "2 people", "electronics").product_markup).to eql(20.05*1.05*0.02)
  end

  it "calculates product_markup for everything else as 0% of base_price plus flat_markup" do
    expect(Package.new(20.05, "2 people", "everything else").product_markup).to eql(0.0)
  end

  it "calculates final_cost according to customer-provided examples" do
    expect(Package.new(1299.99, "3 people", "food").final_cost).to eql(1591.58)
    expect(Package.new(5432.00, "1 person", "drugs").final_cost).to eql(6199.81)
    expect(Package.new(12456.95, "4 people", "books").final_cost).to eql(13707.63)
  end
end

RSpec.describe ProductFactory, "#new_product" do

  it "initializes creates the correct product" do
    expect(ProductFactory.new_product("food").class).to eql(FoodProduct)
    expect(ProductFactory.new_product("drugs").class).to eql(PharmaProduct)
    expect(ProductFactory.new_product("electronics").class).to eql(ElectronicProduct)
    expect(ProductFactory.new_product("books").class).to eql(GeneralProduct)
  end
end
