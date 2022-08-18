view: scrubbed_dialogflow_cx_agent_logs {
  sql_table_name: `df_cx_iva.scrubbed_dialogflow_cx_agent_logs`
    ;;

  dimension_group: _partitiondate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONDATE ;;
  }

  dimension_group: _partitiontime {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONTIME ;;
  }

  dimension: insert_id {
    type: string
    sql: ${TABLE}.insertId ;;
  }

  dimension: json_payload {
    type: string
    sql: ${TABLE}.jsonPayload ;;
  }

  dimension: json_payload1__query_result__transcript {
    type: string
    sql: ${TABLE}.jsonPayload1.queryResult.transcript ;;
    group_label: "JSON Payload1 Query Result"
    group_item_label: "Transcript"
  }

  dimension: labels__agent_id {
    type: string
    sql: ${TABLE}.labels.agent_id ;;
    group_label: "Labels"
    group_item_label: "Agent ID"
  }

  dimension: labels__location_id {
    type: string
    sql: ${TABLE}.labels.location_id ;;
    group_label: "Labels"
    group_item_label: "Location ID"
  }

  dimension: labels__session_id {
    type: string
    sql: ${TABLE}.labels.session_id ;;
    group_label: "Labels"
    group_item_label: "Session ID"
  }

  dimension: log_name {
    type: string
    sql: ${TABLE}.logName ;;
  }

  dimension_group: receive_timestamp {
    type: time
    description: "bq-datetime"
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

  dimension: resource__labels__project_id {
    type: string
    sql: ${TABLE}.resource.labels.project_id ;;
    group_label: "Resource Labels"
    group_item_label: "Project ID"
  }

  dimension: resource__type {
    type: string
    sql: ${TABLE}.resource.type ;;
    group_label: "Resource"
    group_item_label: "Type"
  }

  dimension: severity {
    type: string
    sql: ${TABLE}.severity ;;
  }

  dimension_group: timestamp {
    type: time
    description: "bq-datetime"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  measure: count {
    type: count
    drill_fields: [log_name]
  }
}
