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
      when: {
        sql:  ${tags} LIKE "%parameter:call_resolution:contactus_link%";;
        label: "Link to Contact Us"
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

  dimension: solution_type_voice{
    label: "Solution Type - Voice"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:solution_type_iva:full%";;        label: "Full Solution"}
      when: {sql:  ${tags} LIKE "%parameter:solution_type_iva:partial%";;     label: "Partial Solution"}
      when: {sql:  ${tags} LIKE "%parameter:solution_type_iva:escalate%";;    label: "Escalate"}
      else: "Other"
    }
  }

  dimension: solution_type_chat{
    label: "Solution Type - Chat"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:solution_type_chat:full%";;        label: "Full Solution"}
      when: {sql:  ${tags} LIKE "%parameter:solution_type_chat:partial%";;     label: "Partial Solution"}
      when: {sql:  ${tags} LIKE "%parameter:solution_type_chat:escalate%";;    label: "Escalate"}
      else: "Other"
    }
  }

  dimension: chat_origin{
    label: "Chat Origin"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:entry:hc_home_avast%";;           label: "HC Home Avast"}
      when: {sql:  ${tags} LIKE "%parameter:entry:hc_kb_avast%";;             label: "HC KB Avast"}
      when: {sql:  ${tags} LIKE "%parameter:entry:hc_search_avast%";;         label: "HC Search Avast"}
      when: {sql:  ${tags} LIKE "%parameter:entry:hc_home_avg%";;             label: "HC Home Avg"}
      when: {sql:  ${tags} LIKE "%parameter:entry:hc_kb_avg%";;               label: "HC KB Avg"}
      when: {sql:  ${tags} LIKE "%parameter:entry:hc_search_avg%";;           label: "HC Search Avg"}
      when: {sql:  ${tags} LIKE "%parameter:entry:hc_home_lifelock%";;        label: "HC Home Lifelock"}
      when: {sql:  ${tags} LIKE "%parameter:entry:hc_kb_lifelock%";;          label: "HC KB Lifelock"}
      when: {sql:  ${tags} LIKE "%parameter:entry:hc_search_lifelock%";;      label: "HC Search Lifelock"}
      when: {sql:  ${tags} LIKE "%parameter:entry:hc_home_norton%";;          label: "HC Home Norton"}
      when: {sql:  ${tags} LIKE "%parameter:entry:hc_kb_norton%";;            label: "HC KB Norton"}
      when: {sql:  ${tags} LIKE "%parameter:entry:hc_search_norton%";;        label: "HC Search Norton"}
      when: {sql:  ${tags} LIKE "%parameter:entry:hc_contactus_norton%";;     label: "HC Contactus Norton"}
      when: {sql:  ${tags} LIKE "%parameter:entry:hc_contactus_lifelock%";;   label: "HC Contactus Lifelock"}
      when: {sql:  ${tags} LIKE "%parameter:entry:hc_contactus_avast%";;      label: "HC Contactus Avast"}
      when: {sql:  ${tags} LIKE "%parameter:entry:hc_contactus_avg%";;        label: "HC Contactus Avg"}
      when: {sql:  ${tags} LIKE "%parameter:entry:hp_home_norton%";;          label: "Sales Norton"}
      when: {sql:  ${tags} LIKE "%parameter:entry:hp_home_lifelock%";;        label: "Sales Lifelock"}
      when: {sql:  ${tags} LIKE "%parameter:entry:hp_home_avast%";;           label: "Sales Avast"}
      when: {sql:  ${tags} LIKE "%parameter:entry:hp_home_avg%";;             label: "Sales Avg"}
      when: {sql:  ${tags} LIKE "%parameter:entry:ngp_dl_norton%";;           label: "NGP DL Norton"}
      when: {sql:  ${tags} LIKE "%parameter:entry:ngp_dash_norton%";;         label: "NGP Dashboard Norton"}
      when: {sql:  ${tags} LIKE "%parameter:entry:ngp_dash_lifelock%";;       label: "NGP Dashboard Lifelock"}
      when: {sql:  ${tags} LIKE "%parameter:entry:nsl_home_norton%";;         label: "NSL Home Norton"}
      when: {sql:  ${tags} LIKE "%parameter:entry:nsl_home_lifelock%";;       label: "NSL Home Lifelock"}
      when: {sql:  ${tags} LIKE "%parameter:entry:empower_dash_norton%";;     label: "Empower"}
      when: {sql:  ${tags} LIKE "%parameter:entry:app_contactus_lifelock%";;  label: "APP Contactus Lifelock"}
      when: {sql:  ${tags} LIKE "%parameter:entry:ngp_arood_norton%";;        label: "NGP Arood Norton"}
      when: {sql:  ${tags} LIKE "%parameter:entry:ngp_arood_lifelock%";;      label: "NGP Arood Lifelock"}
      when: {sql:  ${tags} LIKE "%parameter:entry:sp_home_norton%";;          label: "SP Home Norton"}
      when: {sql:  ${tags} LIKE "%parameter:entry:sp_home_lifelock%";;        label: "SP Home LifeLock"}
      when: {sql:  ${tags} LIKE "%parameter:entry:sp_search_norton%";;        label: "SP Search Norton"}
      when: {sql:  ${tags} LIKE "%parameter:entry:sp_search_lifelock%";;      label: "SP Search LifeLock"}
      when: {sql:  ${tags} LIKE "%parameter:entry:sp_kb_norton%";;            label: "SP KB Norton"}
      when: {sql:  ${tags} LIKE "%parameter:entry:sp_kb_lifelock%";;          label: "SP KB LifeLock"}
      when: {sql:  ${tags} LIKE "%parameter:entry:sp_contactus_norton%";;     label: "SP Contactus Norton"}
      when: {sql:  ${tags} LIKE "%parameter:entry:sp_contactus_lifelock%";;   label: "SP Contactus Lifelock"}
      when: {sql:  ${tags} LIKE "%parameter:entry:sp_contactus_avast%";;      label: "SP Contactus Avast"}
      when: {sql:  ${tags} LIKE "%parameter:entry:sp_contactus_avg%";;        label: "SP Contactus Avg"}
      else: "Other"
    }
  }

  dimension: brand{
    label: "Gen Brand"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:brand:norton%";;                  label: "Norton"}
      when: {sql:  ${tags} LIKE "%parameter:brand:lifelock%";;                label: "LifeLock"}
      when: {sql:  ${tags} LIKE "%parameter:brand:avast%";;                   label: "Avast"}
      when: {sql:  ${tags} LIKE "%parameter:brand:avg%";;                     label: "AVG"}
      else: "Other"
    }
  }

  dimension: chat_site_of_entry{
    label: "Chat Site"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:site_of_entry:hc%";;           label: "Help Center"}
      when: {sql:  ${tags} LIKE "%parameter:site_of_entry:ngp%";;          label: "NGP"}
      when: {sql:  ${tags} LIKE "%parameter:site_of_entry:hp%";;           label: "Brand Home Page"}
      when: {sql:  ${tags} LIKE "%parameter:site_of_entry:nsl%";;          label: "NSL"}
      when: {sql:  ${tags} LIKE "%parameter:site_of_entry:app%";;          label: "App"}
      when: {sql:  ${tags} LIKE "%parameter:site_of_entry:sp%";;           label: "SP Web App"}
      when: {sql:  ${tags} LIKE "%parameter:site_of_entry:empower%";;      label: "Empower"}
      else: "Other"
    }
  }

  dimension: chat_point_of_entry{
    label: "Chat Page"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:point_of_entry:home%";;        label: "Home Page"}
      when: {sql:  ${tags} LIKE "%parameter:point_of_entry:kb%";;          label: "KB Page"}
      when: {sql:  ${tags} LIKE "%parameter:point_of_entry:search%";;      label: "Search Page"}
      when: {sql:  ${tags} LIKE "%parameter:point_of_entry:contactus%";;   label: "Contact Us Page"}
      when: {sql:  ${tags} LIKE "%parameter:point_of_entry:dl%";;          label: "Download Page"}
      when: {sql:  ${tags} LIKE "%parameter:point_of_entry:arood%";;       label: "AROOD"}
      else: "Other"
    }
  }


