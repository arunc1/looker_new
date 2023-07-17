view: conversation_tags {
  sql_table_name: `support-df-cx-26hwzn7k.df_cx_iva.conversation_tags` ;;

  dimension_group: created {
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
    description: "Conversations that haven't been transfered to live agent.
    It can have two statuses: disconnect and hangup"
    type: count_distinct
    sql: ${TABLE}.session_id ;;
    filters:[tags:"%operation:disconnect, operation:hangup%"]
  }

  measure: escalated {
    label: "Escalated Conversations"
    description: "Conversations that have been transfered to a live agent"
    type: count_distinct
    sql: ${TABLE}.session_id ;;
    filters:[tags:"%operation:transfer%"]
  }

  dimension: welcome_sp_otp_escalated {
    label: "Norton HC Logged In Escalated"
    type: yesno
    sql: ${tags} LIKE "%event:custom_event:welcome_sp_otp%" AND ${tags} LIKE "%operation:transfer%";;
  }


  measure: count {
    type: count
  }
}
