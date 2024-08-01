defmodule App.BrederTest do
  use App.DataCase

  alias App.Breder

  describe "roupas" do
    alias App.Breder.Clothing

    import App.BrederFixtures

    @invalid_attrs %{nome: nil, preco_compra: nil, preco_venda: nil, preco_vendido: nil, data_compra: nil, data_venda: nil, tamanho: nil, cor: nil}

    test "list_roupas/0 returns all roupas" do
      clothing = clothing_fixture()
      assert Breder.list_roupas() == [clothing]
    end

    test "get_clothing!/1 returns the clothing with given id" do
      clothing = clothing_fixture()
      assert Breder.get_clothing!(clothing.id) == clothing
    end

    test "create_clothing/1 with valid data creates a clothing" do
      valid_attrs = %{nome: "some nome", preco_compra: "120.5", preco_venda: "120.5", preco_vendido: "120.5", data_compra: ~N[2024-07-30 23:58:00], data_venda: ~N[2024-07-30 23:58:00], tamanho: "some tamanho", cor: "some cor"}

      assert {:ok, %Clothing{} = clothing} = Breder.create_clothing(valid_attrs)
      assert clothing.nome == "some nome"
      assert clothing.preco_compra == Decimal.new("120.5")
      assert clothing.preco_venda == Decimal.new("120.5")
      assert clothing.preco_vendido == Decimal.new("120.5")
      assert clothing.data_compra == ~N[2024-07-30 23:58:00]
      assert clothing.data_venda == ~N[2024-07-30 23:58:00]
      assert clothing.tamanho == "some tamanho"
      assert clothing.cor == "some cor"
    end

    test "create_clothing/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Breder.create_clothing(@invalid_attrs)
    end

    test "update_clothing/2 with valid data updates the clothing" do
      clothing = clothing_fixture()
      update_attrs = %{nome: "some updated nome", preco_compra: "456.7", preco_venda: "456.7", preco_vendido: "456.7", data_compra: ~N[2024-07-31 23:58:00], data_venda: ~N[2024-07-31 23:58:00], tamanho: "some updated tamanho", cor: "some updated cor"}

      assert {:ok, %Clothing{} = clothing} = Breder.update_clothing(clothing, update_attrs)
      assert clothing.nome == "some updated nome"
      assert clothing.preco_compra == Decimal.new("456.7")
      assert clothing.preco_venda == Decimal.new("456.7")
      assert clothing.preco_vendido == Decimal.new("456.7")
      assert clothing.data_compra == ~N[2024-07-31 23:58:00]
      assert clothing.data_venda == ~N[2024-07-31 23:58:00]
      assert clothing.tamanho == "some updated tamanho"
      assert clothing.cor == "some updated cor"
    end

    test "update_clothing/2 with invalid data returns error changeset" do
      clothing = clothing_fixture()
      assert {:error, %Ecto.Changeset{}} = Breder.update_clothing(clothing, @invalid_attrs)
      assert clothing == Breder.get_clothing!(clothing.id)
    end

    test "delete_clothing/1 deletes the clothing" do
      clothing = clothing_fixture()
      assert {:ok, %Clothing{}} = Breder.delete_clothing(clothing)
      assert_raise Ecto.NoResultsError, fn -> Breder.get_clothing!(clothing.id) end
    end

    test "change_clothing/1 returns a clothing changeset" do
      clothing = clothing_fixture()
      assert %Ecto.Changeset{} = Breder.change_clothing(clothing)
    end
  end
end
