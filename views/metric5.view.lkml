view: metric5 {
  sql_table_name: `support-df-cx-26hwzn7k.df_cx_iva.metric5`
    ;;

  dimension: insert_id {
    type: string
    sql: ${TABLE}.insertId ;;
  }

  dimension: last_text {
    type: string
    sql: ${TABLE}.last_text ;;
  }

  dimension: operation {
    type: string
    sql: ${TABLE}.operation ;;
  }

  dimension: session_id {
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
  }

  dimension: end_call {
    description: "Conversations that end in End_Call Page"
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

#  description: "Conversations that end in Escalate Page"
