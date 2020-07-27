defmodule DragTimeApiWeb.AccessController do
  use DragTimeApiWeb, :controller

  alias DragTimeApi.Accesses
  alias DragTimeApi.Accesses.Access

  alias DragTimeApi.Repo

  action_fallback DragTimeApiWeb.FallbackController

  def index(conn, %{"access_code" => access_code}) do
    code = Phoenix.Token.verify(secret, "access", access_code)
    if code == {:error, :invalid} do
      send_resp(conn, 400, '{"error" : "incorrect access code"}')
    else
      send_resp(conn, 200, '{"success" : "correct access code"}')
    end
  end

  def create(conn, %{"access" => access_code_params}) do
    code = Phoenix.Token.sign(secret, "access", access_code_params)
    with {:ok, %Access{} = access} <- Accesses.create_access(%{"access_code" => code}) do
      conn
      |> put_status(:created)
    end
    send_resp(conn, 200, '{"success" : #{code}}')
  end

  defp secret do
    "kjoy3o1zeidquwy1398juxzldjlksahdk3"
  end

end
