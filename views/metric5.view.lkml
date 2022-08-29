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
    description: "Call Transfer, Disconnect, Hangup"
    hidden: yes
    type: string
    sql: ${TABLE}.operation ;;
  }

  dimension: session_id {
    label: "Conversation ID"
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: call_type {
    case: {
      when: {
        sql: ${TABLE}.operation = "TRANSFER" ;;
        label: "TRANSFER"}
      when: {
        sql: ${TABLE}.operation = "HANGUP" ;;
        label: "HANGUP"
      }
      else: "DISCONNECT"
    }
    description: "Call Transfer, Disconnect, Hangup"
  }



  measure: count {
    label: "Total Count"
    type: count
    drill_fields: []
  }
}
