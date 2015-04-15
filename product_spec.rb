require_relative "product"

RSpec.describe ProductFactory, "#new_product" do

  it "initializes creates the correct product" do
    expect(ProductFactory.new_product("food").class).to eql(FoodProduct)
    expect(ProductFactory.new_product("drugs").class).to eql(PharmaProduct)
    expect(ProductFactory.new_product("electronics").class).to eql(ElectronicProduct)
    expect(ProductFactory.new_product("books").class).to eql(GeneralProduct)
  end
end
