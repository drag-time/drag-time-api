defmodule DragTimeApi.Accesses do
  @moduledoc """
  The Accesses context.
  """

  import Ecto.Query, warn: false
  alias DragTimeApi.Repo

  alias DragTimeApi.Accesses.Access

  @doc """
  Returns the list of access.

  ## Examples

      iex> list_access()
      [%Access{}, ...]

  """
  def list_access do
    Repo.all(Access)
  end

  @doc """
  Gets a single access.

  Raises `Ecto.NoResultsError` if the Access does not exist.

  ## Examples

      iex> get_access!(123)
      %Access{}

      iex> get_access!(456)
      ** (Ecto.NoResultsError)

  """
  def get_access!(id), do: Repo.get!(Access, id)

  @doc """
  Creates a access.

  ## Examples

      iex> create_access(%{field: value})
      {:ok, %Access{}}

      iex> create_access(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_access(attrs \\ %{}) do
    %Access{}
    |> Access.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a access.

  ## Examples

      iex> update_access(access, %{field: new_value})
      {:ok, %Access{}}

      iex> update_access(access, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_access(%Access{} = access, attrs) do
    access
    |> Access.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a access.

  ## Examples

      iex> delete_access(access)
      {:ok, %Access{}}

      iex> delete_access(access)
      {:error, %Ecto.Changeset{}}

  """
  def delete_access(%Access{} = access) do
    Repo.delete(access)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking access changes.

  ## Examples

      iex> change_access(access)
      %Ecto.Changeset{data: %Access{}}

  """
  def change_access(%Access{} = access, attrs \\ %{}) do
    Access.changeset(access, attrs)
  end

# #Comeonin
#   def access_code_changeset(model, params) do
#     model
#     |> changeset(params)
#     |> cast(params, ~w(access_code), [])
#     |> put_access_code_hash()
#   end
#
#   defp put_access_code_hash(changeset) do
#     case changeset do
#       %Ecto.Changeset{valid?: true, changes: %{access_code: pass}} ->
#         put_change(changeset, :password_hash,
#                    Comeonin.Bcrypt.hashpwsalt(pass))
#       _ ->
#         changeset
#     end
#   end
end
