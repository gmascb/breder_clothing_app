defmodule App.BrederFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App.Breder` context.
  """

  @doc """
  Generate a clothing.
  """
  def clothing_fixture(attrs \\ %{}) do
    {:ok, clothing} =
      attrs
      |> Enum.into(%{
        cor: "some cor",
        data_compra: ~N[2024-07-30 23:58:00],
        data_venda: ~N[2024-07-30 23:58:00],
        nome: "some nome",
        preco_compra: "120.5",
        preco_venda: "120.5",
        preco_vendido: "120.5",
        tamanho: "some tamanho"
      })
      |> App.Breder.create_clothing()

    clothing
  end
end
