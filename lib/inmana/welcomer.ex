# Receer um nome e uma idade do usu´rio
# Se o usuário chamar "banana" e tiver idade "42", ele recebe uma mensagem
# Se o usuário for maior de idade, ele recebe uma menssagem normal
# Se o usuário for menoer de idade, retornamos um erro
# Temos que tratar o nome do usuário para entradas erradas, como "BaNaNa", "BaNaNa \n"

# Array associativo
# map = %{a: 1, b: 2}
# map = %{"a" => 1, "b" => 2}

# Modulo Map (lib)
# Map.get(vetor, chave, defaut)

# Inmana.Welcomer.welcome(%{"name" => "Rafael", "age" => "42"})
# alias Inmana.Welcomer
# Welcomer.welcome(%{"name" => "banana", "age" => "42"})

# Modulo/aridade
# h Modulo.funcao (Documento da função)
# h String.upcase
# String.upcase("igor")

# Paiper operator |>

defmodule Inmana.Welcomer do
  def welcome(%{"name" => name, "age" => age}) do #(params)
    '''
    name = params["name"]
    age = params["age"]

    name = String.trim(name)
    name = String.downcase(name)
    '''

    age = String.to_integer(age)
    #age = params["age"] |> String.to_integer()
    # age = params["age"]
    
    #IO.inspect(age) #imprimir no termina
    
    # Paiper operator
    #params["name"]
    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)  # name é o primeiro argumento
  end

  # Pattern Match
  # Valor pardrão fica sempre do lado esquerde

  defp evaluate("banana", 42) do
    {:ok, "You are very special banna"} #tupla
  end

  # when => guard do Match
  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcom #{name}"}
  end

  defp evaluate(name, _age) do
    {:error, "You shall not pass #{name}"}
  end
end
