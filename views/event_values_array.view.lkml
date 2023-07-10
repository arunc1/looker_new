view: event_values_array {
  derived_table: {
    sql: WITH event_values_array AS (SELECT
        event_type.session_id,
        ARRAY_TO_STRING(ARRAY_AGG(DISTINCT event_type.EventValue ORDER BY event_type.EventValue ASC), '|') AS events
      FROM
        `support-df-cx-26hwzn7k.df_cx_iva.event_type` AS event_type
      WHERE
        event_type.EventValue != ''
      GROUP BY
        1
      )
      SELECT
          COUNT(*) AS event_values_array_count
      FROM `support-df-cx-26hwzn7k.df_cx_iva.event`
           AS event
      INNER JOIN event_values_array ON event.session_id=event_values_array.session_id
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
