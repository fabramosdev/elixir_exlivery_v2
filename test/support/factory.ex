defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.{Item, Order}

  def user_factory do
    %User{
      name: "Fabiano",
      email: "fabiano@email.com",
      cpf: "12345678900",
      age: 44,
      address: "Rua B, 44"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza Calabresa",
      category: :pizza,
      quantity: 1,
      unity_price: Decimal.new("64.90")
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua B, 44",
      user_cpf: "12345678900",
      items: [
        build(:item),
        build(:item,
          description: "Açaí",
          category: :sobremesa,
          quantity: 2,
          unity_price: Decimal.new("9.9")
        )
      ],
      total_price: Decimal.new("84.70")
    }
  end
end
