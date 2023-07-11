view: conversation_tags {
  sql_table_name: `support-df-cx-26hwzn7k.df_cx_iva.conversation_tags` ;;

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }
  dimension: tags {
    type: string
    sql: ${TABLE}.tags ;;
  }
  measure: count {
    type: count
  }
}
