---
- dashboard: calls_moved_to_ava_eup
  title: Calls Moved to Ava EU Prod
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 5zUDWTcZSwfxru89vJiwTG
  elements:
  - name: Calls & Containment by Ingress
    title: Calls & Containment by Ingress
    model: dialogflow_cx_eup
    explore: conversation_status
    type: looker_column
    fields: [conversation_tags.created_date, conversation_tags.count_conversation,
      conversation_tags.total_escalated_calls, conversation_tags.containment, parameters.parameter_value]
    pivots: [parameters.parameter_value]
    filters:
      conversation_tags.created_date: 30 day ago for 30 day
      parameters.parameter_name: Ingress
      parameters.parameter_value: Account Service,UK Support Main,Cyber Risk,EN US
        GooglePaidAd Menu,AROOD,Comcast CRM Landing page,NPM,EN NAM UHDSP BannerMenu&Que,N
        Renewal Main Menu,N Renewal Mainmenu Pri H,N UHD Main,Norton Products Services
    sorts: [parameters.parameter_value, conversation_tags.created_date desc]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: desc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: Account Service - conversation_tags.count_conversation,
            id: Account Service - conversation_tags.count_conversation, name: Account
              Service - Conversation Tags Conversation Count}, {axisId: AROOD - conversation_tags.count_conversation,
            id: AROOD - conversation_tags.count_conversation, name: AROOD - Conversation
              Tags Conversation Count}, {axisId: Comcast CRM Landing page - conversation_tags.count_conversation,
            id: Comcast CRM Landing page - conversation_tags.count_conversation, name: Comcast
              CRM Landing page - Conversation Tags Conversation Count}, {axisId: Cyber
              Risk - conversation_tags.count_conversation, id: Cyber Risk - conversation_tags.count_conversation,
            name: Cyber Risk - Conversation Tags Conversation Count}, {axisId: EN
              NAM UHDSP BannerMenu&Que - conversation_tags.count_conversation, id: EN
              NAM UHDSP BannerMenu&Que - conversation_tags.count_conversation, name: EN
              NAM UHDSP BannerMenu&Que - Conversation Tags Conversation Count}, {
            axisId: EN US GooglePaidAd Menu - conversation_tags.count_conversation,
            id: EN US GooglePaidAd Menu - conversation_tags.count_conversation, name: EN
              US GooglePaidAd Menu - Conversation Tags Conversation Count}, {axisId: N
              Renewal Main Menu - conversation_tags.count_conversation, id: N Renewal
              Main Menu - conversation_tags.count_conversation, name: N Renewal Main
              Menu - Conversation Tags Conversation Count}, {axisId: N Renewal Mainmenu
              Pri H - conversation_tags.count_conversation, id: N Renewal Mainmenu
              Pri H - conversation_tags.count_conversation, name: N Renewal Mainmenu
              Pri H - Conversation Tags Conversation Count}, {axisId: N UHD Main -
              conversation_tags.count_conversation, id: N UHD Main - conversation_tags.count_conversation,
            name: N UHD Main - Conversation Tags Conversation Count}, {axisId: Norton
              Products Services - conversation_tags.count_conversation, id: Norton
              Products Services - conversation_tags.count_conversation, name: Norton
              Products Services - Conversation Tags Conversation Count}, {axisId: NPM
              - conversation_tags.count_conversation, id: NPM - conversation_tags.count_conversation,
            name: NPM - Conversation Tags Conversation Count}, {axisId: UK Support
              Main - conversation_tags.count_conversation, id: UK Support Main - conversation_tags.count_conversation,
            name: UK Support Main - Conversation Tags Conversation Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: Account
              Service - conversation_tags.containment, id: Account Service - conversation_tags.containment,
            name: Account Service - Conversation Tags Containment}, {axisId: AROOD
              - conversation_tags.containment, id: AROOD - conversation_tags.containment,
            name: AROOD - Conversation Tags Containment}, {axisId: N UHD Main - conversation_tags.containment,
            id: N UHD Main - conversation_tags.containment, name: N UHD Main - Conversation
              Tags Containment}, {axisId: Comcast CRM Landing page - conversation_tags.containment,
            id: Comcast CRM Landing page - conversation_tags.containment, name: Comcast
              CRM Landing page - Conversation Tags Containment}, {axisId: Cyber Risk
              - conversation_tags.containment, id: Cyber Risk - conversation_tags.containment,
            name: Cyber Risk - Conversation Tags Containment}, {axisId: EN NAM UHDSP
              BannerMenu&Que - conversation_tags.containment, id: EN NAM UHDSP BannerMenu&Que
              - conversation_tags.containment, name: EN NAM UHDSP BannerMenu&Que -
              Conversation Tags Containment}, {axisId: EN US GooglePaidAd Menu - conversation_tags.containment,
            id: EN US GooglePaidAd Menu - conversation_tags.containment, name: EN
              US GooglePaidAd Menu - Conversation Tags Containment}, {axisId: N Renewal
              Main Menu - conversation_tags.containment, id: N Renewal Main Menu -
              conversation_tags.containment, name: N Renewal Main Menu - Conversation
              Tags Containment}, {axisId: N Renewal Mainmenu Pri H - conversation_tags.containment,
            id: N Renewal Mainmenu Pri H - conversation_tags.containment, name: N
              Renewal Mainmenu Pri H - Conversation Tags Containment}, {axisId: Norton
              Products Services - conversation_tags.containment, id: Norton Products
              Services - conversation_tags.containment, name: Norton Products Services
              - Conversation Tags Containment}, {axisId: NPM - conversation_tags.containment,
            id: NPM - conversation_tags.containment, name: NPM - Conversation Tags
              Containment}, {axisId: UK Support Main - conversation_tags.containment,
            id: UK Support Main - conversation_tags.containment, name: UK Support
              Main - Conversation Tags Containment}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: true
    trellis_rows: 4
    series_types:
      Account Service - conversation_tags.containment: line
      AROOD - conversation_tags.containment: line
      Comcast CRM Landing page - conversation_tags.containment: line
      UK Support Main - conversation_tags.containment: line
      NPM - conversation_tags.containment: line
      EN US GooglePaidAd Menu - conversation_tags.containment: line
      Cyber Risk - conversation_tags.containment: line
      EN NAM UHDSP BannerMenu&Que - conversation_tags.containment: line
      N Renewal Main Menu - conversation_tags.containment: line
      N Renewal Mainmenu Pri H - conversation_tags.containment: line
      N UHD Main - conversation_tags.containment: line
      Norton Products Services - conversation_tags.containment: line
    series_colors:
      AROOD - conversation_tags.containment: "#1A73E8"
      AROOD - conversation_tags.count_conversation: "#F9AB00"
      Comcast CRM Landing page - conversation_tags.count_conversation: "#F9AB00"
      Comcast CRM Landing page - conversation_tags.containment: "#1A73E8"
      Cyber Risk - conversation_tags.count_conversation: "#F9AB00"
      Cyber Risk - conversation_tags.containment: "#1A73E8"
      EN US GooglePaidAd Menu - conversation_tags.count_conversation: "#F9AB00"
      EN US GooglePaidAd Menu - conversation_tags.containment: "#1A73E8"
      NPM - conversation_tags.count_conversation: "#F9AB00"
      NPM - conversation_tags.containment: "#1A73E8"
      UK Support Main - conversation_tags.count_conversation: "#F9AB00"
      UK Support Main - conversation_tags.containment: "#1A73E8"
      Account Service - conversation_tags.count_conversation: "#F9AB00"
      Account Service - conversation_tags.containment: "#1A73E8"
      EN NAM UHDSP BannerMenu&Que - conversation_tags.count_conversation: "#F9AB00"
      EN NAM UHDSP BannerMenu&Que - conversation_tags.containment: "#1A73E8"
      N Renewal Main Menu - conversation_tags.count_conversation: "#F9AB00"
      N Renewal Main Menu - conversation_tags.containment: "#1A73E8"
      N Renewal Mainmenu Pri H - conversation_tags.count_conversation: "#F9AB00"
      N Renewal Mainmenu Pri H - conversation_tags.containment: "#1A73E8"
      N UHD Main - conversation_tags.count_conversation: "#F9AB00"
      N UHD Main - conversation_tags.containment: "#1A73E8"
      Norton Products Services - conversation_tags.count_conversation: "#F9AB00"
      Norton Products Services - conversation_tags.containment: "#1A73E8"
    series_labels: {}
    hidden_fields: [conversation_tags.total_escalated_calls]
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen: {}
    row: 9
    col: 0
    width: 24
    height: 15
  - name: Calls & Containment Summary
    title: Calls & Containment Summary
    model: dialogflow_cx_eup
    explore: conversation_status
    type: looker_column
    fields: [conversation_tags.count_conversation, conversation_tags.total_escalated_calls,
      conversation_tags.containment, conversation_tags.created_week]
    fill_fields: [conversation_tags.created_week]
    filters:
      conversation_tags.created_date: 16 week ago for 16 week
      parameters.parameter_name: Ingress
      parameters.parameter_value: Account Service,UK Support Main,Cyber Risk,EN US
        GooglePaidAd Menu,AROOD,Comcast CRM Landing page,NPM,N Renewal Main Menu,N
        Renewal Mainmenu Pri H,N UHD Main,Norton Products Services,EN NAM UHDSP BannerMenu&Que
      conversation_tags.call_flow: Automation Eligible
    sorts: [conversation_tags.created_week desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${conversation_tags.count_conversation}-${conversation_tags.total_escalated_calls}"
      label: Contained
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: contained
      _type_hint: number
    - category: measure
      expression:
      label: Automation Eligible
      value_format:
      value_format_name:
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: automation_eligible
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.call_flow: Automation Eligible
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
    x_axis_scale: time
    y_axis_combined: true
    ordering: desc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: conversation_tags.count_conversation,
            id: conversation_tags.count_conversation, name: Conversation Count}, {
            axisId: contained, id: contained, name: Contained}], showLabels: true,
        showValues: true, maxValue: !!null '', unpinAxis: false, tickDensity: default,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: true
    series_types:
      conversation_tags.containment: line
      conversation_tags.count_conversation: line
    series_colors:
      AROOD - conversation_tags.containment: "#1A73E8"
      AROOD - conversation_tags.count_conversation: "#F9AB00"
      Comcast CRM Landing page - conversation_tags.count_conversation: "#F9AB00"
      Comcast CRM Landing page - conversation_tags.containment: "#1A73E8"
      Cyber Risk - conversation_tags.count_conversation: "#F9AB00"
      Cyber Risk - conversation_tags.containment: "#1A73E8"
      EN US GooglePaidAd Menu - conversation_tags.count_conversation: "#F9AB00"
      EN US GooglePaidAd Menu - conversation_tags.containment: "#1A73E8"
      NPM - conversation_tags.count_conversation: "#F9AB00"
      NPM - conversation_tags.containment: "#1A73E8"
      UK Support Main - conversation_tags.count_conversation: "#F9AB00"
      UK Support Main - conversation_tags.containment: "#1A73E8"
      Account Service - conversation_tags.count_conversation: "#F9AB00"
      Account Service - conversation_tags.containment: "#1A73E8"
    series_labels: {}
    hidden_fields: [conversation_tags.total_escalated_calls, conversation_tags.containment]
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
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
    row: 0
    col: 0
    width: 24
    height: 9
