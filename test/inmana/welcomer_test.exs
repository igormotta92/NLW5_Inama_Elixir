# Mesmo nome com o sufixo "Test" no final

# Teste de lógica de negócios
defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  # Nome função mais número de argumentos(aridade)
  describe "welcome/1" do
    test "when the user is special, returns a special message" do
      params = %{"name" => "banana", "age" => "42"}
      expected_result = {:ok, "You are very special banna"}

      result = Welcomer.welcome(params)

      # assert result == "banana"
      assert result == expected_result
    end

    test "when the user is not special, returns a message" do
      params = %{"name" => "rafael", "age" => "25"}
      expected_result = {:ok, "Welcom rafael"}

      result = Welcomer.welcome(params)

      # assert result == "banana"
      assert result == expected_result
    end

    test "when the user is under age, returns an error" do
      params = %{"name" => "rafael", "age" => "17"}
      expected_result = {:error, "You shall not pass rafael"}

      result = Welcomer.welcome(params)

      # assert result == "banana"
      assert result == expected_result
    end
  end
end

'''
Resultado Teste

Generated inmana app
..
  1) test welcome/1 when the user is special, returns a special message (Inmana.WelcomerTest)
     test/inmana/welcomer_test.exs:9
     Assertion with == failed
     code:  assert result == "banana"
     left:  {:ok, "You are very special banna"}
     right: "banana"
     stacktrace:
       test/inmana/welcomer_test.exs:14: (test)

Finished in 0.04 seconds
3 tests, 1 failure

Randomized with seed 46000
'''
