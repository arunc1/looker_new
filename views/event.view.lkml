view: event {
  sql_table_name: `support-df-cx-26hwzn7k.df_cx_iva.event`
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

  dimension: matched_intent {
    type: string
    sql: ${TABLE}.matchedIntent ;;
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

  dimension: operation {
    label: "Call Type"
    description: "Whether conversation was a Transfer, Disconnect, or Hangup"
    type: string
    sql: ${TABLE}.operation ;;
  }

  dimension: dk_sessionid_insertid {
    hidden: yes
    type: string
    sql: CONCAT(${session_id}, ${insert_id}) ;;
  }

  dimension: is_conversation_escalated{
    type: yesno
    sql: ${operation} = "TRANSFER";;
  }

  measure: minimum_timestamp {
    label: "Start Call Time"
    type: date_time
    sql: MIN(${receive_timestamp_raw}) ;;
  }

  measure: maximum_timestamp {
    label: "End Call Time"
    type: date_time
    sql: MAX(${receive_timestamp_raw}) ;;
  }

  measure: count_session {
    label: "Conversation Count"
    type: count_distinct
    sql: ${session_id} ;;
  }

  measure: count_insertid_per_session {
    label: "Conversation Turn Count"
    type: count_distinct
    sql: ${dk_sessionid_insertid} ;;
  }
  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
