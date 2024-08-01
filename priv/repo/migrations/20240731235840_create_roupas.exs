defmodule App.Repo.Migrations.CreateRoupas do
  use Ecto.Migration

  def change do
    create table(:roupas) do
      add :nome, :string
      add :preco_compra, :decimal
      add :preco_venda, :decimal
      add :preco_vendido, :decimal
      add :data_compra, :naive_datetime
      add :data_venda, :naive_datetime
      add :tamanho, :string
      add :cor, :string

      timestamps(type: :utc_datetime)
    end
  end
end
