---
- dashboard: chat_summary_ccai_us
  title: Chat Summary (CCAI) US
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: Ty34fvF1Ahks7184HESK3s
  elements:
  - name: Chat Summary
    title: Chat Summary
    model: dialogflow_cx_us
    explore: conversation_status
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [conversation_tags.count_conversation, conversation_tags.contained, conversation_tags.containment]
    filters:
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.channel: Chat
      conversation_tags.environment: Prod
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    font_size_main: '15'
    orientation: vertical
    style_conversation_tags.count_conversation: "#0F21EB"
    show_title_conversation_tags.count_conversation: true
    title_override_conversation_tags.count_conversation: Total Chats
    title_placement_conversation_tags.count_conversation: above
    value_format_conversation_tags.count_conversation: ''
    style_conversation_tags.contained: "#764BEA"
    show_title_conversation_tags.contained: true
    title_override_conversation_tags.contained: Contained Chats
    title_placement_conversation_tags.contained: above
    value_format_conversation_tags.contained: ''
    show_comparison_conversation_tags.contained: false
    style_conversation_tags.containment: "#6CBFC0"
    show_title_conversation_tags.containment: true
    title_placement_conversation_tags.containment: above
    value_format_conversation_tags.containment: 0%
    show_comparison_conversation_tags.containment: false
    style_conversation_tags.ghost_call: "#3A4245"
    show_title_conversation_tags.ghost_call: true
    title_placement_conversation_tags.ghost_call: above
    value_format_conversation_tags.ghost_call: ''
    show_comparison_conversation_tags.ghost_call: false
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    hidden_pivots: {}
    listen:
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Language: conversation_tags.language
    row: 0
    col: 0
    width: 3
    height: 10
  - name: Chatbot Summary
    title: Chatbot Summary
    model: dialogflow_cx_us
    explore: conversation_status
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [conversation_tags.count_conversation, conversation_tags.contained, conversation_tags.containment]
    filters:
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.channel: Chat
      conversation_tags.chat_target: Chatbot
      conversation_tags.environment: Prod
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    font_size_main: '15'
    orientation: vertical
    style_conversation_tags.count_conversation: "#0F21EB"
    show_title_conversation_tags.count_conversation: true
    title_override_conversation_tags.count_conversation: Total Chats
    title_placement_conversation_tags.count_conversation: above
    value_format_conversation_tags.count_conversation: ''
    style_conversation_tags.contained: "#764BEA"
    show_title_conversation_tags.contained: true
    title_override_conversation_tags.contained: Contained Chats
    title_placement_conversation_tags.contained: above
    value_format_conversation_tags.contained: ''
    show_comparison_conversation_tags.contained: false
    style_conversation_tags.containment: "#6CBFC0"
    show_title_conversation_tags.containment: true
    title_placement_conversation_tags.containment: above
    value_format_conversation_tags.containment: 0%
    show_comparison_conversation_tags.containment: false
    style_conversation_tags.ghost_call: "#3A4245"
    show_title_conversation_tags.ghost_call: true
    title_placement_conversation_tags.ghost_call: above
    value_format_conversation_tags.ghost_call: ''
    show_comparison_conversation_tags.ghost_call: false
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    hidden_pivots: {}
    listen:
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Language: conversation_tags.language
    row: 10
    col: 0
    width: 3
    height: 10
  - name: Chat Trend
    title: Chat Trend
    model: dialogflow_cx_us
    explore: conversation_status
    type: looker_line
    fields: [conversation_tags.created_date, conversation_tags.count_conversation,
      total_chats, chatbot_chats, conversation_tags.contained, contained, conversation_tags.containment,
      containment]
    filters:
      conversation_tags.created_date: 28 day ago for 28 day
      conversation_tags.channel: Chat
      conversation_tags.environment: Prod
    sorts: [conversation_tags.contained desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      label: Chatbot Chats
      value_format: 0.0,\K
      value_format_name: __custom
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: chatbot_chats
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.chat_target: Chatbot
    - category: measure
      label: Total Chats
      value_format: 0.0,\K
      value_format_name: __custom
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: total_chats
      type: count_distinct
      _type_hint: number
    - category: measure
      label: Contained
      value_format: 0.0,\K
      value_format_name: __custom
      based_on: conversation_tags.contained
      _kind_hint: measure
      measure: contained
      type: count_distinct
      _type_hint: number
    - category: measure
      label: Containment
      value_format: 0%
      value_format_name: __custom
      based_on: conversation_tags.containment
      _kind_hint: measure
      measure: containment
      type: count_distinct
      _type_hint: number
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: total_chats, id: total_chats,
            name: Total Chats}, {axisId: chatbot_chats, id: chatbot_chats, name: Chatbot
              Chats}, {axisId: contained, id: contained, name: Contained}], showLabels: true,
        showValues: true, minValue: !!null '', unpinAxis: false, tickDensity: default,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: containment,
            id: containment, name: Containment}], showLabels: false, showValues: false,
        maxValue: 0.75, unpinAxis: false, tickDensity: default, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: 120%
    label_value_format: ''
    series_types:
      conversation_tags.count_conversation: area
      conversation_tags.contained: area
      conversation_tags.containment: column
      containment: column
      contained: area
    series_colors:
      conversation_tags.count_conversation: "#BFACF7"
      conversation_tags.contained: "#0F21EB"
      conversation_tags.containment: "#6CBFC0"
      chatbot_chats: "#AB92F1"
      containment: "#F9AB00"
      total_chats: "#3B1DC6"
      contained: "#1c8c50"
    series_labels:
      conversation_tags.count_conversation: Total Chats
    series_point_styles:
      conversation_tags.containment: auto
      contained: auto
    hidden_fields: [conversation_tags.count_conversation, conversation_tags.contained,
      conversation_tags.containment]
    hidden_points_if_no: []
    font_size_main: '15'
    orientation: vertical
    style_conversation_tags.count_conversation: "#0F21EB"
    show_title_conversation_tags.count_conversation: true
    title_override_conversation_tags.count_conversation: Total Chats
    title_placement_conversation_tags.count_conversation: above
    value_format_conversation_tags.count_conversation: ''
    style_conversation_tags.contained: "#764BEA"
    show_title_conversation_tags.contained: true
    title_override_conversation_tags.contained: Contained Chats
    title_placement_conversation_tags.contained: above
    value_format_conversation_tags.contained: ''
    show_comparison_conversation_tags.contained: false
    style_conversation_tags.containment: "#6CBFC0"
    show_title_conversation_tags.containment: true
    title_placement_conversation_tags.containment: above
    value_format_conversation_tags.containment: 0%
    show_comparison_conversation_tags.containment: false
    style_conversation_tags.ghost_call: "#3A4245"
    show_title_conversation_tags.ghost_call: true
    title_placement_conversation_tags.ghost_call: above
    value_format_conversation_tags.ghost_call: ''
    show_comparison_conversation_tags.ghost_call: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Environment: conversation_tags.environment
      Language: conversation_tags.language
    row: 0
    col: 3
    width: 11
    height: 12
  - name: Top 10 Countries by Contact
    title: Top 10 Countries by Contact
    model: dialogflow_cx_us
    explore: conversation_status
    type: looker_column
    fields: [conversation_tags.country, conversation_tags.count_conversation]
    filters:
      conversation_tags.channel: Chat
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.environment: Prod
    sorts: [conversation_tags.count_conversation desc]
    limit: 10
    column_limit: 50
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
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
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
    color_application: undefined
    y_axes: [{label: '', orientation: left, series: [{axisId: conversation_tags.count_conversation,
            id: conversation_tags.count_conversation, name: Chats}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: right, series: [{axisId: percent_of_conversation_tags_conversation_count,
            id: percent_of_conversation_tags_conversation_count, name: Percent of
              Conversation Tags Conversation Count}], showLabels: false, showValues: false,
        minValue: -0.1, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: true
    series_types:
      percent_of_conversation_tags_conversation_count: scatter
    series_colors:
      conversation_tags.count_conversation: "#BFACF7"
    series_labels:
      conversation_tags.country: Country
      conversation_tags.count_conversation: Chats
    series_point_styles:
      percent_of_conversation_tags_conversation_count: diamond
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '14'
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
        is_active: false
    series_text_format:
      conversation_tags.country:
        align: right
      conversation_tags.count_conversation:
        align: center
    header_font_color: "#764BEA"
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields:
    hidden_points_if_no: []
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    up_color: false
    down_color: false
    total_color: false
    listen:
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Language: conversation_tags.language
    row: 0
    col: 20
    width: 4
    height: 20
  - name: Top 10 Languages
    title: Top 10 Languages
    model: dialogflow_cx_us
    explore: conversation_status
    type: looker_bar
    fields: [conversation_tags.count_conversation, conversation_tags.language, contact_count]
    filters:
      conversation_tags.channel: Chat
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.environment: Prod
    sorts: [contact_count desc]
    limit: 10
    column_limit: 50
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
    - category: measure
      label: Contact Count
      value_format: 0.0,\K
      value_format_name: __custom
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: contact_count
      type: count_distinct
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
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
    color_application: undefined
    y_axes: [{label: '', orientation: top, series: [{axisId: percent_of_conversation_tags_conversation_count,
            id: percent_of_conversation_tags_conversation_count, name: Percent of
              Conversation Tags Conversation Count}], showLabels: false, showValues: false,
        minValue: -0.1, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: bottom, series: [{axisId: conversation_tags.count_conversation,
            id: conversation_tags.count_conversation, name: Chats}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: true
    series_types:
      percent_of_conversation_tags_conversation_count: scatter
    series_colors:
      conversation_tags.count_conversation: "#c7ceea"
    series_labels:
      conversation_tags.country: Country
      conversation_tags.count_conversation: Chats
    series_point_styles:
      percent_of_conversation_tags_conversation_count: diamond
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '14'
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
        is_active: false
    series_text_format:
      conversation_tags.count_conversation:
        align: center
    header_font_color: "#764BEA"
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [conversation_tags.count_conversation]
    hidden_points_if_no: []
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    up_color: false
    down_color: false
    total_color: false
    listen:
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Language: conversation_tags.language
    row: 0
    col: 14
    width: 6
    height: 12
  - name: Chat Entry Site Breakdown
    title: Chat Entry Site Breakdown
    model: dialogflow_cx_us
    explore: conversation_status
    type: looker_waterfall
    fields: [conversation_tags.count_conversation, conversation_tags.chat_site, count]
    filters:
      conversation_tags.created_date: today
      conversation_tags.channel: Chat
      conversation_tags.brand: Norton,LifeLock
      conversation_tags.chat_site: "-Unknown Origin Site"
    sorts: [conversation_tags.count_conversation desc]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression:
      label: Escalated to Contact Us
      value_format:
      value_format_name:
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: escalated_to_contact_us
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.call_resolution: Link to Contact Us
    - category: measure
      expression:
      label: Escalated to Agent
      value_format:
      value_format_name:
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: escalated_to_agent
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.call_resolution: Escalation,Escalation Default Queue
    - category: measure
      label: Count
      value_format: 0.0,\K
      value_format_name: __custom
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: count
      type: count_distinct
      _type_hint: number
    up_color: "#A1D8D8"
    down_color: false
    total_color: "#BFACF7"
    show_value_labels: true
    show_x_axis_ticks: true
    show_x_axis_label: false
    x_axis_scale: auto
    show_y_axis_labels: false
    show_y_axis_ticks: false
    y_axis_gridlines: false
    color_application: undefined
    label_color: ["#0000ff"]
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_colors:
      conversation_tags.count_conversation: "#0F21EB"
      conversation_tags.contained: "#6CBFC0"
      Help Center: "#BFACF7"
      Sales Home: "#B0DFDF"
      NGP: "#6CBFC0"
      SP Web App: "#0F21EB"
    series_labels: {}
    font_size: 17
    charts_across: 7
    circleThickness: 0.5
    circleFillGap: 0.5
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
    series_cell_visualizations:
      conversation_tags.count_conversation:
        is_active: true
      escalated_to_contact_us:
        is_active: false
      conversation_tags.containment:
        is_active: true
        palette:
          palette_id: '01857634-2c2b-7239-3caf-4d40beb45474'
          collection_id: gen
          custom_colors:
          - "#FFFFFF"
          - "#19ba25"
    x_axis_gridlines: false
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    label_density: 25
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_dropoff: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [conversation_tags.count_conversation]
    hidden_points_if_no: []
    font_size_main: '15'
    orientation: vertical
    style_conversation_tags.count_conversation: "#0F21EB"
    show_title_conversation_tags.count_conversation: true
    title_override_conversation_tags.count_conversation: Total Calls
    title_placement_conversation_tags.count_conversation: above
    value_format_conversation_tags.count_conversation: ''
    style_conversation_tags.contained: "#764BEA"
    show_title_conversation_tags.contained: true
    title_override_conversation_tags.contained: Contained Calls
    title_placement_conversation_tags.contained: above
    value_format_conversation_tags.contained: ''
    show_comparison_conversation_tags.contained: false
    style_conversation_tags.containment: "#6CBFC0"
    show_title_conversation_tags.containment: true
    title_placement_conversation_tags.containment: above
    value_format_conversation_tags.containment: 0%
    show_comparison_conversation_tags.containment: false
    style_conversation_tags.ghost_call: "#3A4245"
    show_title_conversation_tags.ghost_call: true
    title_placement_conversation_tags.ghost_call: above
    value_format_conversation_tags.ghost_call: ''
    show_comparison_conversation_tags.ghost_call: false
    defaults_version: 1
    hidden_pivots: {}
    groupBars: true
    labelSize: 10pt
    showLegend: true
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen:
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Language: conversation_tags.language
    row: 12
    col: 14
    width: 6
    height: 8
  - name: Bot Containment by Language
    title: Bot Containment by Language
    model: dialogflow_cx_us
    explore: conversation_status
    type: looker_column
    fields: [conversation_tags.containment, conversation_tags.language]
    filters:
      conversation_tags.created_date: today
      conversation_tags.channel: Chat
      conversation_tags.brand: Norton,LifeLock
      conversation_tags.language: "-Other"
      conversation_tags.call_flow: Automation Eligible
    sorts: [conversation_tags.containment desc 0]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression:
      label: Escalated to Contact Us
      value_format:
      value_format_name:
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: escalated_to_contact_us
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.call_resolution: Link to Contact Us
    - category: measure
      expression:
      label: Escalated to Agent
      value_format:
      value_format_name:
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: escalated_to_agent
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.call_resolution: Escalation,Escalation Default Queue
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application: undefined
    y_axes: [{label: '', orientation: left, series: [{axisId: conversation_tags.containment,
            id: conversation_tags.containment, name: Containment}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: true
    font_size: '17'
    label_value_format: 0%
    series_colors:
      conversation_tags.count_conversation: "#0F21EB"
      conversation_tags.contained: "#6CBFC0"
      Help Center: "#BFACF7"
      Sales Home: "#B0DFDF"
      NGP: "#6CBFC0"
      SP Web App: "#0F21EB"
      conversation_tags.containment: "#6CBFC0"
    series_labels: {}
    show_dropoff: false
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    charts_across: 7
    circleThickness: 0.5
    circleFillGap: 0.5
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
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
      escalated_to_contact_us:
        is_active: false
      conversation_tags.containment:
        is_active: true
        palette:
          palette_id: '01857634-2c2b-7239-3caf-4d40beb45474'
          collection_id: gen
          custom_colors:
          - "#FFFFFF"
          - "#19ba25"
    hidden_fields: []
    hidden_points_if_no: []
    font_size_main: '15'
    orientation: vertical
    style_conversation_tags.count_conversation: "#0F21EB"
    show_title_conversation_tags.count_conversation: true
    title_override_conversation_tags.count_conversation: Total Calls
    title_placement_conversation_tags.count_conversation: above
    value_format_conversation_tags.count_conversation: ''
    style_conversation_tags.contained: "#764BEA"
    show_title_conversation_tags.contained: true
    title_override_conversation_tags.contained: Contained Calls
    title_placement_conversation_tags.contained: above
    value_format_conversation_tags.contained: ''
    show_comparison_conversation_tags.contained: false
    style_conversation_tags.containment: "#6CBFC0"
    show_title_conversation_tags.containment: true
    title_placement_conversation_tags.containment: above
    value_format_conversation_tags.containment: 0%
    show_comparison_conversation_tags.containment: false
    style_conversation_tags.ghost_call: "#3A4245"
    show_title_conversation_tags.ghost_call: true
    title_placement_conversation_tags.ghost_call: above
    value_format_conversation_tags.ghost_call: ''
    show_comparison_conversation_tags.ghost_call: false
    defaults_version: 1
    hidden_pivots: {}
    groupBars: true
    labelSize: 10pt
    showLegend: true
    up_color: false
    down_color: false
    total_color: false
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen:
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
    row: 12
    col: 10
    width: 4
    height: 8
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: yesterday
    allow_multiple_values: true
    required: true
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: dialogflow_cx_us
    explore: conversation_status
    listens_to_filters: []
    field: conversation_tags.created_date
  - name: Language
    title: Language
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: dialogflow_cx_us
    explore: conversation_status
    listens_to_filters: []
    field: conversation_tags.language
  - name: Environment
    title: Environment
    type: field_filter
    default_value: Prod
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
      options:
      - Prod
      - Other
    model: dialogflow_cx_us
    explore: conversation_status
    listens_to_filters: []
    field: conversation_tags.environment
