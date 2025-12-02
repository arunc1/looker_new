---
- dashboard: contact_details__use_cases_us
  title: Contact Details - Use Cases US
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  filters_bar_collapsed: true
  preferred_slug: ZgNKV3oe0g2yigIkX2CPIJ
  elements:
  - name: Contact Details - Containment Top 25
    title: Contact Details - Containment Top 25
    model: dialogflow_cx_us
    explore: conversation_status
    type: looker_grid
    fields: [conversation_tags.contained, conversation_tags.containment, conversation_tags.intent,
      conversation_tags.count_conversation]
    filters:
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.call_id_test: 'No'
      conversation_tags.call_flow: Automation Eligible
      conversation_tags.intent: "-TBD"
    sorts: [conversation_tags.containment desc]
    limit: 25
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${conversation_tags.total_escalated_calls} + ${conversation_tags.contained}"
      label: Total Calls
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: total_calls
      _type_hint: number
      is_disabled: true
    - category: dimension
      expression: replace(substring(${conversation_status.matched_intent}, 8, 100),".","
        ")
      label: Intent
      value_format:
      value_format_name:
      dimension: intent
      _kind_hint: dimension
      _type_hint: string
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      conversation_tags.contained: Contained Calls
    series_cell_visualizations:
      conversation_tags.containment:
        is_active: true
        palette:
          palette_id: e5a96c0f-332a-0641-64ea-849a7e3ccc00
          collection_id: gen
          custom_colors:
          - "#ffd03b"
          - "#0bbd2b"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: conversation_tags.count_conversation,
            id: conversation_tags.count_conversation, name: Conversation Count}, {
            axisId: conversation_tags.contained, id: conversation_tags.contained,
            name: Contained Conversations}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: left, series: [{axisId: conversation_tags.containment,
            id: conversation_tags.containment, name: Containment}], showLabels: true,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      conversation_tags.containment: "#764BEA"
      conversation_tags.total_escalated_calls: "#0F21EB"
      conversation_tags.contained: "#6CBFC0"
    font_size_main: '16'
    orientation: vertical
    style_conversation_tags.count_conversation: "#3A4245"
    show_title_conversation_tags.count_conversation: true
    title_override_conversation_tags.count_conversation: Total Calls
    title_placement_conversation_tags.count_conversation: above
    value_format_conversation_tags.count_conversation: ''
    style_conversation_tags.contained: "#fec301"
    show_title_conversation_tags.contained: true
    title_override_conversation_tags.contained: Contained Calls
    title_placement_conversation_tags.contained: above
    value_format_conversation_tags.contained: ''
    show_comparison_conversation_tags.contained: false
    style_conversation_tags.containment: "#37aebe"
    show_title_conversation_tags.containment: true
    title_placement_conversation_tags.containment: above
    value_format_conversation_tags.containment: ''
    show_comparison_conversation_tags.containment: false
    hidden_fields: [conversation_tags.contained]
    hidden_points_if_no: []
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Channel: conversation_tags.channel
      Created Date: conversation_tags.created_date
    row: 0
    col: 16
    width: 8
    height: 12
  - name: Contact Details - Intents Count & % of total
    title: Contact Details - Intents Count & % of total
    model: dialogflow_cx_us
    explore: conversation_status
    type: looker_grid
    fields: [solution_type, conversation_tags.intent, conversation_tags.count_conversation,
      conversation_tags.containment]
    filters:
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.call_id_test: 'No'
      conversation_tags.call_flow: Automation Eligible
      conversation_tags.intent: "-TBD"
    sorts: [solution_type]
    subtotals: [solution_type]
    limit: 100
    column_limit: 50
    total: true
    dynamic_fields:
    - args:
      - conversation_tags.count_conversation
      calculation_type: percent_of_column_sum
      category: table_calculation
      based_on: conversation_tags.count_conversation
      label: Percent of Conversation Tags Conversation Count
      source_field: conversation_tags.count_conversation
      table_calculation: percent_of_conversation_tags_conversation_count
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - category: dimension
      expression: replace(substring(${conversation_status.matched_intent}, 8, 100),".","
        ")
      label: Intent
      value_format:
      value_format_name:
      dimension: intent
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: if (${conversation_tags.channel} = "Voice", ${conversation_tags.solution_type_voice},
        ${conversation_tags.solution_type_chat})
      label: Solution Type
      value_format:
      value_format_name:
      dimension: solution_type
      _kind_hint: dimension
      _type_hint: string
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      conversation_tags.contained: Contained Calls
      percent_of_conversation_tags_conversation_count: "% of Total"
    series_cell_visualizations:
      conversation_tags.count_conversation:
        is_active: true
      percent_of_conversation_tags_conversation_count:
        is_active: true
        palette:
          palette_id: 3b43caf5-764c-80d6-b582-a346ad85c880
          collection_id: gen
          custom_colors:
          - "#ffffff"
          - "#5daefc"
      conversation_tags.containment:
        is_active: true
        palette:
          palette_id: 37567eb0-c23f-317a-b12d-f8f2baa3451a
          collection_id: gen
          custom_colors:
          - "#fc5931"
          - "#FFFFFF"
          - "#24e03d"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#6CBFC0",
        font_color: !!null '', color_application: {collection_id: gen, palette_id: gen-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_value_format:
      conversation_tags.containment:
        name: percent_0
        decimals: '0'
        format_string: "#,##0%"
        label: Percent (0)
        label_prefix: Percent
      conversation_tags.count_conversation:
        format_string:
      percent_of_conversation_tags_conversation_count:
        format_string: "#,##0%"
    value_labels: legend
    label_type: lab
    inner_radius: 0
    series_colors:
      conversation_tags.containment: "#37aebe"
      conversation_tags.total_escalated_calls: "#6a6f76"
      conversation_tags.contained: "#fec301"
      conversation_tags.count_conversation: "#AB92F1"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: conversation_tags.count_conversation,
            id: conversation_tags.count_conversation, name: Conversation Count}, {
            axisId: conversation_tags.contained, id: conversation_tags.contained,
            name: Contained Conversations}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: left, series: [{axisId: conversation_tags.containment,
            id: conversation_tags.containment, name: Containment}], showLabels: true,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    font_size_main: '16'
    orientation: vertical
    style_conversation_tags.count_conversation: "#3A4245"
    show_title_conversation_tags.count_conversation: true
    title_override_conversation_tags.count_conversation: Total Calls
    title_placement_conversation_tags.count_conversation: above
    value_format_conversation_tags.count_conversation: ''
    style_conversation_tags.contained: "#fec301"
    show_title_conversation_tags.contained: true
    title_override_conversation_tags.contained: Contained Calls
    title_placement_conversation_tags.contained: above
    value_format_conversation_tags.contained: ''
    show_comparison_conversation_tags.contained: false
    style_conversation_tags.containment: "#37aebe"
    show_title_conversation_tags.containment: true
    title_placement_conversation_tags.containment: above
    value_format_conversation_tags.containment: ''
    show_comparison_conversation_tags.containment: false
    hidden_fields: []
    hidden_points_if_no: []
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Channel: conversation_tags.channel
      Created Date: conversation_tags.created_date
    row: 0
    col: 5
    width: 11
    height: 52
  - name: Contact Details - Containment Bottom 25
    title: Contact Details - Containment Bottom 25
    model: dialogflow_cx_us
    explore: conversation_status
    type: looker_grid
    fields: [conversation_tags.contained, conversation_tags.containment, conversation_tags.intent,
      conversation_tags.count_conversation]
    filters:
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.call_id_test: 'No'
      conversation_tags.call_flow: Automation Eligible
    sorts: [conversation_tags.containment]
    limit: 25
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${conversation_tags.total_escalated_calls} + ${conversation_tags.contained}"
      label: Total Calls
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: total_calls
      _type_hint: number
      is_disabled: true
    - category: dimension
      expression: replace(substring(${conversation_status.matched_intent}, 8, 100),".","
        ")
      label: Intent
      value_format:
      value_format_name:
      dimension: intent
      _kind_hint: dimension
      _type_hint: string
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      conversation_tags.contained: Contained Calls
    series_cell_visualizations:
      conversation_tags.containment:
        is_active: true
        palette:
          palette_id: f0e9b0a1-d965-4315-5857-ef09b6e7387d
          collection_id: gen
          custom_colors:
          - "#ff262f"
          - "#fff329"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: conversation_tags.count_conversation,
            id: conversation_tags.count_conversation, name: Conversation Count}, {
            axisId: conversation_tags.contained, id: conversation_tags.contained,
            name: Contained Conversations}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: left, series: [{axisId: conversation_tags.containment,
            id: conversation_tags.containment, name: Containment}], showLabels: true,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      conversation_tags.containment: "#764BEA"
      conversation_tags.total_escalated_calls: "#0F21EB"
      conversation_tags.contained: "#6CBFC0"
    font_size_main: '16'
    orientation: vertical
    style_conversation_tags.count_conversation: "#3A4245"
    show_title_conversation_tags.count_conversation: true
    title_override_conversation_tags.count_conversation: Total Calls
    title_placement_conversation_tags.count_conversation: above
    value_format_conversation_tags.count_conversation: ''
    style_conversation_tags.contained: "#fec301"
    show_title_conversation_tags.contained: true
    title_override_conversation_tags.contained: Contained Calls
    title_placement_conversation_tags.contained: above
    value_format_conversation_tags.contained: ''
    show_comparison_conversation_tags.contained: false
    style_conversation_tags.containment: "#37aebe"
    show_title_conversation_tags.containment: true
    title_placement_conversation_tags.containment: above
    value_format_conversation_tags.containment: ''
    show_comparison_conversation_tags.containment: false
    hidden_fields: [conversation_tags.contained]
    hidden_points_if_no: []
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Channel: conversation_tags.channel
      Created Date: conversation_tags.created_date
    row: 12
    col: 16
    width: 8
    height: 12
  - name: Contact Details - Solution Type
    title: Contact Details - Solution Type
    model: dialogflow_cx_us
    explore: conversation_status
    type: looker_donut_multiples
    fields: [solution_type, conversation_tags.count_conversation, conversation_tags.contained]
    filters:
      conversation_tags.created_date: 2 day ago for 2 day
      conversation_tags.call_id_test: 'No'
      conversation_tags.call_flow: Automation Eligible
      conversation_tags.intent: "-TBD"
    sorts: [solution_type]
    limit: 100
    column_limit: 50
    total: true
    dynamic_fields:
    - args:
      - conversation_tags.count_conversation
      calculation_type: percent_of_column_sum
      category: table_calculation
      based_on: conversation_tags.count_conversation
      label: Percent of Conversation Tags Conversation Count
      source_field: conversation_tags.count_conversation
      table_calculation: percent_of_conversation_tags_conversation_count
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - category: dimension
      expression: replace(substring(${conversation_status.matched_intent}, 8, 100),".","
        ")
      label: Intent
      value_format:
      value_format_name:
      dimension: intent
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: if (${conversation_tags.channel} = "Voice", ${conversation_tags.solution_type_voice},
        ${conversation_tags.solution_type_chat})
      label: Solution Type
      value_format:
      value_format_name:
      dimension: solution_type
      _kind_hint: dimension
      _type_hint: string
    - category: table_calculation
      expression: "${conversation_tags.count_conversation} - ${conversation_tags.contained}"
      label: Escalated
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: escalated
      _type_hint: number
    show_value_labels: true
    font_size: 16
    charts_across: 1
    series_colors:
      conversation_tags.containment: "#37aebe"
      conversation_tags.total_escalated_calls: "#6a6f76"
      conversation_tags.contained: "#6CBFC0"
      conversation_tags.count_conversation: "#AB92F1"
      escalated: "#B31412"
    series_labels:
      conversation_tags.contained: Contained Calls
      percent_of_conversation_tags_conversation_count: "% of Total"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: conversation_tags.count_conversation,
            id: conversation_tags.count_conversation, name: Conversation Count}, {
            axisId: conversation_tags.contained, id: conversation_tags.contained,
            name: Contained Conversations}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: left, series: [{axisId: conversation_tags.containment,
            id: conversation_tags.containment, name: Containment}], showLabels: true,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      conversation_tags.count_conversation:
        is_active: true
      percent_of_conversation_tags_conversation_count:
        is_active: true
        palette:
          palette_id: 3b43caf5-764c-80d6-b582-a346ad85c880
          collection_id: gen
          custom_colors:
          - "#ffffff"
          - "#5daefc"
      conversation_tags.containment:
        is_active: true
        palette:
          palette_id: 37567eb0-c23f-317a-b12d-f8f2baa3451a
          collection_id: gen
          custom_colors:
          - "#fc5931"
          - "#FFFFFF"
          - "#24e03d"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#6CBFC0",
        font_color: !!null '', color_application: {collection_id: gen, palette_id: gen-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_value_format:
      conversation_tags.count_conversation:
        format_string:
    value_labels: legend
    label_type: lab
    inner_radius: 0
    font_size_main: '16'
    orientation: vertical
    style_conversation_tags.count_conversation: "#3A4245"
    show_title_conversation_tags.count_conversation: true
    title_override_conversation_tags.count_conversation: Total Calls
    title_placement_conversation_tags.count_conversation: above
    value_format_conversation_tags.count_conversation: ''
    style_conversation_tags.contained: "#fec301"
    show_title_conversation_tags.contained: true
    title_override_conversation_tags.contained: Contained Calls
    title_placement_conversation_tags.contained: above
    value_format_conversation_tags.contained: ''
    show_comparison_conversation_tags.contained: false
    style_conversation_tags.containment: "#37aebe"
    show_title_conversation_tags.containment: true
    title_placement_conversation_tags.containment: above
    value_format_conversation_tags.containment: ''
    show_comparison_conversation_tags.containment: false
    hidden_fields: [conversation_tags.count_conversation]
    hidden_points_if_no: []
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Channel: conversation_tags.channel
      Created Date: conversation_tags.created_date
    row: 0
    col: 0
    width: 5
    height: 24
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: yesterday
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: dialogflow_cx_us
    explore: conversation_status
    listens_to_filters: []
    field: conversation_tags.created_date
  - name: Channel
    title: Channel
    type: field_filter
    default_value: Voice
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: dialogflow_cx_us
    explore: conversation_tags
    listens_to_filters: []
    field: conversation_tags.channel
