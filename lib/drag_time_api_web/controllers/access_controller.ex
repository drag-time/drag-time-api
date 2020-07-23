defmodule DragTimeApiWeb.AccessController do
  use DragTimeApiWeb, :controller

  alias DragTimeApi.Repo

  action_fallback DragTimeApiWeb.FallbackController

  def index(conn, %{"access_code" => access_code}) do
    if "1234" == access_code do
      send_resp(conn, 200, '{"success" : "correct access code"}')
    end
    send_resp(conn, 400, '{"error" : "incorrect access code"}')
  end
end
