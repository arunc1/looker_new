---
- dashboard: vra_new
  title: VRA New EU
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: F6cXa6ao9nynZpLbH3WGnp
  elements:
  - name: VRA Summary
    title: VRA Summary
    model: dialogflow_cx_eu
    explore: conversation_status
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [conversation_status.count_session, order_confirmed, eligible_for_offer,
      ineligible, conversation_tags.contained, conversation_tags.total_escalated_calls,
      conversation_tags.containment, canceled, retained, conversation_tags.retention_rate]
    filters:
      conversation_tags.customer_retention_flow: 'Yes'
      conversation_tags.created_date: after 2025/06/25
      conversation_tags.environment: Prod
      conversation_tags.call_resolution: Escalation,User Hangup
      conversation_tags.channel: Chat
    sorts: [conversation_tags.containment desc]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: table_calculation
      expression: "${retained}/${eligible_for_offer}"
      label: Retention Rate
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: retention_rate
      _type_hint: number
      is_disabled: true
    - category: measure
      expression: ''
      label: Eligible for Offer
      value_format:
      value_format_name:
      based_on: conversation_status.count_session
      _kind_hint: measure
      measure: eligible_for_offer
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.retention_offer_eligible: Eligible
    - category: measure
      expression: ''
      label: Ineligible
      value_format:
      value_format_name:
      based_on: conversation_status.count_session
      _kind_hint: measure
      measure: ineligible
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.retention_offer_eligible: "-Eligible"
        conversation_tags.vra_order_confirmed: 'Yes'
    - category: measure
      expression:
      label: Canceled
      value_format:
      value_format_name:
      based_on: conversation_status.count_session
      _kind_hint: measure
      measure: canceled
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.Retention_Status: Cancelled
    - category: measure
      expression:
      label: Retained
      value_format:
      value_format_name:
      based_on: conversation_status.count_session
      _kind_hint: measure
      measure: retained
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.Retention_Status: Retained
    - category: measure
      expression:
      label: Order Confirmed
      value_format:
      value_format_name:
      based_on: conversation_status.count_session
      _kind_hint: measure
      measure: order_confirmed
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.vra_order_confirmed: 'Yes'
    - category: dimension
      expression: "if(${conversation_tags.vra_order_confirmed} = \"No\" OR ${conversation_tags.vra_order_confirmed}\
        \ = \"NA\",\"Ineligible - Order Confirmation\",\nif(${conversation_tags.offer1}=\"\
        no-rule-matched\",\"Ineligible - Matrix Exception\",\nif(${conversation_tags.offer1}=\"\
        failed\",\"Ineligible - Failure\",\nif(${conversation_tags.offer1}=\"escalate\"\
        ,\"Ineligible - Matrix Escalation\",\nif((${conversation_tags.offer_presented1}\
        \ = yes) OR (${conversation_tags.offer_presented2} = yes) OR (${conversation_tags.offer_presented3}\
        \ = yes) OR (${conversation_tags.offer_presented4} = yes),\"Eligible\", \n\
        if(contains (${conversation_tags.Ineligible_Reason1},\"country\"),\"Ineligible\
        \ - Country\",\nif(contains (${conversation_tags.Ineligible_Reason1},\"multiple\"\
        ),\"Ineligible - Multiple Product\",\nif(contains (${conversation_tags.Ineligible_Reason1},\"\
        ar_already_off\"),\"Ineligible - AR Off\",\nif(contains (${conversation_tags.Ineligible_Reason1},\"\
        outside_money\"),\"Ineligible - Outside MBG\",\nif(contains (${conversation_tags.Ineligible_Reason1},\"\
        already_refunded\"),\"Ineligible - Refunded\",\n    \"Ineligible - Other\"\
        ))))))))))"
      label: Offer Eligibility
      value_format:
      value_format_name:
      dimension: offer_eligibility
      _kind_hint: dimension
      _type_hint: string
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    font_size_main: ''
    orientation: horizontal
    dividers: true
    style_conversation_status.count_session: "#1A73E8"
    show_title_conversation_status.count_session: true
    title_override_conversation_status.count_session: Contacts
    title_placement_conversation_status.count_session: below
    value_format_conversation_status.count_session: ''
    show_comparison_order_confirmed: true
    comparison_style_order_confirmed: value
    comparison_show_label_order_confirmed: true
    comparison_label_placement_order_confirmed: below
    comp_value_format_order_confirmed: ''
    style_eligible_for_offer: "#F9AB00"
    show_title_eligible_for_offer: true
    title_placement_eligible_for_offer: below
    value_format_eligible_for_offer: ''
    show_comparison_eligible_for_offer: false
    show_comparison_ineligible: true
    comparison_style_ineligible: value
    comparison_show_label_ineligible: true
    comparison_label_placement_ineligible: below
    comp_value_format_ineligible: ''
    style_conversation_tags.contained: "#079c98"
    show_title_conversation_tags.contained: true
    title_override_conversation_tags.contained: Contained
    title_placement_conversation_tags.contained: below
    value_format_conversation_tags.contained: ''
    show_comparison_conversation_tags.contained: false
    show_comparison_conversation_tags.total_escalated_calls: true
    comparison_style_conversation_tags.total_escalated_calls: value
    comparison_show_label_conversation_tags.total_escalated_calls: true
    comparison_label_conversation_tags.total_escalated_calls: Escalated
    comparison_label_placement_conversation_tags.total_escalated_calls: below
    comp_value_format_conversation_tags.total_escalated_calls: ''
    style_conversation_tags.containment: "#079c98"
    show_title_conversation_tags.containment: true
    title_placement_conversation_tags.containment: below
    value_format_conversation_tags.containment: ''
    show_comparison_conversation_tags.containment: false
    show_comparison_canceled: true
    comparison_style_canceled: value
    comparison_show_label_canceled: true
    comparison_label_placement_canceled: below
    comp_value_format_canceled: ''
    style_retained: "#E8710A"
    show_title_retained: true
    title_placement_retained: below
    value_format_retained: ''
    show_comparison_retained: false
    show_comparison_conversation_tags.retention_rate: true
    comparison_style_conversation_tags.retention_rate: value
    comparison_show_label_conversation_tags.retention_rate: true
    comparison_label_placement_conversation_tags.retention_rate: below
    comp_value_format_conversation_tags.retention_rate: ''
    comparison_style_conversation_tags.containment: value
    comparison_show_label_conversation_tags.containment: true
    comparison_label_placement_conversation_tags.containment: below
    comp_value_format_conversation_tags.containment: 0.00%
    style_conversation_tags.total_escalated_calls: "#3A4245"
    show_title_conversation_tags.total_escalated_calls: true
    title_placement_conversation_tags.total_escalated_calls: above
    value_format_conversation_tags.total_escalated_calls: ''
    comparison_style_conversation_tags.contained: value
    comparison_show_label_conversation_tags.contained: true
    comparison_label_placement_conversation_tags.contained: below
    comp_value_format_conversation_tags.contained: ''
    style_conversation_tags.retention_rate: "#FF8168"
    show_title_conversation_tags.retention_rate: true
    title_placement_conversation_tags.retention_rate: below
    value_format_conversation_tags.retention_rate: ''
    style_retention_rate: "#E8710A"
    show_title_retention_rate: true
    title_placement_retention_rate: below
    value_format_retention_rate: ''
    show_comparison_retention_rate: true
    comparison_style_retention_rate: value
    comparison_show_label_retention_rate: true
    comparison_label_retention_rate: Retention Rate
    comparison_label_placement_retention_rate: below
    style_order_confirmed: "#3A4245"
    show_title_order_confirmed: true
    title_placement_order_confirmed: above
    value_format_order_confirmed: ''
    comparison_style_eligible_for_offer: value
    comparison_show_label_eligible_for_offer: true
    comparison_label_placement_eligible_for_offer: below
    comp_value_format_eligible_for_offer: ''
    theme: contemporary
    customTheme: ''
    layout: fixed
    minWidthForIndexColumns: true
    headerFontSize: 12
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: true
    colSubtotals: false
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: pivots
    useViewName: false
    useHeadings: true
    useShortName: false
    useUnit: false
    groupVarianceColumns: true
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|conversation_tags.call_resolution: Contact Resolution
    heading|conversation_tags.call_resolution: ''
    hide|conversation_tags.call_resolution: false
    label|conversation_tags.Retention_Status: Retention status
    heading|conversation_tags.Retention_Status: ''
    hide|conversation_tags.Retention_Status: false
    subtotalDepth: '1'
    label|conversation_status.count_session: Conversation Count
    heading|conversation_status.count_session: ''
    style|conversation_status.count_session: normal
    reportIn|conversation_status.count_session: '1'
    unit|conversation_status.count_session: ''
    comparison|conversation_status.count_session: no_variance
    switch|conversation_status.count_session: false
    var_num|conversation_status.count_session: true
    var_pct|conversation_status.count_session: false
    chart_type: Line
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_cell_visualizations:
      conversation_status.count_session:
        is_active: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    defaults_version: 0
    column_order: ["$$$_row_numbers_$$$", conversation_status.count_session, order_confirmed,
      eligible_for_offer, ineligible, conversation_tags.contained, conversation_tags.total_escalated_calls,
      retained, canceled, retention_rate, conversation_tags.containment]
    hidden_pivots: {}
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 7
  - name: VRA MVP 3 Offer Progression
    title: VRA MVP 3 Offer Progression
    model: dialogflow_cx_eu
    explore: conversation_status
    type: marketplace_viz_sankey::sankey-marketplace
    fields: [order_confirmation, offer_1_1, conversation_tags.offer_accepted1, offer_2_1,
      conversation_tags.offer_accepted2, offer_3_1, conversation_tags.offer_accepted3,
      offer_4_1, conversation_tags.offer_accepted4, conversation_tags.Retention_Status,
      conversation_status.count_session, contact_resolution]
    filters:
      conversation_tags.customer_retention_flow: 'Yes'
      conversation_tags.environment: Prod
      conversation_tags.created_date: after 2025/04/01
      conversation_tags.call_resolution: Escalation,User Hangup
    sorts: [conversation_status.count_session desc]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression:
      label: Offer 2 Eligible
      value_format:
      value_format_name:
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: offer_2_eligible
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.offer2: '"ar_off",discount,"partial_refund_20","partial_refund_30","partial_refund_40","partial_refund_50"'
    - category: measure
      expression:
      label: Order Confirmed
      value_format:
      value_format_name:
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: order_confirmed
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.vra_order_confirmed: Order confirmed
    - category: measure
      expression:
      label: Canceled
      value_format:
      value_format_name:
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: canceled
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.Retention_Status: Cancelled
    - category: measure
      expression:
      label: Retained
      value_format:
      value_format_name:
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: retained
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.Retention_Status: Retained
    - category: measure
      expression:
      label: Order Confirmed Copy
      value_format:
      value_format_name:
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: order_confirmed_copy
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.vra_order_confirmed: Order confirmed
    - category: measure
      expression:
      label: Refund Eligible Copy
      value_format:
      value_format_name:
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: refund_eligible_copy
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.vra_partial_refund: Eligible
    - category: measure
      expression:
      label: Offer 2 Presented
      value_format:
      value_format_name:
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: offer_2_presented
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.offer_presented2: 'Yes'
    - category: measure
      expression:
      label: Offer 2 Accepted
      value_format:
      value_format_name:
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: offer_2_accepted
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.offer_accepted2: 'Yes'
    - category: dimension
      expression: 'if(${conversation_tags.offer1}="partial_refund", "Ineligible",${conversation_tags.offer1}) '
      label: Offer 1
      value_format:
      value_format_name:
      dimension: offer_1_1
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: 'if(${conversation_tags.offer2}="partial_refund", "Ineligible",${conversation_tags.offer2}) '
      label: Offer 2
      value_format:
      value_format_name:
      dimension: offer_2_1
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: 'if(${conversation_tags.offer3}="partial_refund", "Ineligible",${conversation_tags.offer3}) '
      label: Offer 3
      value_format:
      value_format_name:
      dimension: offer_3_1
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: 'if(${conversation_tags.offer4}="partial_refund", "Ineligible",${conversation_tags.offer4}) '
      label: Offer 4
      value_format:
      value_format_name:
      dimension: offer_4_1
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: if(${conversation_tags.vra_order_confirmed}="Yes","Order Confirmed","Order
        Not Confirmed")
      label: Order Confirmation
      value_format:
      value_format_name:
      dimension: order_confirmation
      _kind_hint: dimension
      _type_hint: string
    - category: table_calculation
      expression: 'if(${conversation_tags.offer1}="partial_refund", "Ineligible",${conversation_tags.offer1}) '
      label: Offer 1
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: offer_1
      _type_hint: string
      is_disabled: true
    - category: table_calculation
      expression: 'if(${conversation_tags.offer2}="partial_refund", "Ineligible",${conversation_tags.offer2}) '
      label: Offer 2
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: offer_2
      _type_hint: string
      is_disabled: true
    - category: table_calculation
      expression: 'if(${conversation_tags.offer3}="partial_refund", "Ineligible",${conversation_tags.offer3}) '
      label: Offer 3
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: offer_3
      _type_hint: string
      is_disabled: true
    - category: table_calculation
      expression: 'if(${conversation_tags.offer4}="partial_refund", "Ineligible",${conversation_tags.offer4}) '
      label: Offer 4
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: offer_4
      _type_hint: string
      is_disabled: true
    - category: table_calculation
      expression: "${offer_2_accepted}/${offer_2_presented}"
      label: Offer Acceptance Rate
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: offer_acceptance_rate
      _type_hint: number
      is_disabled: true
    - category: dimension
      expression: if(${conversation_tags.call_resolution}="Escalation","Escalated","Contained")
      label: Contact Resolution
      value_format:
      value_format_name:
      dimension: contact_resolution
      _kind_hint: dimension
      _type_hint: string
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    color_range: ["#1A73E8", "#12B5CB", "#E52592", "#E8710A", "#F9AB00", "#7CB342",
      "#9334E6", "#80868B", "#079c98", "#A8A116", "#EA4335", "#FF8168"]
    label_type: name_value
    show_null_points: true
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: offer_1_eligible, id: offer_1_eligible,
            name: Offer 1 Eligible}, {axisId: offer_1_presented, id: offer_1_presented,
            name: Offer 1 Presented}, {axisId: offer_1_accepted_1, id: offer_1_accepted_1,
            name: Offer 1 Accepted}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: offer_acceptance_rate, id: offer_acceptance_rate,
            name: Offer Acceptance Rate}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    font_size: '15'
    point_style: circle
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
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: true
    isStepped: false
    orientation: rows
    labelPosition: left
    labelOverlap: false
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    charts_across:
    hidden_pivots: {}
    defaults_version: 0
    value_labels: legend
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
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen: {}
    row: 7
    col: 0
    width: 24
    height: 14
  - name: VRA Breakdown by Offer
    title: VRA Breakdown by Offer
    model: dialogflow_cx_eu
    explore: conversation_status
    type: looker_grid
    fields: [offer_accepted, conversation_status.count_session, conversation_tags.containment,
      conversation_tags.Saved_Amount]
    filters:
      conversation_tags.customer_retention_flow: 'Yes'
      conversation_tags.environment: Prod
      conversation_tags.created_date: after 2025/04/01
      conversation_tags.call_resolution: Escalation,User Hangup
      conversation_tags.vra_order_confirmed: 'Yes'
    sorts: [conversation_status.count_session desc]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: measure
      expression:
      label: Offer 2 Eligible
      value_format:
      value_format_name:
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: offer_2_eligible
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.offer2: '"ar_off",discount,"partial_refund_20","partial_refund_30","partial_refund_40","partial_refund_50"'
    - category: measure
      expression:
      label: Order Confirmed
      value_format:
      value_format_name:
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: order_confirmed
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.vra_order_confirmed: Order confirmed
    - category: measure
      expression:
      label: Canceled
      value_format:
      value_format_name:
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: canceled
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.Retention_Status: Cancelled
    - category: measure
      expression:
      label: Retained
      value_format:
      value_format_name:
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: retained
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.Retention_Status: Retained
    - category: measure
      expression:
      label: Order Confirmed Copy
      value_format:
      value_format_name:
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: order_confirmed_copy
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.vra_order_confirmed: Order confirmed
    - category: measure
      expression:
      label: Refund Eligible Copy
      value_format:
      value_format_name:
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: refund_eligible_copy
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.vra_partial_refund: Eligible
    - category: measure
      expression:
      label: Offer 2 Presented
      value_format:
      value_format_name:
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: offer_2_presented
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.offer_presented2: 'Yes'
    - category: measure
      expression:
      label: Offer 2 Accepted
      value_format:
      value_format_name:
      based_on: conversation_tags.count_conversation
      _kind_hint: measure
      measure: offer_2_accepted
      type: count_distinct
      _type_hint: number
      filters:
        conversation_tags.offer_accepted2: 'Yes'
    - category: dimension
      expression: 'if(${conversation_tags.offer1}="partial_refund", "Ineligible",${conversation_tags.offer1}) '
      label: Offer 1
      value_format:
      value_format_name:
      dimension: offer_1_1
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: 'if(${conversation_tags.offer2}="partial_refund", "Ineligible",${conversation_tags.offer2}) '
      label: Offer 2
      value_format:
      value_format_name:
      dimension: offer_2_1
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: 'if(${conversation_tags.offer3}="partial_refund", "Ineligible",${conversation_tags.offer3}) '
      label: Offer 3
      value_format:
      value_format_name:
      dimension: offer_3_1
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: 'if(${conversation_tags.offer4}="partial_refund", "Ineligible",${conversation_tags.offer4}) '
      label: Offer 4
      value_format:
      value_format_name:
      dimension: offer_4_1
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: if(${conversation_tags.vra_order_confirmed}="Yes","Order Confirmed","Order
        Not Confirmed")
      label: Order Confirmation
      value_format:
      value_format_name:
      dimension: order_confirmation
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: if(${conversation_tags.call_resolution}="Escalation","Escalated","Contained")
      label: Contact Resolution
      value_format:
      value_format_name:
      dimension: contact_resolution
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: |-
        if(${conversation_tags.offer_accepted1}=yes,${conversation_tags.offer1},
          if(${conversation_tags.offer_accepted2}=yes,${conversation_tags.offer2},
            if(${conversation_tags.offer_accepted3}=yes,${conversation_tags.offer3},
              if(${conversation_tags.offer_accepted4}=yes,${conversation_tags.offer4},"NA"))))
      label: Offer Accepted
      value_format:
      value_format_name:
      dimension: offer_accepted
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: |-
        if(${conversation_tags.offer_presented1}=yes,${conversation_tags.offer1},
          if(${conversation_tags.offer_presented2}=yes,${conversation_tags.offer2},
            if(${conversation_tags.offer_presented3}=yes,${conversation_tags.offer3},
              if(${conversation_tags.offer_presented4}=yes,${conversation_tags.offer4},"NA"))))
      label: Offer Presented
      value_format:
      value_format_name:
      dimension: offer_presented
      _kind_hint: dimension
      _type_hint: string
    - category: table_calculation
      expression: 'if(${conversation_tags.offer1}="partial_refund", "Ineligible",${conversation_tags.offer1}) '
      label: Offer 1
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: offer_1
      _type_hint: string
      is_disabled: true
    - category: table_calculation
      expression: 'if(${conversation_tags.offer2}="partial_refund", "Ineligible",${conversation_tags.offer2}) '
      label: Offer 2
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: offer_2
      _type_hint: string
      is_disabled: true
    - category: table_calculation
      expression: 'if(${conversation_tags.offer3}="partial_refund", "Ineligible",${conversation_tags.offer3}) '
      label: Offer 3
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: offer_3
      _type_hint: string
      is_disabled: true
    - category: table_calculation
      expression: 'if(${conversation_tags.offer4}="partial_refund", "Ineligible",${conversation_tags.offer4}) '
      label: Offer 4
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: offer_4
      _type_hint: string
      is_disabled: true
    - category: table_calculation
      expression: "${offer_2_accepted}/${offer_2_presented}"
      label: Offer Acceptance Rate
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: offer_acceptance_rate
      _type_hint: number
      is_disabled: true
    filter_expression: "${conversation_tags.offer_accepted1}=yes OR ${conversation_tags.offer_accepted2}=yes\
      \ OR ${conversation_tags.offer_accepted3}=yes OR ${conversation_tags.offer_accepted4}=yes"
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
    series_labels: {}
    color_range: ["#1A73E8", "#12B5CB", "#E52592", "#E8710A", "#F9AB00", "#7CB342",
      "#9334E6", "#80868B", "#079c98", "#A8A116", "#EA4335", "#FF8168"]
    label_type: name_value
    show_null_points: true
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: offer_1_eligible, id: offer_1_eligible,
            name: Offer 1 Eligible}, {axisId: offer_1_presented, id: offer_1_presented,
            name: Offer 1 Presented}, {axisId: offer_1_accepted_1, id: offer_1_accepted_1,
            name: Offer 1 Accepted}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: offer_acceptance_rate, id: offer_acceptance_rate,
            name: Offer Acceptance Rate}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    font_size: '15'
    point_style: circle
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
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: true
    isStepped: false
    orientation: rows
    labelPosition: left
    labelOverlap: false
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    charts_across:
    hidden_pivots: {}
    defaults_version: 1
    value_labels: legend
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen: {}
    row: 21
    col: 0
    width: 8
    height: 6
