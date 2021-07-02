defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  alias Wabanex.IMC

  describe "calculate/1" do
    test "when the file exists, returns the data" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)

      expected_response =
        {:ok,
         %{
           "User 1" => 24.897060231734173,
           "User 2" => 23.437499999999996,
           "User 3" => 22.857142857142858,
           "User 4" => 23.04002019946976
         }}

      assert response == expected_response
    end

    test "when the wrong filename is given, returns an error" do
      params = %{"filename" => "test.csv"}

      response = IMC.calculate(params)

      expected_response = {:error, "Error while opening the file"}

      assert response == expected_response
    end
  end
end
