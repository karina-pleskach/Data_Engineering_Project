let
  Source = (sensor_id as number, period as text) as text =>
let
    url = measurements_url & Number.ToText(sensor_id) & "/" & period & "?"
in
    url
in
  Source