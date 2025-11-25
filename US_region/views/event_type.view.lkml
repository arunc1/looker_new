view: event_type {
  sql_table_name: `support-df-stage-yikgre.df_cx_iva_us.event_type`
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

  dimension: origin_tfn {
    type: string
    case: {
      when: {
        sql: ${event_value} in ("welcome_norton") ;;
        label: "Norton"
      }
      when: {
        sql: ${event_value} in ("welcome_norton_priority") ;;
        label: "Norton Priority"
      }
      when: {
        sql: ${event_value} in ("welcome_lifelock") ;;
        label: "LifeLock"
      }
      when: {
        sql: ${event_value} in ("welcome_lifelock_priority") ;;
        label: "LifeLock Priority"
      }
      when: {
        sql: ${event_value} in ("welcome_norton_tech") ;;
        label: "Norton Tech"
      }
      when: {
        sql: ${event_value} in ("welcome_eb_us") ;;
        label: "Employee Benefits"
      }
      when: {
        sql: ${event_value} in ("welcome_sp_otp") ;;
        label: "Norton HC Logged In"
      }

      when: {
        sql: ${event_value} in ("welcome_l2_alerts") ;;
        label: "L2 Alerts"
      }

      when: {
        sql: ${event_value} in ("welcome_avast") ;;
        label: "Avast"
      }

      when: {
        sql: ${event_value} in ("welcome_avg") ;;
        label: "AVG"
      }

      # possibly more when statements
      else: "Other"
    }
  }

  #Brand Split by Welcome event value
  dimension: brand {
    type: string
    label: "Brand"
    case: {
      when: {
        sql: ${event_value} in ("welcome_lifelock_priority", "welcome_lifelock") ;;
        label: "Lifelock"
      }
      when: {
        sql: ${event_value} in ("welcome_l2_alerts") ;;
        label: "L2 ALerts"
      }
      # possibly more when statements
      else: "Norton"
    }
  }


  dimension: l1_l2{
    label: "Call Type(L1/L2)"
    type:  string
    case: {
      when: {
        sql: ${origin_tfn} in ("Norton", "Norton Priority","LifeLock", "LifeLock Priority",
          "Norton Tech", "Employee Benefits","Norton HC Logged In") ;;
        label: "L1"
      }
      when: {
        sql:${origin_tfn} in ("L2 Alerts") ;;
        label: "L2"
      }
      else: "Other"
    }
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

  measure: ani_lookup_success {
    label: "Lookup Success"
    type: count_distinct
    sql:${event_value} IN ("account.lookup_by_ani.success","account.lookup_by_email.success","account.lookup_by_ssn4_yob_ani.success",
      "account.lookup_by_ssn4_yob_zip.success")
            AND ${page_name} != "%authenticate" ;;
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

  # Measure created to count Ghost calls

  measure: ghost_calls {
    label: "Ghost Calls"
    type: count_distinct
    sql: ${session_id} ;;
    filters: [event_value: "sys.no-input-3", flowname: "Default Start Flow"]
  }
  measure: ghost_calls_percentage {
    label: "%Ghost Calls"
    type: number
    value_format_name: percent_2
    sql: ${ghost_calls}/${session_count} ;;
  }
}
