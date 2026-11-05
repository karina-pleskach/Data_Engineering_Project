let
  Source = Json.Document(Web.Contents("https://api.worldbank.org/v2/country/USA/indicator/NY.GDP.MKTP.CD?format=json")),
  Navigation = Source{0},
  #"Drill down" = Navigation[pages]
in
  #"Drill down"