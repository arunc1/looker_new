---
- dashboard: contact_summary_us
  title: Contact Summary US
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  filters_bar_collapsed: true
  preferred_slug: OcgLqXLn8MhVd0eQ2cRFOn
  elements:
  - name: Summary
    title: Summary
    model: dialogflow_cx_us
    explore: conversation_status
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [conversation_tags.count_conversation, conversation_tags.contained, conversation_tags.containment]
    filters:
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.channel: Voice
      conversation_tags.session_id: "-%-0000-%"
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
    title_override_conversation_tags.count_conversation: Total Contacts
    title_placement_conversation_tags.count_conversation: above
    value_format_conversation_tags.count_conversation: ''
    style_conversation_tags.contained: "#764BEA"
    show_title_conversation_tags.contained: true
    title_override_conversation_tags.contained: Contained
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
      Channel: conversation_tags.channel
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Remove Test Chats: conversation_tags.session_id
      Brand: conversation_tags.brand
    row: 3
    col: 0
    width: 3
    height: 9
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Contact Summary","color":"hsl(210,
      70%, 61%)"}],"align":"center"},{"type":"p","children":[{"text":""}],"id":1695336878723},{"type":"h3","id":1695336878100,"children":[{"text":"This
      dashboard contains contact data for all Brands & Channels that are migrated
      to CCAI Platform (Norton, Lifelock, Avast, AVG, Empower). "},{"text":"To view
      Voice or Chat specific data, use the Channel Filter. ","bold":true},{"text":"See
      explanation below the graphs section for what the graphs mean"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 24
    height: 3
  - name: Contact Resolution - Automation
    title: Contact Resolution - Automation
    model: dialogflow_cx_us
    explore: conversation_status
    type: looker_pie
    fields: [conversation_tags.count_conversation, conversation_tags.call_resolution]
    filters:
      conversation_tags.created_date: 1 week ago for 1 week
      conversation_tags.call_flow: Automation Eligible
      conversation_tags.session_id: "-%-0000-%"
    sorts: [conversation_tags.count_conversation desc]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression:
      label: Basic Call Flow
      value_format:
      value_format_name:
      based_on: conversation_call_id.count
      _kind_hint: measure
      measure: basic_call_flow
      type: count
      _type_hint: number
      filters:
        conversation_tags.call_flow: Basic
    - category: measure
      expression:
      label: Automation Calls
      value_format:
      value_format_name:
      based_on: conversation_call_id.count
      _kind_hint: measure
      measure: automation_calls
      type: count
      _type_hint: number
      filters:
        conversation_tags.automation_call: 'Yes'
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_colors:
      Escalation: "#B31412"
      User Hangup: "#6CBFC0"
      Escalation Default Queue: "#B31412"
      Disconnect: "#0F21EB"
    series_labels: {}
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
    defaults_version: 1
    hidden_pivots: {}
    font_size: 12
    listen:
      Channel: conversation_tags.channel
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Remove Test Chats: conversation_tags.session_id
      Brand: conversation_tags.brand
    row: 29
    col: 4
    width: 4
    height: 9
  - name: Contact Breakdown (non-Automation eligible)
    title: Contact Breakdown (non-Automation eligible)
    model: dialogflow_cx_us
    explore: conversation_status
    type: looker_column
    fields: [conversation_tags.count_conversation, conversation_tags.call_flow, conversation_tags.total_escalated_calls]
    filters:
      conversation_tags.created_date: 1 week ago for 1 week
      conversation_tags.channel: Voice
      conversation_tags.session_id: "-%-0000-%"
      conversation_tags.call_flow: "-Automation Eligible"
    sorts: [conversation_tags.count_conversation desc]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression:
      label: Basic Call Flow
      value_format:
      value_format_name:
      based_on: conversation_call_id.count
      _kind_hint: measure
      measure: basic_call_flow
      type: count
      _type_hint: number
      filters:
        conversation_tags.call_flow: Basic
    - category: measure
      expression:
      label: Automation Calls
      value_format:
      value_format_name:
      based_on: conversation_call_id.count
      _kind_hint: measure
      measure: automation_calls
      type: count
      _type_hint: number
      filters:
        conversation_tags.automation_call: 'Yes'
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
    y_axes: [{label: '', orientation: left, series: [{axisId: conversation_tags.count_conversation,
            id: conversation_tags.count_conversation, name: Conversation Count}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    font_size: '12'
    series_colors:
      conversation_tags.count_conversation: "#0F21EB"
      conversation_tags.total_escalated_calls: "#B31412"
    series_labels:
      conversation_tags.total_escalated_calls: Escalated
      conversation_tags.count_conversation: Contacts
    show_dropoff: true
    chart_type: Pie
    arm_length: 25
    arm_weight: 50
    spinner_length: 100
    spinner_weight: 50
    angle: 90
    cutout: 50
    range_x: 1
    range_y: 1
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
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    up_color: false
    down_color: false
    total_color: false
    show_null_points: true
    interpolation: linear
    listen:
      Channel: conversation_tags.channel
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Remove Test Chats: conversation_tags.session_id
      Brand: conversation_tags.brand
    row: 3
    col: 14
    width: 10
    height: 9
  - name: Contacts by Brand - Automation
    title: Contacts by Brand - Automation
    model: dialogflow_cx_us
    explore: conversation_status
    type: looker_column
    fields: [conversation_tags.brand, conversation_tags.count_conversation, conversation_tags.contained,
      conversation_tags.containment, conversation_tags.ghost_call]
    filters:
      conversation_tags.created_date: 1 weeks ago for 1 weeks
      conversation_tags.channel: Voice
      conversation_tags.call_flow: Automation Eligible
      conversation_tags.brand: Norton,LifeLock,Avast,AVG
      conversation_status.session_id: "-%-0000-%"
    sorts: [conversation_tags.brand]
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
    series_labels:
      conversation_tags.count_conversation: Contacts
      conversation_tags.contained: Contained
    column_spacing_ratio: 0.1
    column_group_spacing_ratio: 0
    show_dropoff: true
    hidden_fields: [conversation_tags.ghost_call, conversation_tags.containment]
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
    value_labels: legend
    label_type: labPer
    listen:
      Channel: conversation_tags.channel
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Remove Test Chats: conversation_tags.session_id
      Brand: conversation_tags.brand
    row: 18
    col: 15
    width: 9
    height: 11
  - name: Summary - Automation
    title: Summary - Automation
    model: dialogflow_cx_us
    explore: conversation_status
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [conversation_tags.count_conversation, conversation_tags.contained, conversation_tags.containment]
    filters:
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.channel: Voice
      conversation_tags.call_flow: Automation Eligible
      conversation_tags.session_id: "-%-0000-%"
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
    title_override_conversation_tags.count_conversation: Total Contacts
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
      Channel: conversation_tags.channel
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Remove Test Chats: conversation_tags.session_id
      Brand: conversation_tags.brand
    row: 18
    col: 0
    width: 3
    height: 11
  - name: Contact Resolution - Other
    title: Contact Resolution - Other
    model: dialogflow_cx_us
    explore: conversation_status
    type: looker_pie
    fields: [conversation_tags.count_conversation, conversation_tags.call_resolution]
    fill_fields: [conversation_tags.call_resolution]
    filters:
      conversation_tags.created_date: 1 week ago for 1 week
      conversation_tags.call_flow: "-Automation Eligible"
      conversation_tags.session_id: "-%-0000-%"
      conversation_tags.environment: "-Dev"
      conversations_agent_environment.environment_prod: Agent-CCAI-IVA
    sorts: [conversation_tags.count_conversation desc]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression:
      label: Basic Call Flow
      value_format:
      value_format_name:
      based_on: conversation_call_id.count
      _kind_hint: measure
      measure: basic_call_flow
      type: count
      _type_hint: number
      filters:
        conversation_tags.call_flow: Basic
    - category: measure
      expression:
      label: Automation Calls
      value_format:
      value_format_name:
      based_on: conversation_call_id.count
      _kind_hint: measure
      measure: automation_calls
      type: count
      _type_hint: number
      filters:
        conversation_tags.automation_call: 'Yes'
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_colors:
      Escalation: "#B31412"
      User Hangup: "#6CBFC0"
      Escalation Default Queue: "#B31412"
      Disconnect: "#0F21EB"
    series_labels: {}
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
    defaults_version: 1
    hidden_pivots: {}
    font_size: 12
    listen:
      Channel: conversation_tags.channel
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Remove Test Chats: conversation_tags.session_id
      Brand: conversation_tags.brand
    row: 29
    col: 0
    width: 4
    height: 9
  - name: Contact Channel
    title: Contact Channel
    model: dialogflow_cx_us
    explore: conversation_status
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [calls, chats]
    filters:
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.session_id: "-%-0000-%"
      conversation_tags.channel: "-Other"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      label: Calls
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: calls
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.channel: Voice
    - category: measure
      label: Chats
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: chats
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.channel: Chat
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    font_size_main: ''
    orientation: horizontal
    dividers: false
    style_calls: "#764BEA"
    show_title_calls: true
    title_placement_calls: below
    value_format_calls: ''
    style_chats: "#764BEA"
    show_title_chats: true
    title_placement_chats: below
    value_format_chats: ''
    show_comparison_chats: false
    show_value_labels: true
    font_size: 16
    hide_legend: false
    series_colors:
      Voice: "#BFACF7"
      Chat: "#6CBFC0"
    value_labels: legend
    label_type: labPer
    inner_radius: 50
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
      Channel: conversation_tags.channel
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Remove Test Chats: conversation_tags.session_id
      Brand: conversation_tags.brand
    row: 18
    col: 9
    width: 6
    height: 5
  - name: Automation Eligible
    title: Automation Eligible
    model: dialogflow_cx_us
    explore: conversation_status
    type: marketplace_viz_radial_gauge::radial_gauge-marketplace
    fields: [conversation_tags.count_conversation, automation_eligible]
    filters:
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.channel: Voice,Chat
      conversation_tags.session_id: "-%-0000-%"
      conversation_tags.environment: "-Dev"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      label: Automation Eligible
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: automation_eligible
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.call_flow: Automation Eligible
    - category: table_calculation
      expression: "${automation_eligible}/${conversation_tags.count_conversation}"
      label: Automation Eligible %
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: automation_eligible_1
      _type_hint: number
    hidden_fields: [conversation_tags.count_conversation, automation_eligible]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    arm_length: 0
    arm_weight: 0
    spinner_length: 95
    spinner_weight: 55
    target_length: 15
    target_gap: 15
    target_weight: 50
    value_label_type: value
    value_label_font: 12
    value_label_padding: 27
    label_font_size: 0
    spinner_type: needle
    fill_color: "#47c95c"
    background_color: "#d13f3f"
    spinner_color: "#0F21EB"
    range_color: "#764BEA"
    gauge_fill_type: progress
    fill_colors: ["#6CBFC0", "#0F21EB", "#764BEA", "#BFACF7", "#B0DFDF", "#B31412",
      "#625FF6", "#AB92F1", "#A1D8D8", "#3B1DC6", "#b5EAd7", "#c7ceea"]
    angle: 90
    cutout: 50
    range_x: 1
    range_y: 1
    target_label_padding: 1.49
    custom_color_enabled: true
    custom_color: "#6CBFC0"
    show_single_value_title: true
    single_value_title: Automation Eligible Contacts
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: greater than, value: 0, background_color: "#A1D8D8",
        font_color: "#764BEA", color_application: {collection_id: gen, palette_id: gen-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    font_size_main: '15'
    orientation: vertical
    style_conversation_tags.count_conversation: "#0F21EB"
    show_title_conversation_tags.count_conversation: true
    title_override_conversation_tags.count_conversation: Total Contacts
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
      Channel: conversation_tags.channel
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Remove Test Chats: conversation_tags.session_id
      Brand: conversation_tags.brand
    row: 18
    col: 3
    width: 6
    height: 5
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Summary","color":"hsl(217, 77%,
      60%)"}],"align":"center"},{"type":"p","children":[{"text":""}],"id":"vctzk"},{"type":"h3","id":"hjyt8","children":[{"text":"The
      "},{"text":"Summary","bold":true,"color":"hsl(244, 100%, 50%)"},{"text":" numbers
      show ALL contacts passing through the DialogFlow platform - whether they interact
      with the VA or not. "}]},{"type":"p","children":[{"text":""}],"id":"dqy36"},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"For
      Voice - This would "},{"text":"include","bold":true,"color":"hsl(100, 57%, 33%)"},{"text":"
      "}],"id":"5dp39"},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"Calls
      that go through Ava Experience"}],"id":"8ent9"}],"id":"uh2g1"},{"type":"li","children":[{"type":"lic","id":"jekyq","children":[{"text":"Calls
      that will "},{"text":"NOT","color":"hsl(0, 100%, 30%)"},{"text":" go through
      Ava Experience"}]},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","id":"pou6z","children":[{"text":"Examples:
      IVR to an agent, Extension dialing numbers, sales calls etc. "}]}],"id":"mewwt"}],"id":"gl20i"}],"id":"0qy31"}],"id":"jqual"}],"id":"lojo1"}],"id":"lee84"},{"type":"p","children":[{"text":""}],"id":"oq4es"},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"For
      Chat - This would "},{"text":"include","bold":true,"color":"hsl(100, 57%, 33%)"},{"text":"
      "}],"id":"z6m8s"},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","id":"m2939","children":[{"text":"Chats
      that go through the Kate experience"}]}],"id":"1kkbq"},{"type":"li","children":[{"type":"lic","id":"adcou","children":[{"text":"Chats
      that will "},{"text":"NOT","color":"hsl(0, 100%, 30%)"},{"text":" go through
      Kate Experience"}]},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","id":"0ynll","children":[{"text":"Examples:
      LifeLock Mobile App chats, AROOD, Evil Kate Escalations to contact us that bypass
      Good Kate etc."}]}],"id":"z916y"}],"id":"g921e"}],"id":"d6odi"}],"id":"639bq"}],"id":"gg7nz"}],"id":"k7p7m"},{"type":"p","children":[{"text":""}],"id":"8hvo7"},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"The
      containment in this section includes Ghosts in Non Automation Paths and hence
      "},{"text":"can be higher","underline":true},{"text":" than the containment
      in the "},{"text":"Summary Automation","bold":true},{"text":" section"}],"id":"51pox"}],"id":"wdits"}],"id":"femas"}]'
    rich_content_json: '{"format":"slate"}'
    row: 41
    col: 0
    width: 6
    height: 8
  - name: " (Copy 2)"
    type: text
    title_text: " (Copy 2)"
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Automation Eligible %","color":"hsl(217,
      77%, 60%)"}],"align":"center"},{"type":"p","children":[{"text":""}],"id":"vctzk"},{"type":"h3","children":[{"text":"This
      is the "},{"text":"% of Total contacts","bold":true},{"text":" that receive
      the Ava or Kate experience. "}],"id":"627gf"}]'
    rich_content_json: '{"format":"slate"}'
    row: 45
    col: 6
    width: 6
    height: 4
  - name: " (Copy)"
    type: text
    title_text: " (Copy)"
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"The Graphs Explained","color":"hsl(210,
      70%, 61%)"}],"align":"center"},{"type":"p","children":[{"text":""}],"id":"889g5"},{"type":"h3","children":[{"text":"Below
      you will find an explanation of what the graphs / numbers mean and also some
      of the terms that are used. If you need additional information on anything reported
      in this dashboard, please reach out to "},{"text":"Arun Chandrasekar","bold":true,"color":"hsl(256,
      51%, 46%)"},{"text":" or "},{"text":"Erik Heyeck","bold":true,"color":"hsl(256,
      51%, 46%)"}],"id":"voanq","align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 38
    col: 0
    width: 24
    height: 3
  - name: " (Copy 4)"
    type: text
    title_text: " (Copy 4)"
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Summary Automation","color":"hsl(217,
      77%, 60%)"}],"align":"center"},{"type":"p","children":[{"text":""}],"id":"8ym3n"},{"type":"h3","children":[{"text":"The"},{"text":"
      ","bold":true},{"bold":true,"text":"Summary Automation","color":"hsl(244, 100%,
      50%)"},{"bold":true,"text":" "},{"text":"is limited to those contacts that receive
      the Ava and Kate experience and subsequently contained. This is a subset of
      the "},{"text":"Summary","bold":true}],"id":"627gf"}]'
    rich_content_json: '{"format":"slate"}'
    row: 41
    col: 6
    width: 6
    height: 4
  - name: " (Copy 5)"
    type: text
    title_text: " (Copy 5)"
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Contact Resolution","color":"hsl(217,
      77%, 60%)"}],"align":"center"},{"type":"p","children":[{"text":""}],"id":"vctzk"},{"type":"h3","id":"fuqoo","children":[{"text":"These
      are all the possible outcomes of a contact that reached DialogFlow."}]},{"type":"p","children":[{"text":""}],"id":"08bzl"},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"Esclation","bold":true,"color":"hsl(244,
      100%, 50%)"},{"text":" - Contacts escalated to a live agent"}],"id":"627gf"}],"id":"hf07w"},{"type":"li","children":[{"type":"lic","children":[{"text":"User
      Hangup","bold":true,"color":"hsl(244, 100%, 50%)"},{"text":" - Specific to Voice
      contacts. These calls were disconnected from the customer side"}],"id":"2a70w"}],"id":"ltiv1"},{"type":"li","children":[{"type":"lic","children":[{"text":"Disconnect","bold":true,"color":"hsl(244,
      100%, 50%)"},{"text":" - These contact sessions were terminated by DialogFlow
      - Either within the Ava/Kate experiences or outside"}],"id":"3bbhp"},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"Example:
      Customer was read a menu and asked to make a selection. After multiple attemps,
      the customer did not make a selection, the call is disconnected"}],"id":"kk9v2"}],"id":"1ag4h"}],"id":"d795i"}],"id":"3c59i"},{"type":"li","children":[{"type":"lic","children":[{"text":"Direct
      to Agent Chats","bold":true,"color":"hsl(244, 100%, 50%)"},{"text":" - Chats
      that bypass Kate experience and go direct to an agent."}],"id":"r6hvr"}],"id":"i53y3"}],"id":"71h2j"},{"type":"p","children":[{"text":""}],"id":"eb330"},{"type":"p","children":[{"text":"*Other","bold":true,"color":"hsl(0,
      93%, 34%)"},{"text":" ","color":"hsl(0, 93%, 34%)"},{"text":"is a category that
      is not correctly recognized in looker due to missing parameters that have either
      not been received from clients or have not been set in DialogFlow. These are
      constantly reviewed and will be eliminated over time"}],"id":"tekt3"}]'
    rich_content_json: '{"format":"slate"}'
    row: 41
    col: 18
    width: 6
    height: 8
  - name: " (Copy 3)"
    type: text
    title_text: " (Copy 3)"
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Contact Breakdown","color":"hsl(217,
      77%, 60%)"}],"align":"center"},{"type":"p","children":[{"text":""}],"id":"vctzk"},{"type":"h3","children":[{"text":"These
      are the various types of contacts that can be received by DialogFlow."}],"id":"nd6ab"},{"type":"p","children":[{"text":""}],"id":"f0mlv"},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"Automation
      Eligible","bold":true,"color":"hsl(244, 100%, 50%)"},{"text":" - This is the
      number of contacts that received the Ava or Kate experience. "}],"id":"627gf"}],"id":"hf07w"},{"type":"li","children":[{"type":"lic","children":[{"text":"Basic
      Call Flow","bold":true,"color":"hsl(244, 100%, 50%)"},{"text":" - Voice calls
      that receive an IVR menu. Some IVR options that result in the call being transferred
      to Ava are NOT included in this but included in "},{"text":"Automation Eligible","bold":true},{"text":"
      numbers"}],"id":"2a70w"}],"id":"ltiv1"},{"type":"li","children":[{"type":"lic","children":[{"text":"Sales
      Call Flow","bold":true,"color":"hsl(244, 100%, 50%)"},{"text":" - Calls that
      come in on Sales TFNs and receive Sales IVR Menu. Some IVR options that result
      in the call being transferred to Ava are NOT included in this but included in
      "},{"text":"Automation Eligible","bold":true},{"text":" numbers"}],"id":"3bbhp"}],"id":"3c59i"},{"type":"li","children":[{"type":"lic","children":[{"text":"Direct
      to Agent Chats","bold":true,"color":"hsl(244, 100%, 50%)"},{"text":" - Chats
      that bypass Kate experience and go direct to an agent."}],"id":"r6hvr"}],"id":"i53y3"}],"id":"gr63t"},{"type":"p","children":[{"text":""}],"id":"e6g35"},{"type":"p","id":"9s21h","children":[{"text":"*Other","bold":true,"color":"hsl(0,
      93%, 34%)"},{"text":" ","color":"hsl(0, 93%, 34%)"},{"text":"is a category that
      is not correctly recognized in looker due to missing parameters that have either
      not been received from clients or have not been set in DialogFlow. These are
      constantly reviewed and will be eliminated over time"}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 41
    col: 12
    width: 6
    height: 8
  - name: Automation Eligible % Voice
    title: Automation Eligible % Voice
    model: dialogflow_cx_us
    explore: conversation_status
    type: marketplace_viz_radial_gauge::radial_gauge-marketplace
    fields: [conversation_tags.count_conversation, automation_eligible]
    filters:
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.channel: Voice
      conversation_tags.session_id: "-%-0000-%"
      conversation_tags.environment: "-Dev"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      label: Automation Eligible
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: automation_eligible
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.call_flow: Automation Eligible
    - category: table_calculation
      expression: "${automation_eligible}/${conversation_tags.count_conversation}"
      label: Automation Eligible %
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: automation_eligible_1
      _type_hint: number
    hidden_fields: [conversation_tags.count_conversation, automation_eligible]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    arm_length: 0
    arm_weight: 0
    spinner_length: 95
    spinner_weight: 55
    target_length: 15
    target_gap: 15
    target_weight: 50
    value_label_type: value
    value_label_font: 12
    value_label_padding: 27
    label_font_size: 0
    spinner_type: needle
    fill_color: "#47c95c"
    background_color: "#d13f3f"
    spinner_color: "#0F21EB"
    range_color: "#764BEA"
    gauge_fill_type: progress
    fill_colors: ["#6CBFC0", "#0F21EB", "#764BEA", "#BFACF7", "#B0DFDF", "#B31412",
      "#625FF6", "#AB92F1", "#A1D8D8", "#3B1DC6", "#b5EAd7", "#c7ceea"]
    angle: 90
    cutout: 50
    range_x: 1
    range_y: 1
    target_label_padding: 1.49
    custom_color_enabled: true
    custom_color: "#6CBFC0"
    show_single_value_title: true
    single_value_title: Automation Eligible Contacts
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: greater than, value: 0, background_color: "#A1D8D8",
        font_color: "#764BEA", color_application: {collection_id: gen, palette_id: gen-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    font_size_main: '15'
    orientation: vertical
    style_conversation_tags.count_conversation: "#0F21EB"
    show_title_conversation_tags.count_conversation: true
    title_override_conversation_tags.count_conversation: Total Contacts
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
    note_state: expanded
    note_display: above
    note_text: Voice
    title_hidden: true
    listen:
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Remove Test Chats: conversation_tags.session_id
      Brand: conversation_tags.brand
    row: 23
    col: 3
    width: 3
    height: 6
  - name: Automation Eligible % Chat
    title: Automation Eligible % Chat
    model: dialogflow_cx_us
    explore: conversation_status
    type: marketplace_viz_radial_gauge::radial_gauge-marketplace
    fields: [conversation_tags.count_conversation, automation_eligible]
    filters:
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.channel: Chat
      conversation_tags.session_id: "-%-0000-%"
      conversation_tags.environment: "-Dev"
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      label: Automation Eligible
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: automation_eligible
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.call_flow: Automation Eligible
    - category: table_calculation
      expression: "${automation_eligible}/${conversation_tags.count_conversation}"
      label: Automation Eligible %
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: automation_eligible_1
      _type_hint: number
    hidden_fields: [conversation_tags.count_conversation, automation_eligible]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    arm_length: 0
    arm_weight: 0
    spinner_length: 95
    spinner_weight: 55
    target_length: 15
    target_gap: 15
    target_weight: 50
    value_label_type: value
    value_label_font: 12
    value_label_padding: 27
    label_font_size: 0
    spinner_type: needle
    fill_color: "#47c95c"
    background_color: "#d13f3f"
    spinner_color: "#0F21EB"
    range_color: "#764BEA"
    gauge_fill_type: progress
    fill_colors: ["#6CBFC0", "#0F21EB", "#764BEA", "#BFACF7", "#B0DFDF", "#B31412",
      "#625FF6", "#AB92F1", "#A1D8D8", "#3B1DC6", "#b5EAd7", "#c7ceea"]
    angle: 90
    cutout: 50
    range_x: 1
    range_y: 1
    target_label_padding: 1.49
    custom_color_enabled: true
    custom_color: "#6CBFC0"
    show_single_value_title: true
    single_value_title: Automation Eligible Contacts
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: greater than, value: 0, background_color: "#A1D8D8",
        font_color: "#764BEA", color_application: {collection_id: gen, palette_id: gen-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    font_size_main: '15'
    orientation: vertical
    style_conversation_tags.count_conversation: "#0F21EB"
    show_title_conversation_tags.count_conversation: true
    title_override_conversation_tags.count_conversation: Total Contacts
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
    note_state: expanded
    note_display: above
    note_text: Chat
    title_hidden: true
    listen:
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Remove Test Chats: conversation_tags.session_id
      Brand: conversation_tags.brand
    row: 23
    col: 6
    width: 3
    height: 6
  - name: AE Eligible Summary - Voice
    title: AE Eligible Summary - Voice
    model: dialogflow_cx_us
    explore: conversation_status
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [conversation_tags.count_conversation, conversation_tags.containment]
    filters:
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.channel: Voice
      conversation_tags.session_id: "-%-0000-%"
      conversation_tags.environment: "-Dev"
      conversation_tags.call_flow: Automation Eligible
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      label: Automation Eligible
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: automation_eligible
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.call_flow: Automation Eligible
    - category: table_calculation
      expression: "${automation_eligible}/${conversation_tags.count_conversation}"
      label: Automation Eligible %
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: automation_eligible_1
      _type_hint: number
      is_disabled: true
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    font_size_main: '10'
    orientation: vertical
    style_conversation_tags.count_conversation: "#0F21EB"
    show_title_conversation_tags.count_conversation: true
    title_override_conversation_tags.count_conversation: Automation Eligible
    title_placement_conversation_tags.count_conversation: above
    value_format_conversation_tags.count_conversation: ''
    style_conversation_tags.containment: "#6CBFC0"
    show_title_conversation_tags.containment: true
    title_placement_conversation_tags.containment: above
    value_format_conversation_tags.containment: 0%
    show_comparison_conversation_tags.containment: false
    arm_length: 0
    arm_weight: 0
    spinner_length: 95
    spinner_weight: 55
    target_length: 15
    target_gap: 15
    target_weight: 50
    value_label_type: value
    value_label_font: 12
    value_label_padding: 27
    label_font_size: 0
    spinner_type: needle
    fill_color: "#47c95c"
    background_color: "#d13f3f"
    spinner_color: "#0F21EB"
    range_color: "#764BEA"
    gauge_fill_type: progress
    fill_colors: ["#6CBFC0", "#0F21EB", "#764BEA", "#BFACF7", "#B0DFDF", "#B31412",
      "#625FF6", "#AB92F1", "#A1D8D8", "#3B1DC6", "#b5EAd7", "#c7ceea"]
    angle: 90
    cutout: 50
    range_x: 1
    range_y: 1
    target_label_padding: 1.49
    custom_color_enabled: true
    custom_color: "#6CBFC0"
    show_single_value_title: true
    single_value_title: Automation Eligible Contacts
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: greater than, value: 0, background_color: "#A1D8D8",
        font_color: "#764BEA", color_application: {collection_id: gen, palette_id: gen-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    style_conversation_tags.contained: "#764BEA"
    show_title_conversation_tags.contained: true
    title_override_conversation_tags.contained: Contained Calls
    title_placement_conversation_tags.contained: above
    value_format_conversation_tags.contained: ''
    show_comparison_conversation_tags.contained: false
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
    note_state: expanded
    note_display: above
    note_text: Voice
    title_hidden: true
    listen:
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Remove Test Chats: conversation_tags.session_id
      Brand: conversation_tags.brand
    row: 23
    col: 9
    width: 3
    height: 6
  - name: AE Eligible Summary - Chat
    title: AE Eligible Summary - Chat
    model: dialogflow_cx_us
    explore: conversation_status
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [conversation_tags.count_conversation, conversation_tags.containment]
    filters:
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.channel: Chat
      conversation_tags.session_id: "-%-0000-%"
      conversation_tags.environment: "-Dev"
      conversation_tags.call_flow: Automation Eligible
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      label: Automation Eligible
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: automation_eligible
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.call_flow: Automation Eligible
    - category: table_calculation
      expression: "${automation_eligible}/${conversation_tags.count_conversation}"
      label: Automation Eligible %
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: automation_eligible_1
      _type_hint: number
      is_disabled: true
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    font_size_main: '10'
    orientation: vertical
    style_conversation_tags.count_conversation: "#0F21EB"
    show_title_conversation_tags.count_conversation: true
    title_override_conversation_tags.count_conversation: Automation Eligible
    title_placement_conversation_tags.count_conversation: above
    value_format_conversation_tags.count_conversation: ''
    style_conversation_tags.containment: "#6CBFC0"
    show_title_conversation_tags.containment: true
    title_placement_conversation_tags.containment: above
    value_format_conversation_tags.containment: 0%
    show_comparison_conversation_tags.containment: false
    arm_length: 0
    arm_weight: 0
    spinner_length: 95
    spinner_weight: 55
    target_length: 15
    target_gap: 15
    target_weight: 50
    value_label_type: value
    value_label_font: 12
    value_label_padding: 27
    label_font_size: 0
    spinner_type: needle
    fill_color: "#47c95c"
    background_color: "#d13f3f"
    spinner_color: "#0F21EB"
    range_color: "#764BEA"
    gauge_fill_type: progress
    fill_colors: ["#6CBFC0", "#0F21EB", "#764BEA", "#BFACF7", "#B0DFDF", "#B31412",
      "#625FF6", "#AB92F1", "#A1D8D8", "#3B1DC6", "#b5EAd7", "#c7ceea"]
    angle: 90
    cutout: 50
    range_x: 1
    range_y: 1
    target_label_padding: 1.49
    custom_color_enabled: true
    custom_color: "#6CBFC0"
    show_single_value_title: true
    single_value_title: Automation Eligible Contacts
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: greater than, value: 0, background_color: "#A1D8D8",
        font_color: "#764BEA", color_application: {collection_id: gen, palette_id: gen-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    style_conversation_tags.contained: "#764BEA"
    show_title_conversation_tags.contained: true
    title_override_conversation_tags.contained: Contained Calls
    title_placement_conversation_tags.contained: above
    value_format_conversation_tags.contained: ''
    show_comparison_conversation_tags.contained: false
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
    note_state: expanded
    note_display: above
    note_text: Chat
    title_hidden: true
    listen:
      Created Date: conversation_tags.created_date
      Environment: conversation_tags.environment
      Remove Test Chats: conversation_tags.session_id
      Brand: conversation_tags.brand
    row: 23
    col: 12
    width: 3
    height: 6
  - name: Contact Volume Weekly Trends
    title: Contact Volume Weekly Trends
    model: dialogflow_cx_us
    explore: conversation_status
    type: looker_line
    fields: [conversation_tags.count_conversation, total_contacts, automation_eligible,
      conversation_tags.contained, contained, conversation_tags.containment, containment,
      conversation_tags.created_week]
    fill_fields: [conversation_tags.created_week]
    filters:
      conversation_tags.created_date: 12 week ago for 12 week
      conversation_tags.channel: Chat,Voice
      conversation_tags.environment: "-Dev"
      conversation_status.session_id: "-%-0000-%"
    sorts: [conversation_tags.contained desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      label: Automation Eligible
      value_format: 0.0,\K
      value_format_name: __custom
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: automation_eligible
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.call_flow: Automation Eligible
    - category: measure
      label: Total Contacts
      value_format: 0.0,\K
      value_format_name: __custom
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: total_contacts
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
    y_axes: [{label: '', orientation: left, series: [{axisId: total_contacts, id: total_contacts,
            name: Total Contacts}, {axisId: automation_eligible, id: automation_eligible,
            name: Automation Eligible}, {axisId: contained, id: contained, name: Contained}],
        showLabels: true, showValues: false, minValue: !!null '', unpinAxis: false,
        tickDensity: default, type: linear}, {label: '', orientation: left, series: [
          {axisId: automation_eligible, id: automation_eligible, name: Automation
              Eligible}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
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
      containment: "#A1D8D8"
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
      Channel: conversation_tags.channel
      Environment: conversation_tags.environment
      Remove Test Chats: conversation_tags.session_id
      Brand: conversation_tags.brand
    row: 3
    col: 3
    width: 11
    height: 9
  - title: Auth Funnel - Voice & Chat
    name: Auth Funnel - Voice & Chat
    model: dialogflow_cx_us
    explore: conversation_status
    type: looker_funnel
    fields: [conversation_tags.count_conversation, lookup_performed, lookup_successful,
      auth_successful]
    filters:
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.call_flow: Automation Eligible
      conversation_tags.session_id: "-%-0000-%"
      conversation_tags.environment: "-Dev"
    sorts: [conversation_tags.count_conversation desc]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression:
      label: Basic Call Flow
      value_format:
      value_format_name:
      based_on: conversation_call_id.count
      _kind_hint: measure
      measure: basic_call_flow
      type: count
      _type_hint: number
      filters:
        conversation_tags.call_flow: Basic
    - category: measure
      expression:
      label: Automation Calls
      value_format:
      value_format_name:
      based_on: conversation_call_id.count
      _kind_hint: measure
      measure: automation_calls
      type: count
      _type_hint: number
      filters:
        conversation_tags.automation_call: 'Yes'
    - category: measure
      label: Lookup Performed
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: lookup_performed
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.auth_status: Lookup Performed,Auth Successful,Lookup Successful
    - category: measure
      label: Lookup Successful
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: lookup_successful
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.auth_status: Lookup Successful,Auth Successful
    - category: measure
      label: Auth Successful
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: auth_successful
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.auth_status: Auth Successful
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: true
    orientation: rows
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    color_application:
      collection_id: gen
      custom:
        id: dfd53332-bce0-3a52-c50d-66ae838fd5b4
        label: Custom
        type: continuous
        stops:
        - color: "#0c74ff"
          offset: 0
        - color: "#ffc6ea"
          offset: 50
        - color: "#3bba45"
          offset: 100
      options:
        steps: 5
    isStepped: false
    labelOverlap: false
    show_value_labels: false
    font_size: 12
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_colors:
      Escalation: "#B31412"
      User Hangup: "#6CBFC0"
      Escalation Default Queue: "#B31412"
      Disconnect: "#0F21EB"
    series_labels: {}
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
    hidden_fields: []
    hidden_points_if_no: []
    font_size_main: '15'
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
      Remove Test Chats: conversation_tags.session_id
      Brand: conversation_tags.brand
    row: 29
    col: 8
    width: 6
    height: 9
  - name: Auth Funnel - Chat
    title: Auth Funnel - Chat
    model: dialogflow_cx_us
    explore: conversation_status
    type: looker_funnel
    fields: [conversation_tags.count_conversation, lookup_performed, lookup_successful,
      auth_successful]
    filters:
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.call_flow: Automation Eligible
      conversation_tags.session_id: "-%-0000-%"
      conversation_tags.environment: "-Dev"
      conversation_tags.channel: Chat
    sorts: [conversation_tags.count_conversation desc]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression:
      label: Basic Call Flow
      value_format:
      value_format_name:
      based_on: conversation_call_id.count
      _kind_hint: measure
      measure: basic_call_flow
      type: count
      _type_hint: number
      filters:
        conversation_tags.call_flow: Basic
    - category: measure
      expression:
      label: Automation Calls
      value_format:
      value_format_name:
      based_on: conversation_call_id.count
      _kind_hint: measure
      measure: automation_calls
      type: count
      _type_hint: number
      filters:
        conversation_tags.automation_call: 'Yes'
    - category: measure
      label: Lookup Performed
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: lookup_performed
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.auth_status: Lookup Performed,Lookup Successful,Auth Successful
    - category: measure
      label: Lookup Successful
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: lookup_successful
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.auth_status: Lookup Successful,Auth Successful
    - category: measure
      label: Auth Successful
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: auth_successful
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.auth_status: Auth Successful
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: true
    orientation: rows
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    color_application:
      collection_id: gen
      palette_id: gen-categorical-0
      options:
        steps: 5
    isStepped: false
    labelOverlap: false
    show_value_labels: false
    font_size: 12
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_colors:
      Escalation: "#B31412"
      User Hangup: "#6CBFC0"
      Escalation Default Queue: "#B31412"
      Disconnect: "#0F21EB"
    series_labels: {}
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
    hidden_fields: []
    hidden_points_if_no: []
    font_size_main: '15'
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
      Remove Test Chats: conversation_tags.session_id
      Brand: conversation_tags.brand
    row: 29
    col: 19
    width: 5
    height: 9
  - name: Auth Funnel - Voice
    title: Auth Funnel - Voice
    model: dialogflow_cx_us
    explore: conversation_status
    type: looker_funnel
    fields: [conversation_tags.count_conversation, lookup_performed, lookup_successful,
      auth_successful]
    filters:
      conversation_tags.created_date: 1 day ago for 1 day
      conversation_tags.call_flow: Automation Eligible
      conversation_tags.session_id: "-%-0000-%"
      conversation_tags.environment: "-Dev"
      conversation_tags.channel: Voice
    sorts: [conversation_tags.count_conversation desc]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression:
      label: Basic Call Flow
      value_format:
      value_format_name:
      based_on: conversation_call_id.count
      _kind_hint: measure
      measure: basic_call_flow
      type: count
      _type_hint: number
      filters:
        conversation_tags.call_flow: Basic
    - category: measure
      expression:
      label: Automation Calls
      value_format:
      value_format_name:
      based_on: conversation_call_id.count
      _kind_hint: measure
      measure: automation_calls
      type: count
      _type_hint: number
      filters:
        conversation_tags.automation_call: 'Yes'
    - category: measure
      label: Lookup Performed
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: lookup_performed
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.auth_status: Lookup Performed,Lookup Successful,Auth Successful
    - category: measure
      label: Lookup Successful
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: lookup_successful
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.auth_status: Lookup Successful,Auth Successful
    - category: measure
      label: Auth Successful
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: auth_successful
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.auth_status: Auth Successful
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: true
    orientation: rows
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    color_application:
      collection_id: gen
      palette_id: gen-categorical-0
      options:
        steps: 5
    isStepped: false
    labelOverlap: false
    show_value_labels: false
    font_size: 12
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_colors:
      Escalation: "#B31412"
      User Hangup: "#6CBFC0"
      Escalation Default Queue: "#B31412"
      Disconnect: "#0F21EB"
    series_labels: {}
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
    hidden_fields: []
    hidden_points_if_no: []
    font_size_main: '15'
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
      Remove Test Chats: conversation_tags.session_id
      Brand: conversation_tags.brand
    row: 29
    col: 14
    width: 5
    height: 9
  - title: Contact Volume Daily (Past 30 days)
    name: Contact Volume Daily (Past 30 days)
    model: dialogflow_cx_us
    explore: conversation_status
    type: looker_line
    fields: [conversation_tags.created_date, conversation_tags.count_conversation,
      total_contacts, conversation_tags.containment, containment]
    fill_fields: [conversation_tags.created_date]
    filters:
      conversation_tags.created_date: 30 days
      conversation_tags.channel: Voice,Chat
      conversation_tags.environment: "-Dev"
      conversation_status.session_id: "-%-0000-%"
      conversation_tags.session_id: "-%-0000-%"
    sorts: [conversation_tags.created_date]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      label: Total Contacts
      value_format: 0.0,\K
      value_format_name: __custom
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: total_contacts
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: ed5756e2-1ba8-4233-97d2-d565e309c03b
      palette_id: ff31218a-4f9d-493c-ade2-22266f5934b8
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: total_contacts, id: total_contacts,
            name: Total Contacts}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: containment, id: containment, name: Containment}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: false
    hide_legend: false
    font_size: '8'
    series_types:
      containment: area
      total_contacts: column
    series_colors: {}
    series_point_styles:
      containment: diamond
    swap_axes: false
    defaults_version: 1
    hidden_fields: [conversation_tags.count_conversation, conversation_tags.containment]
    listen:
      Brand: conversation_tags.brand
    row: 12
    col: 0
    width: 24
    height: 6
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
    model: dialogflow_cx_us
    explore: conversation_status
    listens_to_filters: []
    field: conversation_tags.created_date
  - name: Channel
    title: Channel
    type: field_filter
    default_value: Voice,Chat
    allow_multiple_values: true
    required: true
    ui_config:
      type: checkboxes
      display: popover
      options:
      - Voice
      - Chat
    model: dialogflow_cx_us
    explore: conversation_tags
    listens_to_filters: []
    field: conversation_tags.channel
  - name: Environment
    title: Environment
    type: field_filter
    default_value: "-Dev"
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
    model: dialogflow_cx_us
    explore: conversation_tags
    listens_to_filters: []
    field: conversation_tags.environment
  - name: Remove Test Chats
    title: Remove Test Chats
    type: field_filter
    default_value: "-%-0000-%"
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
    model: dialogflow_cx_us
    explore: conversation_status
    listens_to_filters: []
    field: conversation_tags.session_id
  - name: Brand
    title: Brand
    type: field_filter
    default_value: Norton,LifeLock,Avast,AVG,Other
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: dialogflow_cx_us
    explore: conversation_tags
    listens_to_filters: []
    field: conversation_tags.brand
