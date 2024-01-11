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
      year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: session_id {
    label: "Conversation Id"
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
    drill_fields: [created_date,session_id]
  }
  #channel type
  dimension: channel {
    label: "Channel"
    type: string
    case: {
      when: {
        sql:  ${tags} LIKE "%parameter:ccaip_channel:voice%";;
        label: "Voice"
      }
      when: {
        sql:  ${tags} LIKE "%parameter:ccaip_channel:chat%";;
        label: "Chat"
      }
      else: "Other"
    }
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
      else: "Other"
      }
  }

##dimensions - call resolution status(parameters)

  dimension: call_resolution {
    label: "Call Resolution Status"
    type: string
    case: {
      when: {
        sql:  ${tags} LIKE "%parameter:call_resolution:escalation%" OR ${tags} LIKE "%parameter:call_resolution:escalated%";;
        label: "Escalation"
      }
      when: {
        sql:  ${tags} LIKE "%parameter:call_resolution:disconnect%";;
        label: "Terminate"
      }
      when: {
        sql:  ${tags} LIKE "%parameter:call_resolution:hangup%";;
        label: "Hangup"
      }
      when: {
        sql:  ${tags} LIKE "%parameter:call_resolution:escalation_default_quque%";;
        label: "Escalation Default Queue"
      }
      when: {
        sql:  ${tags} LIKE "%parameter:call_resolution:disconnect%";;
        label: "Disconnect"
      }
      # possibly more when statements
      else: "Other"
    }
  }

  dimension: escalation_reason {
    label: "Escalation Reason"
    type: string
    case: {
      when: {
        sql:  ${tags} LIKE "%parameter:escalation_reason:no-intent-match%";;
        label: "No Match"
      }
      when: {
        sql:  ${tags} LIKE "%parameter:escalation_reason:solution_provided%";;
        label: "Solution Provided"
      }
      when: {
        sql:  ${tags} LIKE "%parameter:escalation_reason:no_solution_provided%";;
        label: "No Solution Provided"
      }
      # possibly more when statements
      else: "Other"
    }
  }

  dimension: termination_reason {
    label: "Termination Reason"
    type: string
    case: {
      when: {
        sql:  ${tags} LIKE "%parameter:termination_reason:ghost%";;
        label: "Ghost Call"
      }
      when: {
        sql:  ${tags} LIKE "%parameter:resolution_reason:ghost%";;
        label: "Ghost Call"
      }
      when: {
        sql:  ${tags} LIKE "%parameter:termination_reason:robocall%";;
        label: "Robocall"
      }
      when: {
        sql:  ${tags} LIKE "%parameter:resolution_reason:robocall%";;
        label: "Ghost Call"
      }
      when: {
        sql:  ${tags} LIKE "%parameter:termination_reason:resolved%";;
        label: "Resolved"
      }
      when: {
        sql:  ${tags} LIKE "%parameter:resolution_reason:resolved%";;
        label: "Resolved"
      }
      # possibly more when statements
      else: "Other"
    }
  }

  measure: ghost_call {
    label: "Ghost Calls"
    type: count_distinct
    sql: ${session_id} ;;
    filters: [is_ghost_call: "Yes"]
  }

  measure: ghost_call_percent {
    label: "%Ghost Calls"
    type: number
    value_format_name: percent_2
    sql: ${ghost_call}/${count_conversation} ;;
  }

  dimension: is_l2_alerts {
    label: "Is L2 Alerts?"
    type: yesno
    sql: ${tags} LIKE "%parameter:is_l2_alerts_call:true%" ;;
  }

  dimension: is_ghost_call {
    label: "Is Ghost Call"
    type: yesno
    sql: ${tags} LIKE "%parameter:resolution_reason:ghost%" ;;
  }


  measure: l2_alerts {
    label: "L2 Alerts"
    type: count_distinct
    sql: ${session_id} ;;
    filters: [is_l2_alerts: "Yes"]
  }

#measures and dimensions for escalation and containment using tags
  measure: contained {
    label: "Contained Conversations"
    type: number
    sql: ${count_conversation}-${total_escalated_calls};;
    drill_fields: [created_date,session_id]

  }

