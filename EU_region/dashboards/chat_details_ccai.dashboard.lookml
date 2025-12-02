---
- dashboard: chat_details_ccai
  title: Chat Details (CCAI) EU
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: uaaO9nh4zo8kkgYI6VHXdf
  elements:
  - name: Chat Entry Breakdown
    title: Chat Entry Breakdown
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_grid
    fields: [conversation_tags.chat_target, conversation_tags.chat_origin, conversation_tags.count_conversation,
      escalated_to_contact_us, escalated_to_agent, conversation_tags.contained, conversation_tags.containment]
    filters:
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.channel: Chat
      conversation_tags.environment: Prod
    sorts: [conversation_tags.chat_target, conversation_tags.count_conversation desc]
    subtotals: [conversation_tags.chat_target]
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
    series_labels: {}
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
    series_text_format:
      escalated_to_contact_us:
        fg_color: "#B31412"
      escalated_to_agent:
        fg_color: "#B31412"
      conversation_tags.contained:
        fg_color: "#0F21EB"
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    series_colors:
      conversation_tags.count_conversation: "#0F21EB"
      conversation_tags.contained: "#6CBFC0"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_dropoff: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
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
    listen:
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Language: conversation_tags.language
    row: 25
    col: 12
    width: 12
    height: 13
  - name: Chat Escalated Queue Breakdown
    title: Chat Escalated Queue Breakdown
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_grid
    fields: [conversation_tags.chat_target, conversation_tags.routing_queue_nlok,
      conversation_tags.count_conversation, conversation_tags.contained]
    filters:
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.channel: Chat
      conversation_tags.call_resolution: Escalation,Escalation Default Queue
      conversation_tags.environment: Prod
    sorts: [conversation_tags.chat_target, conversation_tags.count_conversation desc]
    subtotals: [conversation_tags.chat_target]
    limit: 500
    column_limit: 50
    total: true
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
      conversation_tags.count_conversation: Escalated Chats
      conversation_tags.routing_queue_nlok: Agent Queue
    series_cell_visualizations:
      conversation_tags.count_conversation:
        is_active: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    y_axes: [{label: '', orientation: left, series: [{axisId: conversation_tags.count_conversation,
            id: conversation_tags.count_conversation, name: Escalated Chats}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      conversation_tags.count_conversation: "#B31412"
      conversation_tags.contained: "#6CBFC0"
    show_dropoff: false
    hidden_fields: [conversation_tags.contained]
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
    listen:
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Language: conversation_tags.language
    row: 13
    col: 9
    width: 8
    height: 12
  - name: Chat Intents
    title: Chat Intents
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_grid
    fields: [conversation_tags.solution_type_chat, conversation_tags.intent, conversation_tags.count_conversation,
      conversation_tags.contained, conversation_tags.containment]
    filters:
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.channel: Chat
      conversation_tags.chat_target: Chatbot
      conversation_tags.environment: Prod
    sorts: [conversation_tags.solution_type_chat, conversation_tags.count_conversation
        desc]
    subtotals: [conversation_tags.solution_type_chat]
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
    series_labels: {}
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
    series_text_format:
      conversation_tags.contained:
        fg_color: "#0F21EB"
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    series_colors:
      conversation_tags.count_conversation: "#0F21EB"
      conversation_tags.contained: "#6CBFC0"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_dropoff: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
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
    listen:
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Language: conversation_tags.language
    row: 0
    col: 17
    width: 7
    height: 23
  - name: Chat Summary
    title: Chat Summary
    model: dialogflow_cx_eu
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
    height: 11
  - name: Chatbot Summary
    title: Chatbot Summary
    model: dialogflow_cx_eu
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
    row: 11
    col: 0
    width: 3
    height: 12
  - name: Chatbot Traffic by Country
    title: Chatbot Traffic by Country
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_grid
    fields: [conversation_tags.country, conversation_tags.count_conversation, conversation_tags.chat_page]
    pivots: [conversation_tags.chat_page]
    filters:
      conversation_tags.channel: Chat
      conversation_tags.created_date: 1 days
    sorts: [conversation_tags.chat_page, conversation_tags.count_conversation desc
        0]
    limit: 500
    column_limit: 50
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
    series_labels:
      conversation_tags.country: Country
      conversation_tags.count_conversation: Chats
    series_cell_visualizations:
      conversation_tags.count_conversation:
        is_active: false
    series_text_format:
      conversation_tags.country:
        align: right
      conversation_tags.count_conversation:
        align: center
      conversation_tags.chat_page:
        align: center
    header_font_color: "#764BEA"
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: bottom, series: [{axisId: conversation_tags.count_conversation,
            id: conversation_tags.count_conversation, name: Conversation Count}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
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
    stacking: normal
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
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Language: conversation_tags.language
    row: 27
    col: 0
    width: 12
    height: 15
  - name: Chatbot Traffic by Language
    title: Chatbot Traffic by Language
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_grid
    fields: [conversation_tags.count_conversation, conversation_tags.chat_page, conversation_tags.language]
    pivots: [conversation_tags.chat_page]
    filters:
      conversation_tags.channel: Chat
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.environment: Prod,Other
    sorts: [conversation_tags.chat_page, conversation_tags.count_conversation desc
        0]
    limit: 500
    column_limit: 50
    total: true
    row_total: right
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
    series_labels:
      conversation_tags.country: Country
      conversation_tags.count_conversation: Chats
    series_cell_visualizations:
      conversation_tags.count_conversation:
        is_active: false
    series_text_format:
      conversation_tags.count_conversation:
        align: center
      conversation_tags.chat_page:
        align: center
    header_font_color: "#764BEA"
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: bottom, series: [{axisId: conversation_tags.count_conversation,
            id: conversation_tags.count_conversation, name: Conversation Count}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
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
    stacking: normal
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
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Language: conversation_tags.language
    row: 38
    col: 12
    width: 12
    height: 7
  - name: Chat - Missing Parameters
    title: Chat - Missing Parameters
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_line
    fields: [conversation_tags.count_conversation, conversation_tags.created_date]
    fill_fields: [conversation_tags.created_date]
    filters:
      conversation_tags.entry_missing: 'Yes'
      conversation_tags.created_date: 14 day ago for 14 day
    sorts: [conversation_tags.created_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      conversation_tags.count_conversation: "#B31412"
    defaults_version: 1
    listen: {}
    row: 0
    col: 3
    width: 14
    height: 6
  - name: Wait Time Distribution
    title: Wait Time Distribution
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_grid
    fields: [conversation_status.count_session, conversation_tags.wait_group, conversation_tags.routing_queue_nlok]
    filters:
      conversation_tags.created_date: 2024/02/29
      conversation_tags.wait_group: 'Group 1: 0-5 Mins,Group 2: 5-10 Mins,Group 3:
        10-20 Mins,Group 4: 20-30 Mins,Group 5: 30+ Mins'
    sorts: [conversation_tags.wait_group]
    subtotals: [conversation_tags.wait_group]
    limit: 500
    column_limit: 50
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Language: conversation_tags.language
    row: 6
    col: 3
    width: 6
    height: 21
  - name: Wait Option Response
    title: Wait Option Response
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_column
    fields: [conversation_status.count_session, conversation_tags.wait_time_choice,
      conversation_tags.contained]
    fill_fields: [conversation_tags.wait_time_choice]
    filters:
      conversation_tags.created_date: 2024/02/29
      conversation_tags.wait_group: 'Group 5: 30+ Mins'
    sorts: [conversation_status.count_session desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hidden_fields: [conversation_tags.contained]
    show_null_points: true
    interpolation: linear
    listen:
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Language: conversation_tags.language
    row: 6
    col: 9
    width: 8
    height: 7
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 1 day ago for 1 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: dialogflow_cx_eu
    explore: conversation_status
    listens_to_filters: []
    field: conversation_tags.created_date
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
    model: dialogflow_cx_eu
    explore: conversation_status
    listens_to_filters: []
    field: conversation_tags.environment
  - name: Language
    title: Language
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: dialogflow_cx_eu
    explore: conversation_status
    listens_to_filters: []
    field: conversation_tags.language
