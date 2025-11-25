---
- dashboard: virtual_retention_agent
  title: Virtual Retention Agent EU
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  filters_bar_collapsed: true
  preferred_slug: GlFsmo5tgQCMgY5PRsbNe5
  elements:
  - name: Account Roles
    title: Account Roles
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_pie
    fields: [parameters.parameter_name, parameters.parameter_value, parameters.session_count]
    filters:
      parameters.parameter_name: sub^_info-account^_roles%
      conversation_tags.customer_retention_flow: 'Yes'
      conversation_tags.created_date: 7 days
      conversation_tags.channel: Chat
    sorts: [parameters.session_count desc]
    limit: 5000
    column_limit: 50
    value_labels: legend
    label_type: labPer
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
      parameters.parameter_value: Account Role
    series_cell_visualizations:
      parameters.session_count:
        is_active: true
    defaults_version: 1
    hidden_fields: [parameters.parameter_name]
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
    listen:
      Created Date: conversation_tags.created_date
      Channel: conversation_tags.channel
      Environment: conversation_tags.environment
      Retention Flow (Yes / No): conversation_tags.customer_retention_flow
    row: 0
    col: 19
    width: 5
    height: 6
  - name: Add-Ons
    title: Add-Ons
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_pie
    fields: [parameters.parameter_value, parameters.session_count]
    filters:
      parameters.parameter_name: sub^_info-addons%
      parameters.receive_timestamp_date: 1 day ago for 1 day
    sorts: [parameters.session_count desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: length(${parameters.parameter_value})
      label: Parameter Value Length
      value_format:
      value_format_name:
      dimension: parameter_value_length
      _kind_hint: dimension
      _type_hint: number
    value_labels: legend
    label_type: labPer
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
      parameters.parameter_value: Add Ons
    series_cell_visualizations:
      parameters.session_count:
        is_active: true
    defaults_version: 1
    hidden_fields: []
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
    listen:
      Created Date: conversation_tags.created_date
      Channel: conversation_tags.channel
      Environment: conversation_tags.environment
      Retention Flow (Yes / No): conversation_tags.customer_retention_flow
    row: 6
    col: 0
    width: 8
    height: 6
  - name: Auto Renew
    title: Auto Renew
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_pie
    fields: [parameters.parameter_name, parameters.parameter_value, parameters.session_count]
    filters:
      parameters.parameter_name: sub^_info-is^_autorenew^_enabled%
      parameters.receive_timestamp_date: 1 day ago for 1 day
    sorts: [parameters.session_count desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: length(${parameters.parameter_value})
      label: Parameter Value Length
      value_format:
      value_format_name:
      dimension: parameter_value_length
      _kind_hint: dimension
      _type_hint: number
    value_labels: legend
    label_type: labPer
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
      parameters.parameter_value: Auto Renew ON
    series_cell_visualizations:
      parameters.session_count:
        is_active: true
    defaults_version: 1
    hidden_fields: [parameters.parameter_name]
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
    listen:
      Created Date: conversation_tags.created_date
      Channel: conversation_tags.channel
      Environment: conversation_tags.environment
      Retention Flow (Yes / No): conversation_tags.customer_retention_flow
    row: 6
    col: 19
    width: 5
    height: 6
  - name: Billing Cycle
    title: Billing Cycle
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_pie
    fields: [parameters.parameter_value, parameters.session_count]
    filters:
      parameters.parameter_name: sub^_info-billing^_cycle%
      parameters.receive_timestamp_date: 1 day ago for 1 day
    sorts: [parameters.session_count desc]
    limit: 5000
    column_limit: 50
    value_labels: legend
    label_type: labPer
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
      parameters.parameter_value: Billing Cycle
    series_cell_visualizations:
      parameters.session_count:
        is_active: true
    defaults_version: 1
    hidden_fields: []
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
    listen:
      Created Date: conversation_tags.created_date
      Channel: conversation_tags.channel
      Environment: conversation_tags.environment
      Retention Flow (Yes / No): conversation_tags.customer_retention_flow
    row: 0
    col: 8
    width: 4
    height: 6
  - name: Cancel Refund Reason
    title: Cancel Refund Reason
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_pie
    fields: [conversation_tags.count_conversation, parameters.parameter_value]
    filters:
      conversation_tags.created_date: 7 day ago for 7 day
      parameters.parameter_name: '"cancel_refund_cust_reason"'
      conversation_tags.customer_retention_flow: 'Yes'
      conversation_tags.channel: Chat
    sorts: [conversation_tags.count_conversation desc]
    limit: 500
    column_limit: 50
    total: true
    value_labels: legend
    label_type: labPer
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
    interpolation: step
    y_axes: [{label: '', orientation: left, series: [{axisId: wrong_product - conversation_tags.count_conversation,
            id: wrong_product - conversation_tags.count_conversation, name: wrong_product},
          {axisId: unknown - conversation_tags.count_conversation, id: unknown - conversation_tags.count_conversation,
            name: unknown}, {axisId: switch_competitor - conversation_tags.count_conversation,
            id: switch_competitor - conversation_tags.count_conversation, name: switch_competitor},
          {axisId: product_errors - conversation_tags.count_conversation, id: product_errors
              - conversation_tags.count_conversation, name: product_errors}, {axisId: no_longer_needed
              - conversation_tags.count_conversation, id: no_longer_needed - conversation_tags.count_conversation,
            name: no_longer_needed}, {axisId: multiple_purchase - conversation_tags.count_conversation,
            id: multiple_purchase - conversation_tags.count_conversation, name: multiple_purchase},
          {axisId: high_price - conversation_tags.count_conversation, id: high_price
              - conversation_tags.count_conversation, name: high_price}, {axisId: deceased_customer
              - conversation_tags.count_conversation, id: deceased_customer - conversation_tags.count_conversation,
            name: deceased_customer}, {axisId: complaint_support - conversation_tags.count_conversation,
            id: complaint_support - conversation_tags.count_conversation, name: complaint_support},
          {axisId: complaint_product - conversation_tags.count_conversation, id: complaint_product
              - conversation_tags.count_conversation, name: complaint_product}, {
            axisId: ar_questions - conversation_tags.count_conversation, id: ar_questions
              - conversation_tags.count_conversation, name: ar_questions}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Created Date: conversation_tags.created_date
      Channel: conversation_tags.channel
      Environment: conversation_tags.environment
      Retention Flow (Yes / No): conversation_tags.customer_retention_flow
    row: 0
    col: 0
    width: 8
    height: 6
  - name: Estimated Renewal Price
    title: Estimated Renewal Price
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_pie
    fields: [parameters.session_count, conversation_tags.estimated_renewal_price_bucket]
    filters:
      parameters.parameter_name: sub^_info-estimated^_renewal^_price%
      parameters.receive_timestamp_date: 1 day ago for 1 day
    sorts: [parameters.session_count desc 0]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: length(${parameters.parameter_value})
      label: Parameter Value Length
      value_format:
      value_format_name:
      dimension: parameter_value_length
      _kind_hint: dimension
      _type_hint: number
    value_labels: legend
    label_type: labPer
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
      parameters.parameter_value: Renewal Price
    series_cell_visualizations:
      parameters.session_count:
        is_active: true
    defaults_version: 1
    hidden_fields: []
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
    listen:
      Created Date: conversation_tags.created_date
      Channel: conversation_tags.channel
      Environment: conversation_tags.environment
      Retention Flow (Yes / No): conversation_tags.customer_retention_flow
    row: 12
    col: 0
    width: 12
    height: 8
  - name: ITPS
    title: ITPS
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_pie
    fields: [parameters.parameter_name, parameters.parameter_value, parameters.session_count]
    filters:
      parameters.parameter_name: sub^_info-is^_itps%
      parameters.receive_timestamp_date: 1 day ago for 1 day
    sorts: [parameters.session_count desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: length(${parameters.parameter_value})
      label: Parameter Value Length
      value_format:
      value_format_name:
      dimension: parameter_value_length
      _kind_hint: dimension
      _type_hint: number
    value_labels: legend
    label_type: labPer
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
      parameters.parameter_value: ITPS
    series_cell_visualizations:
      parameters.session_count:
        is_active: true
    defaults_version: 1
    hidden_fields: [parameters.parameter_name]
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
    listen:
      Created Date: conversation_tags.created_date
      Channel: conversation_tags.channel
      Environment: conversation_tags.environment
      Retention Flow (Yes / No): conversation_tags.customer_retention_flow
    row: 6
    col: 8
    width: 4
    height: 6
  - name: Next Renewal Date
    title: Next Renewal Date
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_grid
    fields: [conversation_tags.intent, parameters.parameter_value, parameters.session_count]
    filters:
      parameters.parameter_name: sub^_info-next^_renewal^_date%
      parameters.receive_timestamp_date: 1 day ago for 1 day
    sorts: [parameters.session_count desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: length(${parameters.parameter_value})
      label: Parameter Value Length
      value_format:
      value_format_name:
      dimension: parameter_value_length
      _kind_hint: dimension
      _type_hint: number
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
      parameters.parameter_value: Next Renewal
    series_cell_visualizations:
      parameters.session_count:
        is_active: true
    defaults_version: 1
    hidden_fields: []
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
    listen:
      Created Date: conversation_tags.created_date
      Channel: conversation_tags.channel
      Environment: conversation_tags.environment
      Retention Flow (Yes / No): conversation_tags.customer_retention_flow
    row: 20
    col: 16
    width: 8
    height: 6
  - name: Product
    title: Product
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_grid
    fields: [parameters.parameter_name, parameters.parameter_value, parameters.session_count]
    filters:
      parameters.parameter_name: sub^_info-product^_name%
      parameters.receive_timestamp_date: 1 day ago for 1 day
    sorts: [parameters.session_count desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: length(${parameters.parameter_value})
      label: Parameter Value Length
      value_format:
      value_format_name:
      dimension: parameter_value_length
      _kind_hint: dimension
      _type_hint: number
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
      parameters.parameter_value: Product
    series_cell_visualizations:
      parameters.session_count:
        is_active: true
    defaults_version: 1
    hidden_fields: [parameters.parameter_name]
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
    listen:
      Created Date: conversation_tags.created_date
      Channel: conversation_tags.channel
      Environment: conversation_tags.environment
      Retention Flow (Yes / No): conversation_tags.customer_retention_flow
    row: 20
    col: 0
    width: 8
    height: 6
  - name: Promo Code
    title: Promo Code
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_grid
    fields: [parameters.parameter_name, parameters.parameter_value, parameters.session_count]
    filters:
      parameters.parameter_name: sub^_info-promo^_code%
      parameters.receive_timestamp_date: 1 day ago for 1 day
    sorts: [parameters.session_count desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: length(${parameters.parameter_value})
      label: Parameter Value Length
      value_format:
      value_format_name:
      dimension: parameter_value_length
      _kind_hint: dimension
      _type_hint: number
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
      parameters.parameter_value: Promo Code
    series_cell_visualizations:
      parameters.session_count:
        is_active: true
    defaults_version: 1
    hidden_fields: [parameters.parameter_name]
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
    listen:
      Created Date: conversation_tags.created_date
      Channel: conversation_tags.channel
      Environment: conversation_tags.environment
      Retention Flow (Yes / No): conversation_tags.customer_retention_flow
    row: 20
    col: 8
    width: 8
    height: 6
  - name: Purchase Price
    title: Purchase Price
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_pie
    fields: [parameters.session_count, conversation_tags.purchase_price_bucket]
    filters:
      parameters.parameter_name: sub^_info-purchase^_price%
      parameters.receive_timestamp_date: 1 day ago for 1 day
    sorts: [parameters.session_count desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: length(${parameters.parameter_value})
      label: Parameter Value Length
      value_format:
      value_format_name:
      dimension: parameter_value_length
      _kind_hint: dimension
      _type_hint: number
    value_labels: legend
    label_type: labPer
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
      parameters.parameter_value: Purchase Price
    series_cell_visualizations:
      parameters.session_count:
        is_active: true
    defaults_version: 1
    hidden_fields: []
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
    listen:
      Created Date: conversation_tags.created_date
      Channel: conversation_tags.channel
      Environment: conversation_tags.environment
      Retention Flow (Yes / No): conversation_tags.customer_retention_flow
    row: 12
    col: 12
    width: 12
    height: 8
  - name: Order Confirmation
    title: Order Confirmation
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_pie
    fields: [conversation_tags.count_conversation, conversation_tags.vra_order_confirmed]
    filters:
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.vra_order_confirmed: "-Other"
    sorts: [conversation_tags.count_conversation desc 0]
    limit: 500
    column_limit: 50
    value_labels: labels
    label_type: labVal
    inner_radius: 50
    start_angle: 270
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Channel: conversation_tags.channel
      Environment: conversation_tags.environment
      Retention Flow (Yes / No): conversation_tags.customer_retention_flow
    row: 26
    col: 8
    width: 8
    height: 6
  - name: Retained
    title: Retained
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_pie
    fields: [conversation_tags.count_conversation, conversation_tags.vra_retained]
    filters:
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.vra_retained: "-Other"
    sorts: [conversation_tags.count_conversation desc 0]
    limit: 500
    column_limit: 50
    value_labels: labels
    label_type: labVal
    inner_radius: 50
    start_angle: 270
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Channel: conversation_tags.channel
      Environment: conversation_tags.environment
      Retention Flow (Yes / No): conversation_tags.customer_retention_flow
    row: 26
    col: 0
    width: 8
    height: 6
  - name: T Phase
    title: T Phase
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_pie
    fields: [conversation_tags.count_conversation, conversation_tags.vra_tphase]
    fill_fields: [conversation_tags.vra_tphase]
    filters:
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.channel: Chat
      conversation_tags.environment: Prod
      conversation_tags.customer_retention_flow: 'Yes'
    sorts: [conversation_tags.count_conversation desc 0]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Channel: conversation_tags.channel
      Environment: conversation_tags.environment
      Retention Flow (Yes / No): conversation_tags.customer_retention_flow
    row: 0
    col: 12
    width: 7
    height: 6
  - name: Last Renewed Date
    title: Last Renewed Date
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_pie
    fields: [parameters.session_count, conversation_tags.days_since_last_renewed_grouped]
    filters:
      parameters.parameter_name: sub^_info-last^_renewed^_date%
      parameters.receive_timestamp_date: 30 day ago for 30 day
      conversation_tags.created_date: 7 day ago for 7 day
      conversation_tags.channel: Chat
      conversation_tags.environment: Prod
    sorts: [conversation_tags.days_since_last_renewed_grouped]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: length(${parameters.parameter_value})
      label: Parameter Value Length
      value_format:
      value_format_name:
      dimension: parameter_value_length
      _kind_hint: dimension
      _type_hint: number
    value_labels: legend
    label_type: labPer
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
      parameters.parameter_value: Last Renewed
    series_cell_visualizations:
      parameters.session_count:
        is_active: true
    defaults_version: 1
    hidden_fields: []
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
    listen:
      Retention Flow (Yes / No): conversation_tags.customer_retention_flow
    row: 6
    col: 12
    width: 7
    height: 6
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 7 day ago for 7 day
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
  - name: Channel
    title: Channel
    type: field_filter
    default_value: Voice
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: dialogflow_cx_eu
    explore: conversation_status
    listens_to_filters: []
    field: conversation_tags.channel
  - name: Environment
    title: Environment
    type: field_filter
    default_value: Prod
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: dialogflow_cx_eu
    explore: conversation_status
    listens_to_filters: []
    field: conversation_tags.environment
  - name: Retention Flow (Yes / No)
    title: Retention Flow (Yes / No)
    type: field_filter
    default_value: 'Yes'
    allow_multiple_values: true
    required: true
    ui_config:
      type: button_toggles
      display: inline
    model: dialogflow_cx_eu
    explore: conversation_status
    listens_to_filters: []
    field: conversation_tags.customer_retention_flow
