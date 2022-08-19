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

  # Within a conversation how many times a particular page is triggered?
  # Use → SessionID + InsertID + PageID
  dimension: dk_session_id_insert_id_page_id{
    type: string
    sql:  CONCAT(${session_id},${insert_id},${page_id}) ;;
  }

  # Across all the conversation, how many times a page was triggered?
  dimension: dk_session_id_page_id {
    hidden: yes
    type: string
    sql: CONCAT(${session_id},${page_id}}) ;;
  }

  # Within a conversation, how many times a particular flow is invoked?
  # Use → SessionID + InsertID + FlowID
  dimension: dk_session_id_insert_id_flowid{
    hidden: yes
    type: string
    sql:  CONCAT(${session_id},${insert_id},${flowid}) ;;
  }

  # Across all the conversation, how many conversations invoked a contact agent?
  # Use Session Level → not include InsertID
  dimension: dk_session_id_flowid {
    hidden: yes
    type: string
    sql: CONCAT(${session_id},${flowid}} ;;
  }

  # of times a page was triggered
  measure: distinct_page_count {
    type: count_distinct
    sql: ${dk_session_id_insert_id_page_id} ;;
  }

  measure: distinct_flow_count {
    type: count_distinct
    sql: ${dk_session_id_insert_id_flowid} ;;
  }

  measure: total_flow_count {
    type: count_distinct
    sql: ${dk_session_id_flowid} ;;
  }

  measure: total_page_count {
    type: count_distinct
    sql: ${dk_session_id_page_id} ;;
  }

  measure: count {
    type: count
    drill_fields: [flowname, page_name]
  }


}
