(sensor_id as number, period as text, datetime_from as nullable text, datetime_to as nullable text) as list =>
let
    sensor_url = get_sensor_measurements_url(sensor_id, period, datetime_from, datetime_to),
    all_pages = List.Generate(
        () => [current_page = 1, response = get_one_page(sensor_url, 1, limit_query_param)],
        each not [response][HasError] and List.Count([response][Value][results]) > 0,
        each [current_page = [current_page] + 1, response = get_one_page(sensor_url, [current_page] + 1, limit_query_param)],
        each [response][Value][results]
    ),
    combined_pages = List.Combine(all_pages)
in
    combined_pages