##Routing after escalation

dimension: routing_queue {
  label: "Routing Queue"
  type: string
  case: {
    when: {sql:  ${tags} LIKE "%parameter:menu_id:55%";;                  label: "AVAST Account Services (55)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:55%";;                  label: "AVAST Account Services (55)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:56%";;                  label: "AVAST Refund (56)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:54%";;                  label: "AVAST Tech (54)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:43%";;                  label: "AVG Account Services (43)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:42%";;                  label: "AVG Tech (42)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:44%";;                  label: "AVG Refund (44)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:331%";;                 label: "EB US ACCOUNT (331)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:121%";;                 label: "UHD Services Queue (121)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:138%";;                 label: "Computer Tuneup Queue (138)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:60%";;                  label: "LifeLock Alerts (60)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:56%";;                  label: "LifeLock IPA (56)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:80%";;                  label: "Acct Service Queue (80)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:89%";;                  label: "MAC (89)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:90%";;                  label: "Mobile (90)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:53%";;                  label: "IPA Upsell (53)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:88%";;                  label: "US WinSecurity (88)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:306%";;                 label: "LifeLock Retention (306)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:308%";;                 label: "Norton Renewals (308)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:81%";;                  label: "EN US CSP (81)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:7%";;                   label: "Sales High (81)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:8%";;                   label: "Sales Mid (81)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:9%";;                   label: "Sales Low (81)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:362%";;                 label: "eStore Acquisition"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:515%";;                 label: "AOL"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:516%";;                 label: "AROOD"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:517%";;                 label: "ATT"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:519%";;                 label: "Comcast"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:520%";;                 label: "CRI"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:521%";;                 label: "CSP"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:522%";;                 label: "Dispatch"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:523%";;                 label: "EAP"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:524%";;                 label: "Empower"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:525%";;                 label: "ITPS"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:528%";;                 label: "Mac"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:529%";;                 label: "Mobile"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:530%";;                 label: "Norton Core"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:531%";;                 label: "NortonGo"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:532%";;                 label: "NPM"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:534%";;                 label: "NWP"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:535%";;                 label: "OEM TT"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:536%";;                 label: "Other Products"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:537%";;                 label: "PartnerNet"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:538%";;                 label: "Renewal Purchase"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:539%";;                 label: "Security Windows"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:540%";;                 label: "Telus Breach"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:541%";;                 label: "Telus"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:542%";;                 label: "Threat Removal"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:542%";;                 label: "threat"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:543%";;                 label: "UHD Delivery"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:557%";;                 label: "KDDI"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:559%";;                 label: "DWM"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:560%";;                 label: "machine translate"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:567%";;                 label: "LifeLock Identity"}
# possibly more when statements
    else: "Other"
  }
}
}
