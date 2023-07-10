  view: web_sp_otp_conv  {
    derived_table: {
      explore_source: conversation_status {
        column: session_count { field: event_type.session_count }
        column: receive_timestamp_date { field: event_type.receive_timestamp_date }
        filters: {
          field: event_type.event_value
          value: "\"welcome_sp_otp\""
        }
      }
    }
    dimension: session_count {
      label: "Event Type Conversation Count"
      description: ""
      type: number
    }
    dimension: receive_timestamp_date {
      description: ""
      type: date
    }
  }
