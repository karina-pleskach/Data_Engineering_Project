let
    Source = (page as text) =>
    Json.Document(Web.Contents(base_url & "&page=" & page))
in
    Source