defmodule AppWeb.ClothingHTML do
  use AppWeb, :html

  embed_templates "clothing_html/*"

  @doc """
  Renders a clothing form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def clothing_form(assigns)
end
