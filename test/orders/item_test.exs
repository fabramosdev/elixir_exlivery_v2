defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory

  describe "build/4" do
    test "when all params are valid, returns an item" do
      response = Item.build("Pizza Calabresa", :pizza, "64.90", 1)

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "when there is an invalid category, returns an error" do
      response = Item.build("Pizza Calabresa", :banana, "64.90", 1)

      expected_response = {:error, "Ivalid parameters"}

      assert response == expected_response
    end

    test "when there is an invalid price, returns an error" do
      response = Item.build("Pizza Calabresa", :pizza, "banana", 1)

      expected_response = {:error, "Ivalid price"}

      assert response == expected_response
    end

    test "when there is an invalid quantity, returns an error" do
      response = Item.build("Pizza Calabresa", :pizza, "64.90", 0)

      expected_response = {:error, "Ivalid parameters"}

      assert response == expected_response
    end
  end
end
