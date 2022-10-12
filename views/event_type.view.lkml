view: event_type {
  sql_table_name: `support-df-cx-26hwzn7k.df_cx_iva.event_type`
    ;;

  dimension: event_type {
    type: string
    sql: ${TABLE}.EventType ;;
  }

  dimension: event_value {
    type: string
    sql: ${TABLE}.EventValue ;;
  }

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

  # Dimesion to identify the status of ANI lookup

  dimension: ani_status{
    description: "Ani Lookup SUCCESS/FAIL"
    type:  string
    sql: CASE WHEN ${event_value} = "account.lookup_by_ani.success" THEN "ANI Lookup Success"
    WHEN ${event_value} = "account.lookup_by_ani.failed" THEN "ANI Lookup Failed"
  END;;
  }

  measure: session_count {
    label: "Conversation Count"
    type: count_distinct
    sql: ${session_id} ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [flowname, page_name]
  }

  #Measure to count ani_status/conversation

  measure: ani_status_count {
  label: "Ani Status Count"
  type: count_distinct
  sql: ${session_id};;
  }


  # Measure created to count Ghost calls

  measure: ghost_calls {
    label: "Ghost Calls"
    type: count_distinct
    sql: ${session_id} ;;
    filters: [event_value: "sys.no-input-3", flowname: "Default Start Flow"]
  }
}
