let
  Source = Lakehouse.Contents([HierarchicalNavigation = null, EnableVorder = true, OutputMetadataRefresh = true]),
  #"Navigation 1" = Source{[workspaceId = "7267c3dd-58a1-43e7-8700-fdb441903273"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "fa985e23-5a98-434b-8ff5-2c39b7a229d4"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Id = "USD_EUR_FX_rates", ItemKind = "Table"]}[Data],
  #"Calculated latest" = List.Max(#"Navigation 3"[TIME_PERIOD])
in
  #"Calculated latest"