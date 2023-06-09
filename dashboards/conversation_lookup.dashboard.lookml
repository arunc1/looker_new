- dashboard: conversation_lookup
  title: Conversation Lookup
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100

  filters:

  elements:
    - name: Transcripts
      explore: event
      type: looker_grid
      fields: [session_id,operation]
      header_font_size: 12
      rows_font_size: 12
