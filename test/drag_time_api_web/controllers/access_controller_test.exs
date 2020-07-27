# defmodule DragTimeApiWeb.AccessControllerTest do
#   use DragTimeApiWeb.ConnCase
#
#   alias DragTimeApi.Accesses
#   alias DragTimeApi.Accesses.Access
#
#   @create_attrs %{
#     access_code: "some access_code"
#   }
#   @update_attrs %{
#     access_code: "some updated access_code"
#   }
#   @invalid_attrs %{access_code: nil}
#
#   def fixture(:access) do
#     {:ok, access} = Accesses.create_access(@create_attrs)
#     access
#   end
#
#   setup %{conn: conn} do
#     {:ok, conn: put_req_header(conn, "accept", "application/json")}
#   end
#
#   describe "index" do
#     test "lists all access", %{conn: conn} do
#       conn = get(conn, Routes.access_path(conn, :index))
#       assert json_response(conn, 200)["data"] == []
#     end
#   end
#
#   describe "create access" do
#     test "renders access when data is valid", %{conn: conn} do
#       conn = post(conn, Routes.access_path(conn, :create), access: @create_attrs)
#       assert %{"id" => id} = json_response(conn, 201)["data"]
#
#       conn = get(conn, Routes.access_path(conn, :show, id))
#
#       assert %{
#                "id" => id,
#                "access_code" => "some access_code"
#              } = json_response(conn, 200)["data"]
#     end
#
#     test "renders errors when data is invalid", %{conn: conn} do
#       conn = post(conn, Routes.access_path(conn, :create), access: @invalid_attrs)
#       assert json_response(conn, 422)["errors"] != %{}
#     end
#   end
#
#   describe "update access" do
#     setup [:create_access]
#
#     test "renders access when data is valid", %{conn: conn, access: %Access{id: id} = access} do
#       conn = put(conn, Routes.access_path(conn, :update, access), access: @update_attrs)
#       assert %{"id" => ^id} = json_response(conn, 200)["data"]
#
#       conn = get(conn, Routes.access_path(conn, :show, id))
#
#       assert %{
#                "id" => id,
#                "access_code" => "some updated access_code"
#              } = json_response(conn, 200)["data"]
#     end
#
#     test "renders errors when data is invalid", %{conn: conn, access: access} do
#       conn = put(conn, Routes.access_path(conn, :update, access), access: @invalid_attrs)
#       assert json_response(conn, 422)["errors"] != %{}
#     end
#   end
#
#   describe "delete access" do
#     setup [:create_access]
#
#     test "deletes chosen access", %{conn: conn, access: access} do
#       conn = delete(conn, Routes.access_path(conn, :delete, access))
#       assert response(conn, 204)
#
#       assert_error_sent 404, fn ->
#         get(conn, Routes.access_path(conn, :show, access))
#       end
#     end
#   end
#
#   defp create_access(_) do
#     access = fixture(:access)
#     %{access: access}
#   end
# end
