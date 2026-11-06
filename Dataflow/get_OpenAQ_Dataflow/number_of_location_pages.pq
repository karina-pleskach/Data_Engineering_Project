let
  Source = Json.Document(Web.Contents(locations_url, [Headers = [#"X-API-Key" = OpenAQ_API_Key]])),
  Navigation = Source[meta],
  #"Drill down" = Navigation[found],
  #"Integer-divided value" = Number.IntegerDivide(#"Drill down", 1000) + 1,
  #"Converted to table" = #table(1, {{#"Integer-divided value"}}),
  #"Renamed columns" = Table.RenameColumns(#"Converted to table", {{"Column1", "number"}}),
  #"Changed column type" = Table.TransformColumnTypes(#"Renamed columns", {{"number", Int64.Type}})
in
  #"Changed column type"