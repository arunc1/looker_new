view: flow_page {
  sql_table_name: `support-df-stage-yikgre.df_cx_iva_us.flow_page`
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
    label: "Conversation Turn"
    type: string
    sql: ${TABLE}.insertId ;;
  }

  dimension: matched_intent {
    type: string
    sql: ${TABLE}.matchedIntent ;;
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
    label: "Conversation Id"
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: step {
    type: string
    sql: ${TABLE}.Step ;;
  }

  # Within a conversation, how many times a particular flow is invoked?
  # Use → SessionID + InsertID + FlowID
  dimension: dk_session_id_insert_id_flowid{
    hidden: yes
    type: string
    sql:  CONCAT(${session_id},${insert_id},${flowid}) ;;
  }

  # Across all the conversation
  # Use Session Level → not include InsertID
  dimension: dk_session_id_flowid {
    hidden: yes
    type: string
    sql: CONCAT(${session_id},${flowid}) ;;
  }
  # Within a conversation how many times a particular page is triggered?
  # Use → SessionID + InsertID + PageID
  dimension: dk_session_id_insert_id_page_id{
    hidden: yes
    type: string
    sql:  CONCAT(${session_id},${insert_id},${page_id}) ;;
  }

  # Across all the conversation, how many times a page was triggered?
  dimension: dk_session_id_page_id {
    hidden: yes
    type: string
    sql: CONCAT(${session_id},${page_id}) ;;
  }

  # Across all the conversation
  # Use Session Level → not include InsertID
  dimension: dk_session_id_matchedIntent {
    hidden: yes
    type: string
    sql: CONCAT(${session_id},${matched_intent}) ;;
  }

  # Within a conversation, including conversation turn
  measure: distinct_flow_count {
    description: "Within a conversation, includes conversation turn"
    type: count_distinct
    sql: ${dk_session_id_insert_id_flowid} ;;
  }

  measure: session_count {
    label: "Conversation Count"
    type: count_distinct
    sql: ${session_id} ;;
  }

  # Across all the conversation
  measure: total_flow_count {
    description: "Flow count across all conversations"
    type: count_distinct
    sql: ${dk_session_id_flowid} ;;
  }

  measure: total_count_matchedIntent {
    type: count_distinct
    sql:${dk_session_id_matchedIntent} ;;
  }

  # Within a conversation how many times a particular page is triggered?
  measure: distinct_page_count {
    description: "Within a conversation, times particular flow is triggered"
    type: count_distinct
    sql: ${dk_session_id_insert_id_page_id} ;;
  }

  # Across all conversations
  measure: total_page_count {
    description: "Page count across all Conversation"
    type: count_distinct
    sql: ${dk_session_id_page_id} ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [flowname, page_name]
  }
}
