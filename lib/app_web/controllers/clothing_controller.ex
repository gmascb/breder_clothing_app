defmodule AppWeb.ClothingController do
  use AppWeb, :controller

  alias App.Breder
  alias App.Breder.Clothing

  def index(conn, _params) do
    roupas = Breder.list_roupas()
    render(conn, :index, roupas: roupas)
  end

  def new(conn, _params) do
    changeset = Breder.change_clothing(%Clothing{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"clothing" => clothing_params}) do
    case Breder.create_clothing(clothing_params) do
      {:ok, clothing} ->
        conn
        |> put_flash(:info, "Clothing created successfully.")
        |> redirect(to: ~p"/roupas/#{clothing}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    clothing = Breder.get_clothing!(id)
    render(conn, :show, clothing: clothing)
  end

  def edit(conn, %{"id" => id}) do
    clothing = Breder.get_clothing!(id)
    changeset = Breder.change_clothing(clothing)
    render(conn, :edit, clothing: clothing, changeset: changeset)
  end

  def update(conn, %{"id" => id, "clothing" => clothing_params}) do
    clothing = Breder.get_clothing!(id)

    case Breder.update_clothing(clothing, clothing_params) do
      {:ok, clothing} ->
        conn
        |> put_flash(:info, "Clothing updated successfully.")
        |> redirect(to: ~p"/roupas/#{clothing}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, clothing: clothing, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    clothing = Breder.get_clothing!(id)
    {:ok, _clothing} = Breder.delete_clothing(clothing)

    conn
    |> put_flash(:info, "Clothing deleted successfully.")
    |> redirect(to: ~p"/roupas")
  end
end
