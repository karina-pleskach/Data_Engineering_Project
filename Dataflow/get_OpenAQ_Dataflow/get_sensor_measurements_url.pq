(sensor_id as number, period as text, datetime_from as nullable text, datetime_to as nullable text) as text =>
let
  date_params =
    if datetime_from <> null and datetime_to <> null then
      "datetime_from=" & datetime_from & "&datetime_to=" & datetime_to & "&"
    else
      "",
  url = measurements_url & Number.ToText(sensor_id) & "/" & period & "?" & date_params
in
  url