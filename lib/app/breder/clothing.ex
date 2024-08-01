defmodule App.Breder.Clothing do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roupas" do
    field :nome, :string
    field :preco_compra, :decimal
    field :preco_venda, :decimal
    field :preco_vendido, :decimal
    field :data_compra, :naive_datetime
    field :data_venda, :naive_datetime
    field :tamanho, :string
    field :cor, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(clothing, attrs) do
    clothing
    |> cast(attrs, [:nome, :preco_compra, :preco_venda, :preco_vendido, :data_compra, :data_venda, :tamanho, :cor])
    |> validate_required([:nome, :preco_compra, :preco_venda, :preco_vendido, :data_compra, :data_venda, :tamanho, :cor])
  end
end
