view: conversation_turn_per_session {
  derived_table: {
    sql: SELECT
          (DATE(conversation_status.receiveTimestamp , 'America/Los_Angeles')) AS conversation_status_receive_timestamp_date,
          conversation_status.session_id,
          COUNT(DISTINCT conversation_status.insertId) as conversation_turn_count
      FROM `support-df-cx-26hwzn7k.df_cx_iva.conversation_status`
           AS conversation_status

      GROUP BY
          conversation_status_receive_timestamp_date,
          conversation_status.session_id
      ORDER BY
          conversation_turn_count DESC
       ;;
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

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_session {
    label: "Conversation Count"
    type: count_distinct
    sql: ${session_id} ;;
  }

  dimension: conversation_status_receive_timestamp_date {
    type: date
    datatype: date
    sql: ${TABLE}.conversation_status_receive_timestamp_date ;;
  }

  dimension: session_id {
    label: "Conversation ID"
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: conversation_turn_count {
    label: "Turn Number"
    type: number
    sql: ${TABLE}.conversation_turn_count ;;
  }

  set: detail {
    fields: [conversation_status_receive_timestamp_date, session_id, conversation_turn_count]
  }
}
