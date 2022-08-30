view: events {
  sql_table_name: `support-df-cx-26hwzn7k.df_cx_iva.events`
    ;;

  dimension: insert_id {
    label: "Conversation Turn"
    type: string
    sql: ${TABLE}.insertId ;;
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

  dimension: request_type {
    description: "request/response"
    type: string
    sql: ${TABLE}.Request_type ;;
  }

  dimension: session_id {
    label: "Conversation Id"
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: source {
    description: "Agent or Customer"
    type: string
    sql: ${TABLE}.Source ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.Text ;;
  }

  measure: count_session {
    label: "Conversation Count"
    type: count_distinct
    sql: ${session_id} ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
