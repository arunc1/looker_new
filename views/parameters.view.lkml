view: parameters {
  sql_table_name: `support-df-cx-26hwzn7k.df_cx_iva.parameters`
    ;;

  dimension: insertid {
    label: "ConversationTurn"
    type: string
    sql: ${TABLE}.insertid ;;
  }

  dimension: matched_intent {
    type: string
    sql: ${TABLE}.matchedIntent ;;
  }

  dimension: parameter_name {
    type: string
    sql: ${TABLE}.parameter_name ;;
  }

  dimension: parameter_value {
    type: string
    sql: ${TABLE}.parameter_value ;;
  }

  dimension_group: receive_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.receiveTimestamp ;;
  }

  dimension: session_id {
    label: "ConversationID"
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: dk_sessionid_insertid_parametername {
    hidden: yes
    type: string
    sql: CONCAT(${session_id}, ${insertid}, ${parameter_name}) ;;
  }

  dimension: l1_session_ids {
    label: "L1SessionIds"
    type: string
    sql: (
          SELECT distinct session_id FROM `support-df-cx-26hwzn7k.df_cx_iva.parameters`
      where parameter_name ='use_case'
      and session_id not in (
      SELECT distinct session_id FROM `support-df-cx-26hwzn7k.df_cx_iva.parameters`
      where parameter_value ='alerts_l2')
    );;
  }


  # Ability to count # of times a parameter was set to a particular value, within a conversation.
  measure: total_parameter_count {
    description: "Within a conversation, total parameter count"
    type: count_distinct
    sql: ${dk_sessionid_insertid_parametername} ;;
  }

  measure: session_count {
    label: "Conversation Count"
    type: count_distinct
    sql: ${session_id} ;;
  }

  measure: l2_alerts_calls {
    label: "L2Alerts Calls"
    type: count_distinct
    sql: ${session_id} ;;
    filters: [parameter_value: "alerts_l2"]
  }

  measure: count_use_case {
    label: "count_use_case"
    type: count_distinct
    sql: ${session_id} ;;
    filters: [parameter_name: "use_case"]
  }

  measure: l1 {
    label: "test_l1"
    type: string
    sql: ${count_use_case}-${l2_alerts_calls} ;;
  }


  measure: count {
    hidden: yes
    type: count
    drill_fields: [parameter_name]
  }
}
