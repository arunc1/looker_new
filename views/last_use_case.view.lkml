view: last_use_case {
  sql_table_name: `support-df-cx-26hwzn7k.df_cx_iva.last_use_case` ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: queue {
    type: string
    sql: ${TABLE}.queue ;;
  }
  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }
  dimension: use_case {
    type: string
    sql: ${TABLE}.use_case ;;
  }
  measure: count {
    type: count
  }
}
