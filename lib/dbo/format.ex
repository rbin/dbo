defmodule Dbo.DB.Format do
@moduledoc """
  Formatter module.  Return query results in an actually usuable format.
"""

  @doc """
    RENAME  -  This func will take the Postgrex result, split the cloumn heads & values into JSON keys/vals.
  """
  @spec something(%{Postgrex.result}) :: JSON.Object # Change this spec to validate.
  def something(result) do
    Enum.map(result.rows, fn row ->
      Enum.zip(result.columns, Tuple.to_list(row))
      |> Enum.into(%{})
      |> Poison.encode!
    end)
  end

  def strip_squares do


  end

  
end