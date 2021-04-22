defmodule Inmana.Supplies.ExpirationEmail do
  import Bamboo.Email

  alias Inmana.Supply

  def create(to_email, supplies) do
    new_email(
      to: to_email,
      from: "app@inamana.com.br",
      subject: "Supplices that are about to expire",
      html_body: "<p>Teste de HTML</p>",
      text_body: email_text(supplies)
    )
  end

  # Enum.reduce([1, 2, 3, 4, 5], 0, fn elem, acc -> acc + elem end)
  # <> concatenar
  defp email_text(supplies) do
    initial_text = "-------- Supplice that are about expire -------- \n"
    Enum.reduce(supplies, initial_text, fn supply, text -> text <> supply_string(supply) end)
  end

  # Private functions cannot be used on the terminal iex.bat -S mix
  defp supply_string(%Supply{
         description: description,
         expiration_date: expiration_date,
         responsible: responsible
       }) do
    "Description: #{description}, Expiration Date: #{expiration_date}, Responsible: #{responsible}\n"
  end
end
