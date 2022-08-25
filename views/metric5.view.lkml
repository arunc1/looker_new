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

  measure: count {
    type: count
    drill_fields: []
  }
}
