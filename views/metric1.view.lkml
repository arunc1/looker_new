view: metric1 {
  sql_table_name: `support-df-cx-26hwzn7k.df_cx_iva.metric1`
    ;;

  dimension: flowid {
    type: string
    sql: ${TABLE}.flowid ;;
  }

  dimension: flowname {
    type: string
    sql: ${TABLE}.flowname ;;
  }

  dimension: insert_id {
    type: string
    sql: ${TABLE}.insertId ;;
  }

  dimension: page_id {
    type: string
    sql: ${TABLE}.pageId ;;
  }

  dimension: page_name {
    type: string
    sql: ${TABLE}.pageName ;;
  }

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

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: step {
    type: string
    sql: ${TABLE}.Step ;;
  }

  measure: count {
    type: count
    drill_fields: [flowname, page_name]
  }
}
