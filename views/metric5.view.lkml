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
    label: ""
    description: "Call Transfer, Disconnect, Hangup"
    type: string
    sql: ${TABLE}.operation ;;
  }

  dimension: session_id {
    label: "Conversation ID"
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: call_status {
    case: {
      when: {
        sql: ${TABLE}.operation = "TRANSFER" ;;
        label: "escalate_call"}
      else: "end_call"
    }
    description: "Conversations that ended in Escalate Page or End_Call Page"
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

#  description: "Conversations that end in Escalate Page"
