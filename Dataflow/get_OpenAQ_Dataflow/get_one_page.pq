let
  Source = (url as text, page_num as number, limit as number) =>
    try
      Function.InvokeAfter(
        () => Json.Document(Web.Contents(url & "page=" & Number.ToText(page_num) & "&limit=" & Number.ToText(limit), [Headers = [#"X-API-Key" = OpenAQ_API_Key]])),
        #duration(0, 0, 0, 4)
      )
in
  Source