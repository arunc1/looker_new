connection: "voice_stage"

# include all the views
include: "/views/**/*.view"

datagroup: dialogflow_cx_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: dialogflow_cx_default_datagroup

explore: event {}

explore: flow_page {}

explore: parameters {}

explore: event_type {}

explore: conversation_turn_per_session  {}

explore: conversation_status {
  join: event_type {
    type: left_outer
    sql_on: ${conversation_status.session_id} =${event_type.session_id};;
    relationship: many_to_many
  }
  join: parameters {
    type: left_outer
    sql_on: ${conversation_status.session_id} =${parameters.session_id};;
    relationship: many_to_many
  }
  join: flow_page {
    type: left_outer
    sql_on: ${conversation_status.session_id} =${flow_page.session_id};;
    relationship: many_to_many
  }
  join: event {
    type: left_outer
    sql_on: ${conversation_status.session_id} =${event.session_id};;
    relationship: many_to_many
  }
  join: conversation_turn_per_session {
    type: left_outer
    sql_on: ${conversation_status.session_id} =${conversation_turn_per_session.session_id};;
    relationship: many_to_many
  }
}


week_start_day: sunday