## 2 types of escalation from before and after Avaya cutover(17Aug2023)
  measure: escalated_call_resolution {
    label: "Escalated-Parameters"
    description: "Conversations that have been transfered to a live agent"
    type: count_distinct
    sql: ${TABLE}.session_id ;;
    filters:[tags:"%parameter:call_resolution:escalation%" ]
    drill_fields: [created_date,session_id]

  }

  measure: escalated_operation {
    label: "Escalated-Operation"
    description: "Conversations that have been transfered to a live agent"
    type: count_distinct
    sql: ${TABLE}.session_id ;;
    filters:[tags:"%operation:transfer%"]
    drill_fields: [created_date,session_id]
  }

  measure: total_escalated_calls {
    label: "Total Escalated Calls"
    type: number
    sql: ${escalated_call_resolution} ;;
  }

  measure: containment {
    label: "Containment"
    type: number
    value_format_name: percent_2
    sql: ${contained}/${count_conversation} ;;

  }

  dimension: welcome_sp_otp_escalated {
    label: "Norton HC Logged In Escalated"
    type: yesno
    sql: ${tags} LIKE "%event:custom_event:welcome_sp_otp%" AND ${tags} LIKE "%operation:transfer%";;
  }

  dimension: authentication_success {
    label: "Authentication-Success"
    type: yesno
    sql: ${tags} LIKE "%event:custom_event:session.auth.success%"
    AND ${tags} LIKE "%page_name:authenticate%";;
  }



  dimension: call_id_test {
    label: "Test Call ID"
    type: yesno
    sql: ${tags} LIKE "%parameter:call_id:1.0%";;
  }
#calls flow (for the moment we have only Sales but more values will follow)

  dimension: call_flow{
    label: "Call Flow"
    type: string
    case: {
      when: {
        sql:  ${tags} LIKE "%parameter:entry:sales_flow%";;
        label: "Sales"
      }
      when: {
        sql:  ${tags} LIKE "%parameter:entry:basic_call_flow%";;
        label: "Basic"
      }
      when: {
        sql:  ${tags} LIKE "%parameter:entry:welcome%";;
        label: "Automation"
      }
      else: "Other"
    }
  }

  measure: calls_sent_to_automation {
    label: "Calls Sent to Automation"
    type: count_distinct
    sql: ${TABLE}.session_id ;;
    filters:[tags:"%parameter:fromivr:true%"]
    drill_fields: [created_date, session_id]
    }

  measure: lookup_attempted {
    label: "Lookup Attempted"
    type: count_distinct
    sql: ${TABLE}.session_id ;;
    filters:[tags:"%parameter:lookup_status:success%,failed%"]
    drill_fields: [created_date, session_id]
  }

  measure: lookup_success {
    label: "Lookup Success"
    type: count_distinct
    sql: ${TABLE}.session_id ;;
    filters:[tags:"%parameter:lookup_status:success%"]
    drill_fields: [created_date, session_id]
  }

  measure: auth_success {
    label: "Auth Success"
    type: count_distinct
    sql: ${TABLE}.session_id ;;
    filters:[tags:"%parameter:auth_status:success%"]
    drill_fields: [created_date, session_id]
  }

  dimension: automation_call {
    label: "Automation Call"
    type: yesno
    sql: ${tags} LIKE "%parameter:entry:welcome%";;
  }

  measure: total_automation_calls{
    label: "Count - Automation Calls"
    type: count_distinct
    sql: ${TABLE}.session_id ;;
    filters:[tags:"%parameter:entry:welcome%"]
    drill_fields: [created_date, session_id]
  }

  dimension: is_sales_disconnected_call {
    label: "Is Sales Disconnected Call?"
    type: yesno
    sql: ${tags} LIKE "%parameter:resolution_reason:spam_msg_read%"
      AND ${tags} LIKE "%parameter:resolution_source:sales_spam_info%";;
  }



##Routing after escalation

dimension: routing_queue {
  label: "Routing Queue"
  type: string
  case: {
    when: {sql:  ${tags} LIKE "%parameter:menu_id:55%";;label: "AVAST -  Account Services (55)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:55%";;label: "AVAST -  Account Services (55)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:54%";;label: "AVAST -  Tech (54)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:56%";;label: "AVAST - Refund (56)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:43%";;label: "AVG -  Account Services (43)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:42%";;label: "AVG -  Tech (42)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:44%";;label: "AVG - Refund (44)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:331%";;label: "EB US ACCOUNT (331)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:121%";;label: "UHD Services Queue (121)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:138%";;label: "Computer Tuneup Queue (138)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:60%";;label: "LifeLock Alerts (60)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:56%";;label: "LifeLock IPA (56)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:80%";;label: "Acct Service Queue (80)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:89%";;label: "MAC (89)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:90%";;label: "Mobile (90)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:53%";;label: "IPA Upsell (53)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:88%";;label: "US WinSecurity (88)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:306%";;label: "LifeLock Retention (306)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:308%";;label: "Norton Renewals (308)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:81%";;label: "EN US CSP (81)"}
# possibly more when statements
    else: "Other"
  }
}
}
