let
  Source = get_locations,
  #"Added custom" = Table.AddColumn(Source, "Custom", each get_measurements_by_sensor([sensors.id], "hours"))
in
  #"Added custom"