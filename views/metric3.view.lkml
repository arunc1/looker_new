view: metric3 {
  sql_table_name: `support-df-cx-26hwzn7k.df_cx_iva.metric3`
    ;;

  dimension: insertid {
    label: "ConversationTurn"
    type: string
    sql: ${TABLE}.insertid ;;
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

  measure: total_parameter_count {
    type: count_distinct
    sql: ${dk_sessionid_insertid_parametername} ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [parameter_name]
  }
}
