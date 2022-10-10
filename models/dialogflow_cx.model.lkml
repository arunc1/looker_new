connection: "voice_stage"

# include all the views
include: "/views/**/*.view"

datagroup: dialogflow_cx_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: dialogflow_cx_default_datagroup


explore: event {
  join: event_type {
    type: left_outer
    sql_on: ${event.session_id}=${event_type.session_id} ;;
    relationship: many_to_one
  }
}

explore: flow_page {}

explore: parameters {}

explore: event_type {}

explore: conversation_status {}

explore: test {}


week_start_day: sunday
