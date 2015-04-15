require_relative "product"

class Package
  attr_accessor :base_price, :people, :product_category

  def initialize(base_price, people, product_category)
    @base_price = base_price.to_f
    @people = people.to_i
    @product_category = product_category
  end

  def flat_markup
    @base_price * flat_markup_rate
  end

  def labour_markup
    base_plus_flat_markup * @people * labour_markup_rate
  end

  def product_markup
    base_plus_flat_markup * product_markup_rate(@product_category)
  end

  def final_cost
    (base_plus_flat_markup + labour_markup + product_markup).round(2)
  end

private

  def base_plus_flat_markup
    @base_price + flat_markup
  end

  def product_markup_rate(category)
    ProductFactory.new_product(category).markup_rate
  end

  def flat_markup_rate
    5.0/100
  end

  def labour_markup_rate
    1.2/100
  end
end
