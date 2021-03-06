defmodule Inmana.Supplies.ExpirationNotification do
  alias Inmana.Mailer
  alias Inmana.Supplies.{ExpirationEmail, GetByExpiration}

  def send do
    data = GetByExpiration.call()

    # Processos paralelos
    # Doc: https://hexdocs.pm/elixir/Task.html
    data
    |> Task.async_stream(fn {to_email, supplies} -> send_email(to_email, supplies) end)
    |> Stream.run()
  end

  '''
  # Processos em fila
  def send do
    data = GetByExpiration.call()

    Enum.each(data, fn {to_email, supplies} ->
      to_email
      |> ExpirationEmail.create(supplies)
      |> Mailer.deliver_later!()
    end)
  end
  '''

  defp send_email(to_email, supplies) do
    to_email
    |> ExpirationEmail.create(supplies)
    |> Mailer.deliver_later!()
  end
end
