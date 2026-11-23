let
    Source = get_one_page("1"),
    Navigation = Source{0},
    Pages = Navigation[pages],
  #"Converted to table" = #table(1, {{Pages}}),
  #"Renamed columns" = Table.RenameColumns(#"Converted to table", {{"Column1", "number"}}),
  #"Changed column type" = Table.TransformColumnTypes(#"Renamed columns", {{"number", Int64.Type}})
in
    #"Changed column type"