view: last_use_case {
  sql_table_name: `support-df-cx-26hwzn7k.df_cx_iva.last_use_case` ;;

  dimension: brand {
    label: "Brand"
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension_group: created {
    label: "Created Date"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: queue {
    label: "Routing Queue(no)"
    type: string
    sql: ${TABLE}.queue ;;
  }
  dimension: session_id {
    label: "Conversation id"
    type: string
    sql: ${TABLE}.session_id ;;
  }
  dimension: use_case {
    label: "Use Case"
    type: string
    sql: ${TABLE}.use_case ;;
  }
 measure: conversation_count {
   label: "Conversation Count"
   type: count_distinct
   sql: ${TABLE}.session_id ;;
 }
  dimension: routing_queue {
    label: "Routing Queue"
    type: string
    case: {
      when: {
        sql:  ${queue}="55.0";;
        label: "AVAST-Account Services(55)"
      }
      when: {
        sql:  ${queue}="54.0";;
        label: "AVAST-Tech(54)"
      }
      when: {
        sql:  ${queue}="56.0";;
        label: "AVAST-Refund(56)"
      }
      when: {
        sql:  ${queue}="50.0";;
        label: "AVAST-PTS(50)"
      }
      when: {
        sql:  ${queue}="43.0";;
        label: "AVG-Account Services(43)"
      }
      when: {
        sql:  ${queue}="42.0";;
        label: "AVG-Tech(42)"
      }
      when: {
        sql:  ${queue}="44.0";;
        label: "AVG-Refund(44)"
      }
      when: {
        sql:  ${queue}="45.0";;
        label: "AVG-PTS(45)"
      }
      # possibly more when statements
      else: "Other"
    }
  }


}
