defmodule Dbo.DB.Format do
@moduledoc """
  Formatter module.  Return query results in an actually usuable format.
"""

  @doc """
    Handle result set depending on num_rows returned in the query.
  """
  def handle_results(res) do
    case res.num_rows do
      1 ->
        handle_single_result(res.rows)
      _ ->
        handle_multiple(res.rows)  
    end
  end


  def handle_single_result(res) do
    rr = List.first(res)
    Tuple.to_list(rr) |> List.first
    # ya
  end


  def handle_multiple(res) do
    Enum.map(res, fn (x) -> Tuple.to_list(x) 
      |> List.first 
      |> Poison.encode! 
    end)

  end


  def tester(_res) do


  end


  def strip_squares do


  end

  
end