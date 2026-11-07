(sensor_id as number, period as text) as list =>
let
    all_pages = List.Generate(
        () => [current_page = 1, response = get_one_page(get_sensor_measurements_url(sensor_id, period), 1, limit_query_param)],
        each not [response][HasError] and List.Count([response][Value][results]) > 0,
        each [current_page = [current_page] + 1, response = get_one_page(get_sensor_measurements_url(sensor_id, period), [current_page] + 1, limit_query_param)],
        each [response][Value][results]
    ),
    combined_pages = List.Combine(all_pages)
in
    combined_pages