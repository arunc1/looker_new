---
- dashboard: 12_month_view_eup
  title: 12 Month View EU PROD
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: j3Y3uYbd55ICG5aenUpEaX
  elements:
  - name: 12 Months Trend - All Contacts
    title: 12 Months Trend - All Contacts
    model: dialogflow_cx_eup
    explore: conversation_status
    type: looker_column
    fields: [conversation_tags.count_conversation, conversation_tags.total_escalated_calls,
      conversation_tags.contained, conversation_tags.channel, conversation_tags.created_month]
    pivots: [conversation_tags.channel]
    fill_fields: [conversation_tags.created_month]
    filters:
      conversation_tags.created_month: 12 month ago for 12 month
      conversation_tags.channel: Voice,Chat
    sorts: [conversation_tags.channel, conversation_tags.created_month desc]
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
    trellis: pivot
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
    y_axes: [{label: '', orientation: left, series: [{axisId: Voice - 0 - conversation_tags.count_conversation,
            id: Voice - 0 - conversation_tags.count_conversation, name: Voice - Conversation
              Tags Conversation Count}, {axisId: Voice - 0 - conversation_tags.total_escalated_calls,
            id: Voice - 0 - conversation_tags.total_escalated_calls, name: Voice -
              Conversation Tags Escalated}, {axisId: Voice - 0 - conversation_tags.contained,
            id: Voice - 0 - conversation_tags.contained, name: Voice - Conversation
              Tags Contained}, {axisId: Chat - 1 - conversation_tags.count_conversation,
            id: Chat - 1 - conversation_tags.count_conversation, name: Chat - Conversation
              Tags Conversation Count}, {axisId: Chat - 1 - conversation_tags.total_escalated_calls,
            id: Chat - 1 - conversation_tags.total_escalated_calls, name: Chat - Conversation
              Tags Escalated}, {axisId: Chat - 1 - conversation_tags.contained, id: Chat
              - 1 - conversation_tags.contained, name: Chat - Conversation Tags Contained},
          {axisId: Other - 2 - conversation_tags.count_conversation, id: Other - 2
              - conversation_tags.count_conversation, name: Other - Conversation Tags
              Conversation Count}, {axisId: Other - 2 - conversation_tags.total_escalated_calls,
            id: Other - 2 - conversation_tags.total_escalated_calls, name: Other -
              Conversation Tags Escalated}, {axisId: Other - 2 - conversation_tags.contained,
            id: Other - 2 - conversation_tags.contained, name: Other - Conversation
              Tags Contained}], showLabels: true, showValues: true, maxValue: 800000,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    trellis_rows: 3
    series_types:
      Voice - 0 - conversation_tags.count_conversation: line
      Chat - 1 - conversation_tags.count_conversation: line
      Other - 2 - conversation_tags.count_conversation: area
    series_colors:
      Chat - 1 - conversation_tags.count_conversation: "#7CB342"
      Chat - 1 - conversation_tags.total_escalated_calls: "#80868B"
      Voice - 0 - conversation_tags.total_escalated_calls: "#E52592"
      Voice - 0 - conversation_tags.contained: "#12B5CB"
      Chat - 1 - conversation_tags.contained: "#079c98"
      Other - 2 - conversation_tags.count_conversation: "#1A73E8"
      Other - 2 - conversation_tags.total_escalated_calls: "#E52592"
      Other - 2 - conversation_tags.contained: "#12B5CB"
    series_labels:
      Voice - 0 - conversation_tags.count_conversation: Voice Contacts
      Voice - 0 - conversation_tags.total_escalated_calls: Voice Escalated to LH
      Voice - 0 - conversation_tags.contained: Voice Contained by IVR / Automation
      Chat - 1 - conversation_tags.total_escalated_calls: Chat Escalated to LH
      Chat - 1 - conversation_tags.count_conversation: Chat Contacts
      Chat - 1 - conversation_tags.contained: Chat contained
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 13
  - name: 12 Months Trend - Automation Handled
    title: 12 Months Trend - Automation Handled
    model: dialogflow_cx_eup
    explore: conversation_status
    type: looker_column
    fields: [conversation_tags.count_conversation, conversation_tags.total_escalated_calls,
      conversation_tags.contained, conversation_tags.channel, conversation_tags.created_month]
    pivots: [conversation_tags.channel]
    fill_fields: [conversation_tags.created_month]
    filters:
      conversation_tags.created_month: 12 month ago for 12 month
      conversation_tags.call_flow: Automation Eligible
      conversation_tags.channel: Voice,Chat
    sorts: [conversation_tags.channel, conversation_tags.created_month desc]
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
    trellis: pivot
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
    y_axes: [{label: '', orientation: left, series: [{axisId: Voice - 0 - conversation_tags.count_conversation,
            id: Voice - 0 - conversation_tags.count_conversation, name: Voice - Conversation
              Tags Conversation Count}, {axisId: Voice - 0 - conversation_tags.total_escalated_calls,
            id: Voice - 0 - conversation_tags.total_escalated_calls, name: Voice -
              Conversation Tags Escalated}, {axisId: Voice - 0 - conversation_tags.contained,
            id: Voice - 0 - conversation_tags.contained, name: Voice - Conversation
              Tags Contained}, {axisId: Chat - 1 - conversation_tags.count_conversation,
            id: Chat - 1 - conversation_tags.count_conversation, name: Chat - Conversation
              Tags Conversation Count}, {axisId: Chat - 1 - conversation_tags.total_escalated_calls,
            id: Chat - 1 - conversation_tags.total_escalated_calls, name: Chat - Conversation
              Tags Escalated}, {axisId: Chat - 1 - conversation_tags.contained, id: Chat
              - 1 - conversation_tags.contained, name: Chat - Conversation Tags Contained},
          {axisId: Other - 2 - conversation_tags.count_conversation, id: Other - 2
              - conversation_tags.count_conversation, name: Other - Conversation Tags
              Conversation Count}, {axisId: Other - 2 - conversation_tags.total_escalated_calls,
            id: Other - 2 - conversation_tags.total_escalated_calls, name: Other -
              Conversation Tags Escalated}, {axisId: Other - 2 - conversation_tags.contained,
            id: Other - 2 - conversation_tags.contained, name: Other - Conversation
              Tags Contained}], showLabels: true, showValues: true, maxValue: 800000,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    trellis_rows: 3
    series_types:
      Voice - 0 - conversation_tags.count_conversation: line
      Chat - 1 - conversation_tags.count_conversation: line
      Other - 2 - conversation_tags.count_conversation: area
    series_colors:
      Chat - 1 - conversation_tags.count_conversation: "#7CB342"
      Chat - 1 - conversation_tags.total_escalated_calls: "#80868B"
      Voice - 0 - conversation_tags.total_escalated_calls: "#E52592"
      Voice - 0 - conversation_tags.contained: "#12B5CB"
      Chat - 1 - conversation_tags.contained: "#079c98"
      Other - 2 - conversation_tags.count_conversation: "#1A73E8"
      Other - 2 - conversation_tags.total_escalated_calls: "#E52592"
      Other - 2 - conversation_tags.contained: "#12B5CB"
    series_labels:
      Voice - 0 - conversation_tags.count_conversation: Voice Contacts
      Voice - 0 - conversation_tags.total_escalated_calls: Voice Escalated to LH
      Voice - 0 - conversation_tags.contained: Voice Contained by IVR / Automation
      Chat - 1 - conversation_tags.total_escalated_calls: Chat Escalated to LH
      Chat - 1 - conversation_tags.count_conversation: Chat Contacts
      Chat - 1 - conversation_tags.contained: Chat contained
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 13
    col: 0
    width: 24
    height: 14
  - name: Opportunity - Chat - Avast AVG International
    title: Opportunity - Chat - Avast AVG International
    model: dialogflow_cx_eup
    explore: conversation_status
    type: looker_column
    fields: [conversation_tags.count_conversation, conversation_tags.created_month,
      conversation_tags.brand]
    pivots: [conversation_tags.brand]
    filters:
      conversation_tags.created_month: 12 month ago for 12 month
      conversation_tags.channel: Chat
      conversation_tags.environment: Prod
      conversation_tags.brand: Avast,AVG
      conversation_tags.chat_page: Contact Us
      conversation_tags.call_flow: Direct to Agent Chat
      conversation_tags.language: "-English"
    sorts: [conversation_tags.brand, conversation_tags.created_month desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: Sales Call Flow - 02
              - conversation_tags.count_conversation, id: Sales Call Flow - 02 - conversation_tags.count_conversation,
            name: Sales Call Flow}, {axisId: Basic Call Flow - 03 - conversation_tags.count_conversation,
            id: Basic Call Flow - 03 - conversation_tags.count_conversation, name: Basic
              Call Flow}, {axisId: Direct to Agent Call - 04 - conversation_tags.count_conversation,
            id: Direct to Agent Call - 04 - conversation_tags.count_conversation,
            name: Direct to Agent Call}], showLabels: true, showValues: true, maxValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    trellis_rows: 2
    series_colors:
      Chat - 1 - conversation_tags.count_conversation: "#1A73E8"
      Chat - 1 - conversation_tags.total_escalated_calls: "#E52592"
      Voice - 0 - conversation_tags.total_escalated_calls: "#E52592"
      Voice - 0 - conversation_tags.contained: "#12B5CB"
      Chat - 1 - conversation_tags.contained: "#12B5CB"
      Other - 2 - conversation_tags.count_conversation: "#1A73E8"
      Other - 2 - conversation_tags.total_escalated_calls: "#E52592"
      Other - 2 - conversation_tags.contained: "#12B5CB"
      Avast - 2 - conversation_tags.count_conversation: "#E8710A"
      AVG - 3 - conversation_tags.count_conversation: "#1A73E8"
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
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
    listen: {}
    row: 30
    col: 0
    width: 12
    height: 12
  - name: Opportunity - Chat - NLOK Sales
    title: Opportunity - Chat - NLOK Sales
    model: dialogflow_cx_eup
    explore: conversation_status
    type: looker_column
    fields: [conversation_tags.count_conversation, conversation_tags.created_month,
      conversation_tags.brand]
    pivots: [conversation_tags.brand]
    filters:
      conversation_tags.created_month: 12 month ago for 12 month
      conversation_tags.call_flow: Sales Chat
      conversation_tags.channel: Chat
      conversation_tags.environment: Prod
      conversation_tags.brand: Norton,LifeLock
    sorts: [conversation_tags.brand, conversation_tags.created_month desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: Sales Call Flow - 02
              - conversation_tags.count_conversation, id: Sales Call Flow - 02 - conversation_tags.count_conversation,
            name: Sales Call Flow}, {axisId: Basic Call Flow - 03 - conversation_tags.count_conversation,
            id: Basic Call Flow - 03 - conversation_tags.count_conversation, name: Basic
              Call Flow}, {axisId: Direct to Agent Call - 04 - conversation_tags.count_conversation,
            id: Direct to Agent Call - 04 - conversation_tags.count_conversation,
            name: Direct to Agent Call}], showLabels: true, showValues: true, maxValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    trellis_rows: 2
    series_types:
      Voice - 0 - conversation_tags.count_conversation: area
      Chat - 1 - conversation_tags.count_conversation: area
      Other - 2 - conversation_tags.count_conversation: area
    series_colors:
      Chat - 1 - conversation_tags.count_conversation: "#1A73E8"
      Chat - 1 - conversation_tags.total_escalated_calls: "#E52592"
      Voice - 0 - conversation_tags.total_escalated_calls: "#E52592"
      Voice - 0 - conversation_tags.contained: "#12B5CB"
      Chat - 1 - conversation_tags.contained: "#12B5CB"
      Other - 2 - conversation_tags.count_conversation: "#1A73E8"
      Other - 2 - conversation_tags.total_escalated_calls: "#E52592"
      Other - 2 - conversation_tags.contained: "#12B5CB"
      Norton - 0 - conversation_tags.count_conversation: "#F9AB00"
      LifeLock - 1 - conversation_tags.count_conversation: "#EA4335"
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 30
    col: 12
    width: 12
    height: 12
  - name: Opportunity - Chat - NLOK Direct Agent
    title: Opportunity - Chat - NLOK Direct Agent
    model: dialogflow_cx_eup
    explore: conversation_status
    type: looker_column
    fields: [conversation_tags.count_conversation, conversation_tags.created_month,
      conversation_tags.brand]
    pivots: [conversation_tags.brand]
    fill_fields: [conversation_tags.created_month]
    filters:
      conversation_tags.created_month: 12 month ago for 12 month
      conversation_tags.call_flow: Direct to Agent Chat
      conversation_tags.channel: Chat
      conversation_tags.environment: Prod
      conversation_tags.brand: Norton,LifeLock
    sorts: [conversation_tags.brand, conversation_tags.created_month desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: Sales Call Flow - 02
              - conversation_tags.count_conversation, id: Sales Call Flow - 02 - conversation_tags.count_conversation,
            name: Sales Call Flow}, {axisId: Basic Call Flow - 03 - conversation_tags.count_conversation,
            id: Basic Call Flow - 03 - conversation_tags.count_conversation, name: Basic
              Call Flow}, {axisId: Direct to Agent Call - 04 - conversation_tags.count_conversation,
            id: Direct to Agent Call - 04 - conversation_tags.count_conversation,
            name: Direct to Agent Call}], showLabels: true, showValues: true, maxValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    trellis_rows: 2
    series_types:
      Voice - 0 - conversation_tags.count_conversation: area
      Chat - 1 - conversation_tags.count_conversation: area
      Other - 2 - conversation_tags.count_conversation: area
    series_colors:
      Chat - 1 - conversation_tags.count_conversation: "#1A73E8"
      Chat - 1 - conversation_tags.total_escalated_calls: "#E52592"
      Voice - 0 - conversation_tags.total_escalated_calls: "#E52592"
      Voice - 0 - conversation_tags.contained: "#12B5CB"
      Chat - 1 - conversation_tags.contained: "#12B5CB"
      Other - 2 - conversation_tags.count_conversation: "#1A73E8"
      Other - 2 - conversation_tags.total_escalated_calls: "#E52592"
      Other - 2 - conversation_tags.contained: "#12B5CB"
      Norton - 0 - conversation_tags.count_conversation: "#F9AB00"
      LifeLock - 1 - conversation_tags.count_conversation: "#EA4335"
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 42
    col: 12
    width: 12
    height: 12
  - name: Opportunity - Voice
    title: Opportunity - Voice
    model: dialogflow_cx_eup
    explore: conversation_status
    type: looker_column
    fields: [conversation_tags.count_conversation, conversation_tags.created_month,
      conversation_tags.call_flow]
    pivots: [conversation_tags.call_flow]
    filters:
      conversation_tags.created_month: 12 month ago for 12 month
      conversation_tags.call_flow: "-Automation Eligible,-Other"
      conversation_tags.channel: Voice
      conversation_tags.environment: Prod
    sorts: [conversation_tags.call_flow, conversation_tags.created_month desc]
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
    trellis: pivot
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
    y_axes: [{label: '', orientation: left, series: [{axisId: Sales Call Flow - 02
              - conversation_tags.count_conversation, id: Sales Call Flow - 02 - conversation_tags.count_conversation,
            name: Sales Call Flow}, {axisId: Basic Call Flow - 03 - conversation_tags.count_conversation,
            id: Basic Call Flow - 03 - conversation_tags.count_conversation, name: Basic
              Call Flow}, {axisId: Direct to Agent Call - 04 - conversation_tags.count_conversation,
            id: Direct to Agent Call - 04 - conversation_tags.count_conversation,
            name: Direct to Agent Call}], showLabels: true, showValues: true, maxValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    trellis_rows: 2
    series_types:
      Voice - 0 - conversation_tags.count_conversation: area
      Chat - 1 - conversation_tags.count_conversation: area
      Other - 2 - conversation_tags.count_conversation: area
    series_colors:
      Chat - 1 - conversation_tags.count_conversation: "#1A73E8"
      Chat - 1 - conversation_tags.total_escalated_calls: "#E52592"
      Voice - 0 - conversation_tags.total_escalated_calls: "#E52592"
      Voice - 0 - conversation_tags.contained: "#12B5CB"
      Chat - 1 - conversation_tags.contained: "#12B5CB"
      Other - 2 - conversation_tags.count_conversation: "#1A73E8"
      Other - 2 - conversation_tags.total_escalated_calls: "#E52592"
      Other - 2 - conversation_tags.contained: "#12B5CB"
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 54
    col: 0
    width: 24
    height: 12
  - name: Opportunity - NLOK Direct Agent Breakdown by Ingress
    title: Opportunity - NLOK Direct Agent Breakdown by Ingress
    model: dialogflow_cx_eup
    explore: conversation_status
    type: looker_grid
    fields: [conversation_tags.count_conversation, parameters.parameter_value]
    filters:
      conversation_tags.created_month: 12 month ago for 12 month
      conversation_tags.call_flow: Basic Call Flow
      conversation_tags.channel: Voice
      conversation_tags.environment: Prod
      parameters.parameter_name: Ingress
    sorts: [conversation_tags.count_conversation desc]
    limit: 50
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
    trellis: pivot
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
    y_axes: [{label: '', orientation: left, series: [{axisId: Sales Call Flow - 02
              - conversation_tags.count_conversation, id: Sales Call Flow - 02 - conversation_tags.count_conversation,
            name: Sales Call Flow}, {axisId: Basic Call Flow - 03 - conversation_tags.count_conversation,
            id: Basic Call Flow - 03 - conversation_tags.count_conversation, name: Basic
              Call Flow}, {axisId: Direct to Agent Call - 04 - conversation_tags.count_conversation,
            id: Direct to Agent Call - 04 - conversation_tags.count_conversation,
            name: Direct to Agent Call}], showLabels: true, showValues: true, maxValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    trellis_rows: 2
    series_colors:
      Chat - 1 - conversation_tags.count_conversation: "#1A73E8"
      Chat - 1 - conversation_tags.total_escalated_calls: "#E52592"
      Voice - 0 - conversation_tags.total_escalated_calls: "#E52592"
      Voice - 0 - conversation_tags.contained: "#12B5CB"
      Chat - 1 - conversation_tags.contained: "#12B5CB"
      Other - 2 - conversation_tags.count_conversation: "#1A73E8"
      Other - 2 - conversation_tags.total_escalated_calls: "#E52592"
      Other - 2 - conversation_tags.contained: "#12B5CB"
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    listen: {}
    row: 66
    col: 0
    width: 24
    height: 23
  - name: Opportunity - Chat - Avast AVG International (By Language)
    title: Opportunity - Chat - Avast AVG International (By Language)
    model: dialogflow_cx_eup
    explore: conversation_status
    type: looker_bar
    fields: [conversation_tags.count_conversation, conversation_tags.brand, conversation_tags.language]
    pivots: [conversation_tags.brand]
    filters:
      conversation_tags.created_month: 12 month ago for 12 month
      conversation_tags.channel: Chat
      conversation_tags.environment: Prod
      conversation_tags.brand: Avast,AVG
      conversation_tags.chat_page: Contact Us
      conversation_tags.call_flow: Direct to Agent Chat
      conversation_tags.language: "-English"
    sorts: [conversation_tags.brand, conversation_tags.count_conversation desc 0]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: Sales Call Flow - 02
              - conversation_tags.count_conversation, id: Sales Call Flow - 02 - conversation_tags.count_conversation,
            name: Sales Call Flow}, {axisId: Basic Call Flow - 03 - conversation_tags.count_conversation,
            id: Basic Call Flow - 03 - conversation_tags.count_conversation, name: Basic
              Call Flow}, {axisId: Direct to Agent Call - 04 - conversation_tags.count_conversation,
            id: Direct to Agent Call - 04 - conversation_tags.count_conversation,
            name: Direct to Agent Call}], showLabels: true, showValues: true, maxValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    trellis_rows: 2
    series_colors:
      Chat - 1 - conversation_tags.count_conversation: "#1A73E8"
      Chat - 1 - conversation_tags.total_escalated_calls: "#E52592"
      Voice - 0 - conversation_tags.total_escalated_calls: "#E52592"
      Voice - 0 - conversation_tags.contained: "#12B5CB"
      Chat - 1 - conversation_tags.contained: "#12B5CB"
      Other - 2 - conversation_tags.count_conversation: "#1A73E8"
      Other - 2 - conversation_tags.total_escalated_calls: "#E52592"
      Other - 2 - conversation_tags.contained: "#12B5CB"
      Avast - 2 - conversation_tags.count_conversation: "#E8710A"
      AVG - 3 - conversation_tags.count_conversation: "#1A73E8"
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
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
    listen: {}
    row: 42
    col: 0
    width: 12
    height: 12
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Opportunity"}],"align":"center","id":"3dbp4"},{"type":"p","children":[{"text":""}],"id":"caj3z"},{"type":"p","children":[{"text":"Breakdown
      of Various contact segments that don''t go through Automation today and are
      opportunities for Automation"}],"align":"center","id":"bfx32"},{"type":"h1","children":[{"text":""}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 27
    col: 0
    width: 24
    height: 3
  - name: Opportunity - Voice - Sales Calls
    title: Opportunity - Voice - Sales Calls
    model: dialogflow_cx_eup
    explore: conversation_status
    type: looker_column
    fields: [conversation_tags.count_conversation, conversation_tags.created_month,
      conversation_tags.call_flow]
    pivots: [conversation_tags.call_flow]
    fill_fields: [conversation_tags.created_month]
    filters:
      conversation_tags.created_month: 12 month ago for 12 month
      conversation_tags.channel: Voice
      conversation_tags.environment: Prod
      conversation_tags.resolution_source: Sales Flow
      conversation_tags.call_resolution: Escalation
    sorts: [conversation_tags.call_flow, conversation_tags.created_month desc]
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
    trellis: pivot
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
    y_axes: [{label: '', orientation: left, series: [{axisId: Sales Call Flow - 02
              - conversation_tags.count_conversation, id: Sales Call Flow - 02 - conversation_tags.count_conversation,
            name: Sales Call Flow}, {axisId: Basic Call Flow - 03 - conversation_tags.count_conversation,
            id: Basic Call Flow - 03 - conversation_tags.count_conversation, name: Basic
              Call Flow}, {axisId: Direct to Agent Call - 04 - conversation_tags.count_conversation,
            id: Direct to Agent Call - 04 - conversation_tags.count_conversation,
            name: Direct to Agent Call}], showLabels: true, showValues: true, maxValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    trellis_rows: 2
    series_types:
      Voice - 0 - conversation_tags.count_conversation: area
      Chat - 1 - conversation_tags.count_conversation: area
      Other - 2 - conversation_tags.count_conversation: area
    series_colors:
      Chat - 1 - conversation_tags.count_conversation: "#1A73E8"
      Chat - 1 - conversation_tags.total_escalated_calls: "#E52592"
      Voice - 0 - conversation_tags.total_escalated_calls: "#E52592"
      Voice - 0 - conversation_tags.contained: "#12B5CB"
      Chat - 1 - conversation_tags.contained: "#12B5CB"
      Other - 2 - conversation_tags.count_conversation: "#1A73E8"
      Other - 2 - conversation_tags.total_escalated_calls: "#E52592"
      Other - 2 - conversation_tags.contained: "#12B5CB"
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row:
    col:
    width:
    height:
