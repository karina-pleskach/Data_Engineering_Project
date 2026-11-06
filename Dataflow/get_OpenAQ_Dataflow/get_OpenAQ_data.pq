let
  Source = Json.Document(Web.Contents("https://api.openaq.org/v3/sensors/2780575/measurements?limit=1000&page=8", [Headers = [#"X-API-Key" = OpenAQ_API_Key]])),
  Navigation = Source[results],
  #"Converted to table" = Table.FromList(Navigation, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
  #"Expanded Column1" = Table.ExpandRecordColumn(#"Converted to table", "Column1", {"value", "flagInfo", "parameter", "period", "coordinates", "summary", "coverage"}, {"value", "flagInfo", "parameter", "period", "coordinates", "summary", "coverage"}),
  #"Expanded period" = Table.ExpandRecordColumn(#"Expanded Column1", "period", {"label", "interval", "datetimeFrom", "datetimeTo"}, {"label", "interval", "datetimeFrom", "datetimeTo"}),
  #"Expanded datetimeFrom" = Table.ExpandRecordColumn(#"Expanded period", "datetimeFrom", {"utc", "local"}, {"datetimeFrom.utc", "datetimeFrom.local"}),
  #"Expanded datetimeTo" = Table.ExpandRecordColumn(#"Expanded datetimeFrom", "datetimeTo", {"utc", "local"}, {"datetimeTo.utc", "datetimeTo.local"})
in
  #"Expanded datetimeTo"