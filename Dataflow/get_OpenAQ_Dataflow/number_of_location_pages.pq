let
  Source = get_one_page(locations_url, 1, limit_query_param),
  Navigation = Source[Value],
  #"Navigation 1" = Navigation[meta],
  #"Drill down" = #"Navigation 1"[found],
  #"Integer-divided value" = Number.IntegerDivide(#"Drill down", limit_query_param) + 1,
  #"Converted to table" = #table(1, {{#"Integer-divided value"}}),
  #"Renamed columns" = Table.RenameColumns(#"Converted to table", {{"Column1", "number"}}),
  #"Changed column type" = Table.TransformColumnTypes(#"Renamed columns", {{"number", Int64.Type}})
in
  #"Changed column type"