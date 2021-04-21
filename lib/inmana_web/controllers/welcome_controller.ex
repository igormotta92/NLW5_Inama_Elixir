defmodule InmanaWeb.WelcomeController do
  use InmanaWeb, :controller #Defini que é um controller
  
  alias Inmana.Welcomer
  
  def index(conn, params) do #argumentos padrões (conn, params)
    params
    |> Welcomer.welcome()
    |> handle_response(conn)
  end
  
  # Pattern Match
  '''
  defp handle_response({:ok, message}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{message: message})
  end
  
  defp handle_response({:error, message}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(%{message: message})
  end
  '''
  
  #Função em uma linha só
  defp handle_response({:ok, message}, conn), do: handle_response(conn, message, :ok)
  defp handle_response({:error, message}, conn), do: handle_response(conn, message, :bad_request)
  
  defp handle_response(conn, message, status) do
    conn
    |> put_status(status)
    |> json(%{message: message})
  end
  
end
