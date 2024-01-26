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

  dimension: chat_id {
    label: "Chat ID"
    type: string
    sql: ${TABLE}.chat_id ;;
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
  dimension: environment {
    label: "Environment"
    type: string
    case: {
      when: {
        sql:  ${tags} LIKE "%parameter:env:prod%" ;;     label: "Prod"
      }
      else: "Dev"
    }
  }

  #brand
  dimension: origin_tfn {
    label: "Brand"
    type: string
    case: {
      when: {
        sql:  ${tags} LIKE "%parameter:tfn_company:norton%" OR ${tags} LIKE "%parameter:tfn_company:nortonvip%" OR ${tags} LIKE "%parameter:tfn_company:login_error_20008%";;
        label: "Norton"
      }
      when: {
        sql:  ${tags} LIKE "%parameter:tfn_company:ll%" OR ${tags} LIKE "%parameter:tfn_company:llvip%" OR ${tags} LIKE "%parameter:tfn_company:eb_us%";;
        label: "Lifelock"
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
    label: "Contact Resolution"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:call_resolution:contactus_link%" OR ${tags} LIKE "%parameter:call_resolution:escalation_contactus%";;     label: "Link to Contact Us"}
      when: {sql:  ${tags} LIKE "%parameter:call_resolution:escalation%" OR ${tags} LIKE "%parameter:call_resolution:escalated%";;                    label: "Escalation"}
      when: {sql:  ${tags} LIKE "%parameter:call_resolution:hangup%";;                                                                                label: "User Hangup"}
      when: {sql:  ${tags} LIKE "%parameter:call_resolution:escalation_default_quque%";;                                                              label: "Escalation Default Queue"}
      when: {sql:  ${tags} LIKE "%parameter:call_resolution:disconnect%";;                                                                            label: "Disconnect"}
      # possibly more when statements
      else: "Other"
    }
  }

  dimension: resolution_reason {
    label: "Resolution Reason"
    type: string
    case: {
        when: {sql:  ${tags} LIKE "%parameter:resolution_reason:asked_for_agent%";;           label: "Asked For Agent"}
        when: {sql:  ${tags} LIKE "%parameter:resolution_reason:no_match_dtmf%";;             label: "No Match DTMF"}
        when: {sql:  ${tags} LIKE "%parameter:resolution_reason:productkey_detail%";;         label: "Productkey Detail"}
        when: {sql:  ${tags} LIKE "%parameter:resolution_reason:ghost%";;                     label: "Ghost"}
        when: {sql:  ${tags} LIKE "%parameter:resolution_reason:roboall%";;                   label: "Robocall"}
        when: {sql:  ${tags} LIKE "%parameter:resolution_reason:no_otp%";;                    label: "No OTP"}
        when: {sql:  ${tags} LIKE "%parameter:resolution_reason:escalated_from_bcf%";;        label: "Escalated from Basic Call Flow"}
        when: {sql:  ${tags} LIKE "%parameter:resolution_reason:no_match%";;                  label: "No Match"}
        when: {sql:  ${tags} LIKE "%parameter:resolution_reason:no_input%";;                  label: "No Input"}
        when: {sql:  ${tags} LIKE "%parameter:resolution_reason:escalated_from_sales%";;      label: "Escalated From Sales"}
        when: {sql:  ${tags} LIKE "%parameter:resolution_reason:custome_hangup%";;            label: "Customer Hangup"}
        when: {sql:  ${tags} LIKE "%parameter:resolution_reason:customer_hangup%";;           label: "Customer Hangup"}
        when: {sql:  ${tags} LIKE "%parameter:resolution_reason:invalid_dtmf%";;              label: "Invalid Dtmf"}
        when: {sql:  ${tags} LIKE "%parameter:resolution_reason:otp_sent_but_not_received%";; label: "Otp Sent But Not Received"}
        when: {sql:  ${tags} LIKE "%parameter:resolution_reason:product_key_dtmf%";;          label: "Product Key Dtmf"}
        when: {sql:  ${tags} LIKE "%parameter:resolution_reason:spam_msg_read%";;             label: "Spam Msg Read"}
        when: {sql:  ${tags} LIKE "%parameter:resolution_reason:resolved%";;                  label: "Resolved"}
        when: {sql:  ${tags} LIKE "%parameter:termination_reason:resolved%";;                 label: "Resolved"}
        when: {sql:  ${tags} LIKE "%parameter:termination_reason:ghost%";;                    label: "Ghost"}
        when: {sql:  ${tags} LIKE "%parameter:termination_reason:robocall%";;                 label: "Robocall"}
      # possibly more when statements
      else: "Other"
    }
  }

  dimension: resolution_source {
    label: "Resolution Source"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:lookup_flow%";;                   label: "Lookup Flow"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:agent_technical_get_devicetype%";;label: "Agent Technical Get Device type"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:lookup_by_email_failed%";;        label: "Lookup By Email Failed"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:alerts_flow%";;                   label: "Alerts Flow"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:lookup_collect_pii_yob%";;        label: "Lookup by PII YOB"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:login_issues_flow%";;             label: "Login Issues Flow"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:download_issue_flow%";;           label: "Download Issue Flow"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:technical_get_devicetype%";;      label: "Technical Get Devicetype"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:agent_flow%";;                    label: "Agent Flow"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:update_billing_flow%";;           label: "Update Billing Flow"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:dsf_dtmf%";;                      label: "Default Start Flow - DTMF"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:bcf%";;                           label: "Basic Call Flow"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:resolved_flow%";;                 label: "Resolved Flow"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:lookup_by_pii_flow%";;            label: "Lookup By PII Flow"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:sales_flow%";;                    label: "Sales Flow"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:lookup_v2_flow%";;                label: "Lookup V2 Flow"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:subscription_flow%";;             label: "Subscription Flow"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:technical_flow%";;                label: "Technical Flow"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:download_issue_kid%";;            label: "Download Issue Kid"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:agent_technical_get_issue%";;     label: "Agent Technical Get Issue"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:billing_flow%";;                  label: "Billing Flow"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:update_account_flow%";;           label: "Update Account Flow"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:account_information_flow%";;      label: "Account Information Flow"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:itps_flow%";;                     label: "ITPS Flow"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:dtmf_orchestrator_flow%";;        label: "DTMF Orchestrator Flow"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:activation_and_install_flow%";;   label: "Activation And Install Flow"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:otp_verify_sp%";;                 label: "OTP Verify SP"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:lookup_by_pii_ssn%";;             label: "Lookup by PII SSN"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:lookup_by_pii_yob%";;             label: "Lookup by PII YOB"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:product_key%";;                   label: "Product Key"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:otp_verify_url%";;                label: "OTP Verify URL"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:basic_call_flow%";;               label: "Basic Call Flow"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:lookup_collect_pii_ssn%";;        label: "Lookup by PII SSN"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:notifications_flow%";;            label: "Notifications Flow"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:otp_timeout%";;                   label: "Otp Timeout"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:dsf%";;                           label: "Default Start Flow"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:sales_menu%";;                    label: "Sales Menu"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:misc_flow%";;                     label: "Misc Flow"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:sales_spam_info%";;               label: "Sales Spam Info"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_source:auth_by_otp_flow%";;              label: "Auth by OTP Flow"}
      # possibly more when statements
      else: "Other"
    }
  }

  dimension: termination_reason {
    label: "Termination Reason"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:termination_reason:ghost%";;        label: "Ghost Call"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_reason:ghost%";;         label: "Ghost Call"}
      when: {sql:  ${tags} LIKE "%parameter:termination_reason:robocall%";;     label: "Robocall"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_reason:robocall%";;      label: "Robocall"}
      when: {sql:  ${tags} LIKE "%parameter:termination_reason:resolved%";;     label: "Resolved"}
      when: {sql:  ${tags} LIKE "%parameter:resolution_reason:resolved%";;      label: "Resolved"}
      # possibly more when statements
      else: "Other"
    }
  }

  measure: ghost_call {
    label: "Ghost Calls Count"
    type: count_distinct
    sql: ${session_id} ;;
    filters: [is_ghost_call: "Yes"]
  }


  measure: ghost_calls_count {
    label: "Ghost Calls Count -New"
    type: count_distinct
    sql: ${tags} LIKE "%parameter:resolution_reason:ghost%" ;;
  }

  measure: ghost_call_percent {
    label: "% of Ghost Calls"
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
    sql: ${tags} LIKE "%parameter:resolution_reason:ghost%" OR
         ${tags} LIKE "%parameter:resolution_reason:robocall%" OR
         ${tags} LIKE "%parameter:termination_reason:ghost%"OR
         ${tags} LIKE "%parameter:termination_reason:robocall%";;
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

  dimension: from_ivr{
    label: "From IVR"
    type: string
    case: {
      when: {
        sql:  ${tags} LIKE "%parameter:fromIVR:true%" ;;
        label: "To Ava"
        }
        else: "Other"
      }
  }

  dimension: call_id_test {
    label: "Test Call ID"
    type: yesno
    sql: ${tags} LIKE "%parameter:call_id:1.0%";;
  }
#calls flow (for the moment we have only Sales but more values will follow)

  dimension: call_flow{
    label: "Contact Type"
    type: string
    case: {
      when: {   sql:  ${tags} LIKE "%parameter:entry:welcome%" OR  ${tags} LIKE "%parameter:fromIVR:true%" OR  ${tags} LIKE "%parameter:chattype:chatbot%";;    label: "Automation Eligible"       }
      when: {   sql:  ${tags} LIKE "%parameter:entry:sales_flow%";;                                                                                             label: "Sales Call Flow"           }
      when: {   sql:  ${tags} LIKE "%parameter:entry:basic_call_flow%";;                                                                                        label: "Basic Call Flow"           }
      when: {   sql:  ${tags} LIKE "%parameter:chattype:agent%";;                                                                                               label: "Direct to Agent Chat"      }
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

  dimension: chat_target{
    label: "Chat Target"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:chattype:agent%";;        label: "Agent"}
      when: {sql:  ${tags} LIKE "%parameter:chattype:chatbot%";;      label: "Chatbot"}
      else: "Other"
    }
  }

  dimension: intent{
    label: "Intent"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:use_case:account_duplicate%";;                                    label: "Account Duplicate"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:account_info%";;                                         label: "Account Information"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:account_setup%";;                                        label: "Account Setup"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:activation%";;                                           label: "Activation"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:activation_issue%";;                                     label: "Activation Issue"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:alerts%";;                                               label: "Alerts"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:alerts_l2%";;                                            label: "Alerts L2"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:billing_issue%";;                                        label: "Billing Issue"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:billing_question%";;                                     label: "Billing Question"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:billing_charge%";;                                       label: "Billing Question - Charge"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:billing_date%";;                                         label: "Billing Question - Date"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:billing_fop%";;                                          label: "Billing Question - FOP"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:billing_confirmpayment%";;                               label: "Billing Question - Payment"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:license_buy%";;                                          label: "Buy"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:callback%";;                                             label: "Call Return"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:case_number%";;                                          label: "Case"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:cloudbackup%";;                                          label: "Cloud Backup"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:cloudbackup_issue%";;                                    label: "Cloud Backup Issue"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:cloudbackup_restore%";;                                  label: "Cloud Backup Restore"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:cloudbackup_setup%";;                                    label: "Cloud Backup Setup"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:norton_security%";;                                      label: "Device Protection"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:nortonsecurity_issue%";;                                 label: "Device Protection Issue"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:download_issue%";;                                       label: "Download Issue"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:download%";;                                             label: "Download"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:identity_protection%";;                                  label: "Identity Protection"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:identity_theft%";;                                       label: "Identity Theft"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:install_setup%";;                                        label: "Install Status"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:collections%";;                                          label: "ITPS - Collections"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:court_records%";;                                        label: "ITPS - Court Records"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:credit_score%";;                                         label: "ITPS - Credit Score"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:dark_web%";;                                             label: "ITPS - Dark Web"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:data_breach%";;                                          label: "ITPS - Data Breach"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:financialmonitoring_error%";;                            label: "ITPS - Financial Monitoring Error"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:home_title%";;                                           label: "ITPS - Home Title"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:payday_loan%";;                                          label: "ITPS - Pay Day Loan"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:public_record%";;                                        label: "ITPS - Public Record"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:sex_offender%";;                                         label: "ITPS - Sex Offender"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:utility_account%";;                                      label: "ITPS - Utility Account"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:License_issue%";;                                        label: "License issue"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:live_agent%";;                                           label: "Live Agent"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:tech_agent%";;                                           label: "Live Agent - Technical"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:liveupdate%";;                                           label: "Live Update"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:liveupdate_issues%";;                                    label: "Live Update Issue"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:rpw%";;                                                  label: "Login Issue - Online Account"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:rpw_2FA%";;                                              label: "Login Issue - 2FA"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:rpw_pwm%";;                                              label: "Login Issue - PWM"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:productkey_find%";;                                      label: "Product Key - Find"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:productkey_issue%";;                                     label: "Product Key - Issue"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:productkey%";;                                           label: "Product Key"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:refund%";;                                               label: "Refund"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:reinstall%";;                                            label: "Reinstall"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:renewal%";;                                              label: "Renewal"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:spam%";;                                                 label: "Spam"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:subscription_cancel%";;                                  label: "Subscription Cancel"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:subscription_info%";;                                    label: "Subscription Info"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:manage_subscription%";;                                  label: "Subscription Manage"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:update_account%";;                                       label: "Update Account"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:update_address%";;                                       label: "Update Address"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:update_billing%";;                                       label: "Update billing"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:update_email%";;                                         label: "Update email"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:update_phone%";;                                         label: "Update phone"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:upgrade%";;                                              label: "Upgrade"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:vpn_issues%";;                                           label: "VPN Issue"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:vpn%";;                                                  label: "VPN"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:lostwallet%";;                                           label: "Lost Wallet"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:virus removal%";;                                        label: "Virus"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:virus_removal%";;                                        label: "Virus"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:add_member%";;                                           label: "Add Member"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:redeem_uhd%";;                                           label: "Redeem UHD"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:redeem_tuneup%";;                                        label: "Redeem Tune Up"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:genie%";;                                                label: "Genie"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:slow_computer%";;                                        label: "Slow Computer"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:browser_errors%";;                                       label: "Browser Errors"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:full_disk%";;                                            label: "Full Disk"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:software_updater%";;                                     label: "Software Updater"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:language_display%";;                                     label: "Language Display"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:subscription_validate%";;                                label: "Subscription Validate Days"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:threat%";;                                               label: "Threat"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:tbd%";;                                                  label: "TBD"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:installation_issue%";;                                   label: "Installation Issue"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:acct_info%";;                                            label: "Account Information"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:dl_find_installer%";;                                    label: "Download - Find Installer"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:dl_not_started%";;                                       label: "Download - Not Started"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:install_status%";;                                       label: "Install Status"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:something_else%";;                                       label: "Something Else"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:dl_install_help%";;                                      label: "Download - Install Help"}
      else: "Other"
    }
  }


  dimension: chat_origin{
    label: "Origin"
    type: string
    case: {
      ## Help Center Chat Origin Entry Parameters
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
      ## Brand Home Page Chat Origin Entry Parameters
      when: {sql:  ${tags} LIKE "%parameter:entry:hp_home_norton%";;          label: "Sales Norton"}
      when: {sql:  ${tags} LIKE "%parameter:entry:hp_home_lifelock%";;        label: "Sales Lifelock"}
      when: {sql:  ${tags} LIKE "%parameter:entry:hp_home_avast%";;           label: "Sales Avast"}
      when: {sql:  ${tags} LIKE "%parameter:entry:hp_home_avg%";;             label: "Sales Avg"}
      ## NGP Chat Origin Entry Parameters
      when: {sql:  ${tags} LIKE "%parameter:entry:ngp_dl_norton%";;           label: "NGP DL Norton"}
      when: {sql:  ${tags} LIKE "%parameter:entry:ngp_dash_norton%";;         label: "NGP Dashboard Norton"}
      when: {sql:  ${tags} LIKE "%parameter:entry:ngp_dash_lifelock%";;       label: "NGP Dashboard Lifelock"}
      when: {sql:  ${tags} LIKE "%parameter:entry:nsl_home_norton%";;         label: "NSL Home Norton"}
      when: {sql:  ${tags} LIKE "%parameter:entry:nsl_home_lifelock%";;       label: "NSL Home Lifelock"}
      when: {sql:  ${tags} LIKE "%parameter:entry:ngp_arood_norton%";;        label: "NGP Arood Norton"}
      when: {sql:  ${tags} LIKE "%parameter:entry:ngp_arood_lifelock%";;      label: "NGP Arood Lifelock"}
      ## Support Portal Chat Origin Entry Parameters
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
      ## Other Chat Origin Entry Parameters
      when: {sql:  ${tags} LIKE "%parameter:entry:empower_dash_norton%";;     label: "Empower"}
      when: {sql:  ${tags} LIKE "%parameter:entry:app_contactus_lifelock%";;  label: "APP Contactus Lifelock"}
      ## IVA Voice Origin Entry Parameters
      when: {sql:  ${tags} LIKE "%parameter:entry:welcome_norton_priority%";; label: "IVA Norton Priority"}
      when: {sql:  ${tags} LIKE "%parameter:entry:welcome_norton_tech%";;     label: "IVA Norton Tech"}
      when: {sql:  ${tags} LIKE "%parameter:entry:welcome_norton%";;          label: "IVA Norton"}
      when: {sql:  ${tags} LIKE "%parameter:entry:welcome_lifelock_priority%";; label: "IVA LifeLock Priority"}
      when: {sql:  ${tags} LIKE "%parameter:entry:welcome_lifelock%";;        label: "IVA LifeLock"}
      when: {sql:  ${tags} LIKE "%parameter:entry:welcome_sp_otp%";;          label: "IVA SP Logged In"}
      when: {sql:  ${tags} LIKE "%parameter:entry:welcome_eb_us%";;           label: "IVA EB US"}
      when: {sql:  ${tags} LIKE "%parameter:entry:welcome_l2_alerts%";;       label: "IVA L2 Alerts"}
      when: {sql:  ${tags} LIKE "%parameter:entry:welcome_login_error_20008%";; label: "IVA Login Error"}
      when: {sql:  ${tags} LIKE "%parameter:entry:welcome_avast%";;           label: "IVA Avast"}
      when: {sql:  ${tags} LIKE "%parameter:entry:welcome_avg%";;             label: "IVA AVG"}
      ## IVR Voice Origin Entry Parameters
      when: {sql:  ${tags} LIKE "%parameter:entry:basic_call_flow%";;         label: "IVR Basic Call Flow"}
      when: {sql:  ${tags} LIKE "%parameter:entry:sales_flow%";;              label: "IVR Sales Flow"}

      else: "Unknown Entry"
    }
  }


  dimension: chat_site{
    label: "Chat Origin Site"
    type: string
    case: {
      ## Help Center Chat Origin Entry Parameters
      when: {sql:  ${tags} LIKE "%parameter:site_of_entry:hc%";;               label: "Help Center"}
      when: {sql:  ${tags} LIKE "%parameter:site_of_entry:sp%";;               label: "SP Web App"}
      when: {sql:  ${tags} LIKE "%parameter:site_of_entry:ngp%";;              label: "NGP"}
      when: {sql:  ${tags} LIKE "%parameter:site_of_entry:hp%";;               label: "Sales Home"}
      when: {sql:  ${tags} LIKE "%parameter:site_of_entry:nsl%";;              label: "NSL Login"}
      when: {sql:  ${tags} LIKE "%parameter:site_of_entry:empower%";;          label: "Empower"}
      when: {sql:  ${tags} LIKE "%parameter:site_of_entry:app%";;              label: "App"}
      else: "Unknown Origin Site"
    }
  }

  dimension: chat_page{
    label: "Chat Origin Page"
    type: string
    case: {
      ## Help Center Chat Origin Entry Parameters
      when: {sql:  ${tags} LIKE "%parameter:point_of_entry:home%";;             label: "Home"}
      when: {sql:  ${tags} LIKE "%parameter:point_of_entry:contactus%";;        label: "Contact Us"}
      when: {sql:  ${tags} LIKE "%parameter:point_of_entry:kb%";;               label: "KB Page"}
      when: {sql:  ${tags} LIKE "%parameter:point_of_entry:search%";;           label: "Search Results"}
      when: {sql:  ${tags} LIKE "%parameter:point_of_entry:dl%";;               label: "Download Page"}
      when: {sql:  ${tags} LIKE "%parameter:point_of_entry:arood%";;            label: "AROOD"}
      when: {sql:  ${tags} LIKE "%parameter:point_of_entry:dash%";;             label: "Dashboard"}
      else: "Unknown Origin Page"
    }
  }

  dimension: country{
    label: "Country"
    type: string
    case: {
      ## Help Center Chat Origin Entry Parameters
      when: {sql:  ${tags} LIKE "%parameter:ct:us%";;         label: "US"}
      when: {sql:  ${tags} LIKE "%parameter:ct:au%";;         label: "Australia"}
      when: {sql:  ${tags} LIKE "%parameter:ct:uk%";;         label: "UK"}
      when: {sql:  ${tags} LIKE "%parameter:ct:ca%";;         label: "Canada"}
      when: {sql:  ${tags} LIKE "%parameter:ct:de%";;         label: "Germany"}
      when: {sql:  ${tags} LIKE "%parameter:ct:fr%";;         label: "France"}
      when: {sql:  ${tags} LIKE "%parameter:ct:it%";;         label: "Italy"}
      when: {sql:  ${tags} LIKE "%parameter:ct:mx%";;         label: "Mexico"}
      when: {sql:  ${tags} LIKE "%parameter:ct:pt%";;         label: "Portugal"}
      when: {sql:  ${tags} LIKE "%parameter:ct:br%";;         label: "Brazil"}
      when: {sql:  ${tags} LIKE "%parameter:ct:in%";;         label: "India"}
      when: {sql:  ${tags} LIKE "%parameter:ct:nz%";;         label: "New Zealand"}
      when: {sql:  ${tags} LIKE "%parameter:ct:ir%";;         label: "Ireland"}
      when: {sql:  ${tags} LIKE "%parameter:ct:sp%";;         label: "Spain"}
      when: {sql:  ${tags} LIKE "%parameter:jp:sp%";;         label: "Japan"}
      else: "Other"
    }
  }

  dimension: language{
    label: "Language"
    type: string
    case: {
      ## Help Center Chat Origin Entry Parameters
      when: {sql:  ${tags} LIKE "%parameter:lg:en%";;         label: "English"}
      when: {sql:  ${tags} LIKE "%parameter:lg:de%";;         label: "German"}
      when: {sql:  ${tags} LIKE "%parameter:lg:fr%";;         label: "French"}
      when: {sql:  ${tags} LIKE "%parameter:lg:it%";;         label: "Italian"}
      when: {sql:  ${tags} LIKE "%parameter:lg:es%";;         label: "Spanish"}
      when: {sql:  ${tags} LIKE "%parameter:lg:ja%";;         label: "Japanese"}
      when: {sql:  ${tags} LIKE "%parameter:lg:po%";;         label: "Polish"}
      when: {sql:  ${tags} LIKE "%parameter:lg:da%";;         label: "Danish"}
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
      else: "Unknown Brand"
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

dimension: routing_queue_nlok {
  label: "Routing Queue Nlok"
  type: string
  case: {
    when: {sql:  ${tags} LIKE "%parameter:menu_id:56%" ;;                 label: "LifeLock IPA (56)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:331%";;                 label: "EB US ACCOUNT (331)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:121%";;                 label: "UHD Services Queue (121)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:138%";;                 label: "Computer Tuneup Queue (138)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:60%";;                  label: "LifeLock Alerts (60)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:80%";;                  label: "Acct Service Queue (80)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:89%";;                  label: "MAC (89)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:90%";;                  label: "Mobile (90)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:53";;                   label: "IPA Upsell (53)"}
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

  dimension: routing_queue_avast_avg {
    label: "Routing Queue Avast AVG"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:menu_id:55%";;                  label: "AVAST Account Services (55)"}
      when: {sql:  ${tags} LIKE "%parameter:menu_id:54%";;                  label: "AVAST Tech (54)"}
      when: {sql:  ${tags} LIKE "%parameter:menu_id:43%";;                  label: "AVG Account Services (43)"}
      when: {sql:  ${tags} LIKE "%parameter:menu_id:42%";;                  label: "AVG Tech (42)"}
      when: {sql:  ${tags} LIKE "%parameter:menu_id:44%";;                  label: "AVG Refund (44)"}
      when: {sql:  ${tags} LIKE "%parameter:menu_id:56%";;                  label: "AVAST Refund (56)"}
# possibly more when statements
      else: "Other"
    }
  }
  set: detail {
    fields: [
      session_id,
      chat_id
    ]
  }
}
