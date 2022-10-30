defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response = User.build("Rua B, 44", "Fabiano", "fabiano@email.com", "12345678900", 44)

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end
  end

  test "when one param are invalid, returns an error" do
    response = User.build("Rua A", "Fabiano", "fabiano.suporteinfo@gmail.com", "07476158709", 15)

    expected_response = {:error, "Invalid parameters"}

    assert response == expected_response
  end
end
