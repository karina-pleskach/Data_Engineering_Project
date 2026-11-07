let
  Source = List.Numbers(1, number_of_location_pages{0}[number]),
  #"Converted to table" = Table.FromList(Source, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
  #"Changed column type" = Table.TransformColumnTypes(#"Converted to table", {{"Column1", type number}}),
  #"Added custom" = Table.AddColumn(#"Changed column type", "Custom", each get_one_page(locations_url, [Column1], limit_query_param)),
  #"Expanded Custom" = Table.ExpandRecordColumn(#"Added custom", "Custom", {"Value"}, {"Value"}),
  #"Expanded Value" = Table.ExpandRecordColumn(#"Expanded Custom", "Value", {"results"}, {"results"}),
  #"Expanded results" = Table.ExpandListColumn(#"Expanded Value", "results"),
  #"Expanded results 1" = Table.ExpandRecordColumn(#"Expanded results", "results", {"id", "name", "sensors", "coordinates", "datetimeFirst", "datetimeLast"}, {"id", "name", "sensors", "coordinates", "datetimeFirst", "datetimeLast"}),
  #"Expanded coordinates" = Table.ExpandRecordColumn(#"Expanded results 1", "coordinates", {"latitude", "longitude"}, {"coordinates.latitude", "coordinates.longitude"}),
  #"Expanded datetimeFirst" = Table.ExpandRecordColumn(#"Expanded coordinates", "datetimeFirst", {"utc", "local"}, {"datetimeFirst.utc", "datetimeFirst.local"}),
  #"Expanded datetimeLast" = Table.ExpandRecordColumn(#"Expanded datetimeFirst", "datetimeLast", {"utc", "local"}, {"datetimeLast.utc", "datetimeLast.local"}),
  #"Expanded sensors" = Table.ExpandListColumn(#"Expanded datetimeLast", "sensors"),
  #"Expanded sensors 1" = Table.ExpandRecordColumn(#"Expanded sensors", "sensors", {"id", "name", "parameter"}, {"sensors.id", "sensors.name", "sensors.parameter"}),
  #"Expanded sensors.parameter" = Table.ExpandRecordColumn(#"Expanded sensors 1", "sensors.parameter", {"id", "name", "units", "displayName"}, {"sensors.parameter.id", "sensors.parameter.name", "sensors.parameter.units", "sensors.parameter.displayName"}),
  #"Removed columns" = Table.RemoveColumns(#"Expanded sensors.parameter", {"Column1"}),
  #"Changed column type 1" = Table.TransformColumnTypes(#"Removed columns", {{"id", Int64.Type}, {"name", type text}, {"sensors.id", Int64.Type}, {"sensors.name", type text}, {"sensors.parameter.id", Int64.Type}, {"sensors.parameter.name", type text}, {"sensors.parameter.units", type text}, {"sensors.parameter.displayName", type text}, {"coordinates.latitude", type number}, {"coordinates.longitude", type number}, {"datetimeFirst.utc", type datetime}, {"datetimeFirst.local", type datetimezone}, {"datetimeLast.utc", type datetime}, {"datetimeLast.local", type datetimezone}})
in
  #"Changed column type 1"