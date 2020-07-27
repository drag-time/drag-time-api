defmodule DragTimeApi.AccessesTest do
  use DragTimeApi.DataCase

  alias DragTimeApi.Accesses

  describe "access" do
    alias DragTimeApi.Accesses.Access

    @valid_attrs %{access_code: "some access_code"}
    @update_attrs %{access_code: "some updated access_code"}
    @invalid_attrs %{access_code: nil}

    def access_fixture(attrs \\ %{}) do
      {:ok, access} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accesses.create_access()

      access
    end

    test "list_access/0 returns all access" do
      access = access_fixture()
      assert Accesses.list_access() == [access]
    end

    test "get_access!/1 returns the access with given id" do
      access = access_fixture()
      assert Accesses.get_access!(access.id) == access
    end

    test "create_access/1 with valid data creates a access" do
      assert {:ok, %Access{} = access} = Accesses.create_access(@valid_attrs)
      assert access.access_code == "some access_code"
    end

    test "create_access/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accesses.create_access(@invalid_attrs)
    end

    test "update_access/2 with valid data updates the access" do
      access = access_fixture()
      assert {:ok, %Access{} = access} = Accesses.update_access(access, @update_attrs)
      assert access.access_code == "some updated access_code"
    end

    test "update_access/2 with invalid data returns error changeset" do
      access = access_fixture()
      assert {:error, %Ecto.Changeset{}} = Accesses.update_access(access, @invalid_attrs)
      assert access == Accesses.get_access!(access.id)
    end

    test "delete_access/1 deletes the access" do
      access = access_fixture()
      assert {:ok, %Access{}} = Accesses.delete_access(access)
      assert_raise Ecto.NoResultsError, fn -> Accesses.get_access!(access.id) end
    end

    test "change_access/1 returns a access changeset" do
      access = access_fixture()
      assert %Ecto.Changeset{} = Accesses.change_access(access)
    end
  end
end
