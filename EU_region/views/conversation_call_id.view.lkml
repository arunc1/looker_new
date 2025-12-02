view: conversation_call_id {
  sql_table_name: `support-df-stage-yikgre.df_cx_iva_eu.conversation_call_id` ;;

  dimension: call_id {
    type: string
    sql: ${TABLE}.call_id ;;
  }
  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }
  measure: count {
    type: count
  }
}
