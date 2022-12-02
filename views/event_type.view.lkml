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
        sql: ${event_value} in ("welcome_norton_loggedin") ;;
        label: "Norton HC Logged In Benefits"
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
        sql: ${event_value} in ("%lifelock") ;;
        label: "Lifelock"
      }
      # possibly more when statements
      else: "Norton"
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

  # Dimesion to identify the status of ANI lookup

  dimension: ani_status{
    description: "Ani Lookup SUCCESS/FAIL"
    type:  string
    case: {
      when: {
        sql: ${event_value} in ("account.lookup_by_ani.success") ;;
        label: "ANI Lookup Success"
      }
      when: {
        sql: ${event_value} in ("account.lookup_by_ani.failed") ;;
        label: "ANI Lookup Failed"
      }
     else: "Other"
    }
  }

  measure: ani_lookup_success {
    label: "Lookup Success"
    type: count_distinct
    sql:${event_value} in ("account.lookup_by_ani.success","account.lookup_by_email.success","account.lookup_by_ssn4_yob_ani.success",
"account.lookup_by_ssn4_yob_zip.success") where ${page_name} != "%authenticate" ;;
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




  # Measure created to count Ghost calls

  measure: ghost_calls {
    label: "Ghost Calls"
    type: count_distinct
    sql: ${session_id} ;;
    filters: [event_value: "sys.no-input-3", flowname: "Default Start Flow"]
  }
}
