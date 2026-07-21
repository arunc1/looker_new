connection: "voice_stage"
label: "Automation-IVA"

# include all the views
include: "/views/**/*.view"

datagroup: dialogflow_cx_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "12 hour"
}

persist_with: dialogflow_cx_default_datagroup

explore: event {
  hidden: yes
}
explore: flow_page {
  hidden: yes
}
explore: parameters {
  hidden: yes
}
explore: event_type {
  hidden: yes
}
explore: conversation_turn_per_session  {
  hidden: yes
}

explore: conversation_status {
  label: "IVA-Conversations"
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
  join: conversation_call_id {
    type: left_outer
    sql_on: ${conversation_status.session_id} =${conversation_call_id.session_id};;
    relationship: one_to_one
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
  join: conversation_tags {
    type: left_outer
    sql_on: ${conversation_status.session_id}=${conversation_tags.session_id} ;;
    relationship: many_to_one
  }
  join: conversations_agent_environment {
    type: left_outer
    sql_on: ${conversation_status.session_id}=${conversations_agent_environment.session_id} ;;
    relationship: many_to_many
  }

  join: NGPVRA_Offers {
    type: left_outer
    sql_on: ${conversation_status.session_id} =${NGPVRA_Offers.session_id};;
    relationship: one_to_one
  }

}

explore: conversation_tags {
  label: "IVA-Conversation Tags"
}

explore: last_use_case {
  label: "Conversations-Last Use Case"
}

explore: NGPVRA_Offers {
  label: "NGPVRA-Offers"
}

week_start_day: sunday
