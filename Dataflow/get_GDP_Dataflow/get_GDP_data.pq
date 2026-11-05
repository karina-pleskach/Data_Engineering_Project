let
  Source = List.Numbers(1, num_of_rows),
  #"Converted to table" = Table.FromList(Source, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
  #"Changed column type" = Table.TransformColumnTypes(#"Converted to table", {{"Column1", type text}}),
  #"Added custom" = Table.AddColumn(#"Changed column type", "Custom", each Json.Document(Web.Contents(base_url & "&page=" & [Column1]))),
  #"Expanded Custom" = Table.ExpandListColumn(#"Added custom", "Custom"),
  #"Filtered rows" = Table.SelectRows(#"Expanded Custom", each Value.Is([Custom], type list)),
  #"Expanded Custom 1" = Table.ExpandListColumn(#"Filtered rows", "Custom"),
  #"Expanded Custom 2" = Table.ExpandRecordColumn(#"Expanded Custom 1", "Custom", {"indicator", "country", "countryiso3code", "date", "value", "unit", "obs_status", "decimal"}, {"indicator", "country", "countryiso3code", "date", "value", "unit", "obs_status", "decimal"}),
  #"Expanded country" = Table.ExpandRecordColumn(#"Expanded Custom 2", "country", {"id", "value"}, {"country.id", "country.value"}),
  #"Expanded indicator" = Table.ExpandRecordColumn(#"Expanded country", "indicator", {"id", "value"}, {"indicator.id", "indicator.value"}),
  #"Removed columns" = Table.RemoveColumns(#"Expanded indicator", {"Column1"}),
  #"Changed column type 1" = Table.TransformColumnTypes(#"Removed columns", {{"indicator.id", type text}, {"indicator.value", type text}, {"country.id", type text}, {"country.value", type text}, {"countryiso3code", type text}, {"date", Int64.Type}, {"value", Int64.Type}, {"unit", type text}, {"obs_status", type text}, {"decimal", Int64.Type}})
in
  #"Changed column type 1"