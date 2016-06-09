module StoreHelper
  def valor_em_reais(product)
    return number_to_currency(product.price, :unit => "R$", :separator => ",", :delimiter => "")
  end

end
