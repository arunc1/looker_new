view: last_use_case {
  sql_table_name: `support-df-cx-26hwzn7k.df_cx_iva.last_use_case` ;;

  dimension: brand {
    label: "Brand"
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension_group: created {
    label: "Created Date"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: queue {
    label: "Routing Queue"
    type: string
    sql: ${TABLE}.queue ;;
  }
  dimension: session_id {
    label: "Conversation id"
    type: string
    sql: ${TABLE}.session_id ;;
  }
  dimension: use_case {
    label: "Use Case"
    type: string
    sql: ${TABLE}.use_case ;;
  }
 measure: conversation_count {
   label: "Conversation Count"
   type: count_distinct
   sql: ${TABLE}.session_id ;;
 }


}
