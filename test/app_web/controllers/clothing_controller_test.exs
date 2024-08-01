defmodule AppWeb.ClothingControllerTest do
  use AppWeb.ConnCase

  import App.BrederFixtures

  @create_attrs %{nome: "some nome", preco_compra: "120.5", preco_venda: "120.5", preco_vendido: "120.5", data_compra: ~N[2024-07-30 23:58:00], data_venda: ~N[2024-07-30 23:58:00], tamanho: "some tamanho", cor: "some cor"}
  @update_attrs %{nome: "some updated nome", preco_compra: "456.7", preco_venda: "456.7", preco_vendido: "456.7", data_compra: ~N[2024-07-31 23:58:00], data_venda: ~N[2024-07-31 23:58:00], tamanho: "some updated tamanho", cor: "some updated cor"}
  @invalid_attrs %{nome: nil, preco_compra: nil, preco_venda: nil, preco_vendido: nil, data_compra: nil, data_venda: nil, tamanho: nil, cor: nil}

  describe "index" do
    test "lists all roupas", %{conn: conn} do
      conn = get(conn, ~p"/roupas")
      assert html_response(conn, 200) =~ "Listing Roupas"
    end
  end

  describe "new clothing" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/roupas/new")
      assert html_response(conn, 200) =~ "New Clothing"
    end
  end

  describe "create clothing" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/roupas", clothing: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/roupas/#{id}"

      conn = get(conn, ~p"/roupas/#{id}")
      assert html_response(conn, 200) =~ "Clothing #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/roupas", clothing: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Clothing"
    end
  end

  describe "edit clothing" do
    setup [:create_clothing]

    test "renders form for editing chosen clothing", %{conn: conn, clothing: clothing} do
      conn = get(conn, ~p"/roupas/#{clothing}/edit")
      assert html_response(conn, 200) =~ "Edit Clothing"
    end
  end

  describe "update clothing" do
    setup [:create_clothing]

    test "redirects when data is valid", %{conn: conn, clothing: clothing} do
      conn = put(conn, ~p"/roupas/#{clothing}", clothing: @update_attrs)
      assert redirected_to(conn) == ~p"/roupas/#{clothing}"

      conn = get(conn, ~p"/roupas/#{clothing}")
      assert html_response(conn, 200) =~ "some updated nome"
    end

    test "renders errors when data is invalid", %{conn: conn, clothing: clothing} do
      conn = put(conn, ~p"/roupas/#{clothing}", clothing: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Clothing"
    end
  end

  describe "delete clothing" do
    setup [:create_clothing]

    test "deletes chosen clothing", %{conn: conn, clothing: clothing} do
      conn = delete(conn, ~p"/roupas/#{clothing}")
      assert redirected_to(conn) == ~p"/roupas"

      assert_error_sent 404, fn ->
        get(conn, ~p"/roupas/#{clothing}")
      end
    end
  end

  defp create_clothing(_) do
    clothing = clothing_fixture()
    %{clothing: clothing}
  end
end
