class ProductFactory
  def self.new_product(type)
    case type.to_s
    when "food"
      FoodProduct.new
    when "drugs"
      PharmaProduct.new 
    when "electronics"
      ElectronicProduct.new
    else
      GeneralProduct.new
    end
  end
end

class PharmaProduct
  def markup_rate
    7.5/100
  end
end

class FoodProduct
  def markup_rate
    13.0/100
  end
end

class ElectronicProduct
  def markup_rate
    2.0/100
  end
end

class GeneralProduct
  def markup_rate
    0.0/100
  end
end
