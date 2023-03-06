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
    filters: [parameter_value: "l2_alerts"]
  }


  measure: count {
    hidden: yes
    type: count
    drill_fields: [parameter_name]
  }

  dimension: has_l2 {
    type: yesno
    sql: ${parameter_value} = 'l2_alerts' ;;
  }

  dimension: has_l1 {
    type: yesno
    sql: ${parameter_value} is_null OR ${parameter_value} != 'l2_alerts' ;;
  }
}
