view: conversation_intents {
  sql_table_name: `support-df-cx-26hwzn7k.df_cx_iva.conversation_intents` ;;

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }
  dimension: tag {
    type: string
    sql: ${TABLE}.tag ;;
  }
  measure: count {
    type: count
  }
}
