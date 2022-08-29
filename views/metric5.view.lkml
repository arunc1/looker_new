view: metric5 {
  sql_table_name: `support-df-cx-26hwzn7k.df_cx_iva.metric5`
    ;;

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

  dimension: insert_id {
    label: "Conversation Turn"
    type: string
    sql: ${TABLE}.insertId ;;
  }

  dimension: last_text {
    description: "Last text before call transfer / call disconnect"
    type: string
    sql: ${TABLE}.last_text ;;
  }

  dimension: operation {
    label: "Call Type"
    description: "Call Transfer, Disconnect, Hangup"
    type: string
    sql: ${TABLE}.operation ;;
  }

  dimension: session_id {
    label: "Conversation ID"
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: escalated_contained {
    case: {
      when: {
        sql: ${TABLE}.operation = "TRANSFER" ;;
        label: "Escalated"}
      else: "Contained"
    }
    description: "Call Escalated vs Call Contained"
  }

  measure: count_session {
    label: "Conversation Count"
    type: count_distinct
    sql: ${session_id} ;;
  }
  measure: count {
    hidden: yes
    label: "Total Count"
    type: count
    drill_fields: []
  }
}
