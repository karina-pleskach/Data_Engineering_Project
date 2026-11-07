let
  Source = (url as text, page_num as number, limit as number) =>
    try
        Json.Document(Web.Contents(url & "page=" & Number.ToText(page_num) & "&limit=" & Number.ToText(limit), [Headers = [#"X-API-Key" = OpenAQ_API_Key]]))
in
  Source