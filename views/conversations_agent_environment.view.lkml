view: conversations_agent_environment {
  sql_table_name: `support-df-cx-26hwzn7k.df_cx_iva.conversations_agent_environment` ;;

  dimension: agent_id {
    type: string
    sql: ${TABLE}.agent_id ;;
  }
  dimension: environment_id {
    type: string
    sql: ${TABLE}.environment_id ;;
  }
  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }
  measure: count {
    type: count
  }
}
