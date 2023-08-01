view: conversation_tags_static {
  sql_table_name: `support-df-cx-26hwzn7k.df_cx_iva.conversation_tags_static` ;;

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }
  dimension: tags {
    type: string
    sql: ${TABLE}.tags ;;
  }
  measure: count_conversation {
    label: "Conversation Count"
    type: count_distinct
    sql: ${session_id} ;;
  }

  #brand
  dimension: origin_tfn {
    label: "Brand"
    type: string
    case: {
      when: {
        sql:  ${tags} LIKE "%parameter:tfn_company:norton%" OR ${tags} LIKE "%parameter:tfn_company:nortonvip%";;
        label: "Norton"
      }
      when: {
        sql:  ${tags} LIKE "%parameter:tfn_company:ll%" OR ${tags} LIKE "%parameter:tfn_company:llvip%";;
        label: "Lifelock"
      }
      when: {
        sql:  ${tags} LIKE "%parameter:tfn_company:eb_us%";;
        label: "Employee Benefits"
      }
      when: {
        sql:  ${tags} LIKE "%parameter:tfn_company:login_error_20008%";;
        label: "Login Error"
      }
      when: {
        sql:  ${tags} LIKE "%parameter:tfn_company:avast%";;
        label: "Avast"
      }
      when: {
        sql:  ${tags} LIKE "%parameter:tfn_company:avg%";;
        label: "AVG"
      }
      # possibly more when statements
      else: "Other"
    }
  }

##dimensions - call resolution status(parameters)

  dimension: call_resolution {
    label: "Call Resolution Status"
    type: string
    case: {
      when: {
        sql:  ${tags} LIKE "%parameter:call_resolution:escalation%";;
        label: "Escalation"
      }
      when: {
        sql:  ${tags} LIKE "%parameter:call_resolution:disconnect%";;
        label: "Disconnect"
      }
      when: {
        sql:  ${tags} LIKE "%parameter:call_resolution:hangup%";;
        label: "Hangup"
      }
      # possibly more when statements
      else: "Other"
    }
  }


#measure authentication successfully OTP

  measure: auth_success_otp_count {
    label: "Authentication Success OTP-Count"
    type: count_distinct
    sql: ${TABLE}.session_id ;;
    filters:[tags:"%event:custom_event:session.auth_by_otp.success%"]
  }

  dimension: auth_success_otp {
    label: "Auth Success OTP"
    type: yesno
    sql: ${tags} LIKE "%event:custom_event:session.auth_by_otp.success%";;
  }

##measure created to define the conversations that started on the TFN mentioned on the support portal and for which we generate an OTP

  measure: welcome_sp_otp_count {
    label: "Norton HC Logged In Count"
    type: count_distinct
    sql: ${TABLE}.session_id ;;
    filters:[tags:"%event:custom_event:welcome_sp_otp%"]
  }

  dimension: welcome_sp_otp {
    label: "Norton HC Logged In"
    type: yesno
    sql: ${tags} LIKE "%event:custom_event:welcome_sp_otp%";;
  }

#measures and dimensions for escalation and containment using tags

  measure: contained {
    label: "Contained Conversations"
    description:"for avast only"
    type: number
    sql: ${count_conversation}-${escalated};;
  }

  measure: escalated {
    label: "Escalated Conversations"
    description: "Conversations that have been transfered to a live agent"
    type: count_distinct
    sql: ${TABLE}.session_id ;;
    filters:[tags:"%operation:transfer%, %parameter:call_resolution:escalated%"]
  }

  dimension: welcome_sp_otp_escalated {
    label: "Norton HC Logged In Escalated"
    type: yesno
    sql: ${tags} LIKE "%event:custom_event:welcome_sp_otp%" AND ${tags} LIKE "%operation:transfer%";;
  }

}
