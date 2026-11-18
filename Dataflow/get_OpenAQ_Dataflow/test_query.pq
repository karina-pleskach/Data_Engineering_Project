let
  Source = get_one_page(get_sensor_measurements_url(671, "days", "2020-09-16T04:00:00.000000Z", "2020-09-23T04:00:00.000000Z"), 1, 100),
  Navigation = Source[Value],
  #"Navigation 1" = Navigation[results],
  #"Converted to table" = Table.FromList(#"Navigation 1", Splitter.SplitByNothing(), null, null, ExtraValues.Error),
  #"Expanded Column1" = Table.ExpandRecordColumn(#"Converted to table", "Column1", {"value", "flagInfo", "parameter", "period", "coordinates", "summary", "coverage"}, {"value", "flagInfo", "parameter", "period", "coordinates", "summary", "coverage"}),
  #"Expanded period" = Table.ExpandRecordColumn(#"Expanded Column1", "period", {"label", "interval", "datetimeFrom", "datetimeTo"}, {"label", "interval", "datetimeFrom", "datetimeTo"}),
  #"Expanded datetimeFrom" = Table.ExpandRecordColumn(#"Expanded period", "datetimeFrom", {"utc", "local"}, {"utc", "local"}),
  #"Expanded datetimeTo" = Table.ExpandRecordColumn(#"Expanded datetimeFrom", "datetimeTo", {"utc", "local"}, {"utc.1", "local.1"})
in
  #"Expanded datetimeTo"