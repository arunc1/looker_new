- dashboard: conversation_lookup
  title: Conversation Lookup
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Transcript
    name: Transcript
    model: dialogflow_cx
    explore: conversation_status
    type: looker_grid
    fields: [session_id, operation]
    filters: {}
    sorts: []
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
    truncate_column_names: false
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    listen:
      Conversation Name: dialogflow_cx.conversation_name
    row: 6
    col: 0
    width: 24
    height: 7
