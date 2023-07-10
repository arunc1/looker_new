view: event_values_array {
  derived_table: {
    sql: SELECT
        event_type.session_id,
        ARRAY_AGG(DISTINCT event_type.EventValue ORDER BY event_type.EventValue ASC) AS events
      FROM
        `support-df-cx-26hwzn7k.df_cx_iva.event_type` AS event_type
      WHERE
        event_type.EventValue != ''
      GROUP BY
        1
      HAVING
        'welcome_sp_otp' IN UNNEST(events) AND
        'session.auth.success' IN UNNEST(events)
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: events {
    type: string
    sql: ${TABLE}.events ;;
  }

  set: detail {
    fields: [
        session_id,
  events
    ]
  }
}
