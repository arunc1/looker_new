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
    primary_key: yes
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: chat_id {
   label: "Chat ID"
   type: string
  sql: ${TABLE}.session_id ;;
  }


  dimension: ChatID {
    label: "ChatID"
    type: string
    sql: REGEXP_EXTRACT(${tags}, 'parameter:chat_id:([^|]+)') ;;
  }

# Dimension combining chat and call Ids added on 17062025
  dimension: ID_VC {
    label: "ID_voice/chat"
    type: string
    sql: case
          when ${channel} = "Chat" THEN REGEXP_EXTRACT(${tags}, 'parameter:chat_id:([^|]+)')
          when ${channel} = "Voice" THEN REGEXP_EXTRACT(${tags}, 'parameter:call_id:([^|]+)')
          ElSE NULL
          END ;;
  }



  dimension: tags {
    type: string
    sql: ${TABLE}.tags ;;
  }

  dimension: dap {
    type: string
    sql: ${tags} LIKE "%parameter:dap:%" ;;
  }

  dimension: ingress {
    label: "Ingress"
    type: string
    sql: ${tags} LIKE "%parameter:ingress:%" ;;
  }

  dimension: wait_time {
    type: number
    sql: ${tags} LIKE "%parameter:wait_time:%";;
  }

  dimension: DNIS {
    type: string
    sql: ${tags} LIKE "%parameter:dnis%";;
  }


  dimension: df_agent{
    label: "DF Agent"
    type: string
    case: {
      when: {sql:  ${tags} like "%parameter:df_agent:cht_avav_directagent%";;   label:"Chat Avast/AVG Direct to Agent"}
      when: {sql:  ${tags} like "%parameter:df_agent:cht_avg_contactus%";;      label:"Chat AVG Help Center Contact Us"}
      when: {sql:  ${tags} like "%parameter:df_agent:cht_avg_genai_noesc%";;    label:"Chat AVG Gen AI (Non Escalating)"}
      when: {sql:  ${tags} like "%parameter:df_agent:cht_avst_contactus%";;     label:"Chat Avast Help Center Contact Us"}
      when: {sql:  ${tags} like "%parameter:df_agent:cht_avst_genai_noesc%";;   label:"Chat Avast Gen AI (Non Escalating)"}
      when: {sql:  ${tags} like "%parameter:df_agent:cht_lflk_contactus%";;     label:"Chat LifeLock Help Center Contact Us / lifelock.com"}
      when: {sql:  ${tags} like "%parameter:df_agent:cht_lflk_genai_noesc%";;   label:"Chat LifeLock Gen AI (Non Escalating)"}
      when: {sql:  ${tags} like "%parameter:df_agent:cht_nlok_directagent%";;   label:"Chat NLOK Direct to Agent"}
      when: {sql:  ${tags} like "%parameter:df_agent:cht_nlok_japanese%";;      label:"Chat NLOK Japanese"}
      when: {sql:  ${tags} like "%parameter:df_agent:cht_nlok_loginpage%";;     label:"Chat NLOK NSL"}
      when: {sql:  ${tags} like "%parameter:df_agent:cht_nrtn_contactus%";;     label:"Chat Norton Help Center Contact Us / norton.com"}
      when: {sql:  ${tags} like "%parameter:df_agent:cht_nrtn_genai_noesc%";;   label:"Chat Norton Gen AI (Non Escalating)"}
      when: {sql:  ${tags} like "%parameter:df_agent:vce_avav_automation%";;    label:"Voice Avast/AVG Basic Call Flow / Automation"}
      when: {sql:  ${tags} like "%parameter:df_agent:vce_avav_business%";;      label:"Voice Avast/AVG Business"}
      when: {sql:  ${tags} like "%parameter:df_agent:vce_avav_directagent%";;   label:"Voice Avast/AVG Direct to Agent"}
      when: {sql:  ${tags} like "%parameter:df_agent:vce_avav_premium%";;       label:"Voice Avast/AVG Premium"}
      when: {sql:  ${tags} like "%parameter:df_agent:vce_nlok_automation%";;    label:"Voice NLOK Sales / Basic Call Flow / Automation"}
      when: {sql:  ${tags} like "%parameter:df_agent:vce_nlok_bcf_mltilng%";;   label:"Voice NLOK Basic Call Flow"}
      when: {sql:  ${tags} like "%parameter:df_agent:vce_nlok_bcf_nonen%";;     label:"Voice NLOK Basic Call Flow"}
      when: {sql:  ${tags} like "%parameter:df_agent:vce_nlok_directndbe%";;    label:"Voice NLOK Direct to Agent / Dial by Extension"}
      when: {sql:  ${tags} like "%parameter:df_agent:ccai_chat_norton_japan%";; label:"Chat Norton CCAI_Japan"}
      when: {sql:  ${tags} like "%parameter:df_agent:ccai_voice_norton_japan%";;label:"Voice Norton CCAI_Japan"}

      else: "Other"
    }
  }



  dimension: wait_group {
    label: "Wait Time Group"
    type: string
    case: {
      when: { sql: ${tags} LIKE "%parameter:wait_message_group:group1%";;       label: "Group 1: 0-5 Mins" }
      when: { sql: ${tags} LIKE "%parameter:wait_message_group:group2%";;       label: "Group 2: 5-10 Mins" }
      when: { sql: ${tags} LIKE "%parameter:wait_message_group:group3%";;       label: "Group 3: 10-20 Mins" }
      when: { sql: ${tags} LIKE "%parameter:wait_message_group:group4%";;       label: "Group 4: 20-30 Mins" }
      when: { sql: ${tags} LIKE "%parameter:wait_message_group:group5%";;       label: "Group 5: 30+ Mins" }
  }
  }

  dimension: gcc_presented {
    label: "Call companion presented"
    type: yesno
    sql: ${tags} LIKE "%parameter:call_companion_presented:true%" ;;
  }

  dimension: gcc_accepted {
    label: "Call companion accepted"
    type: string
    case: {
      when: {        sql:  ${tags} LIKE "%parameter:call_companion_accepted:true%" ;;        label: "Accepted"}
      when: {        sql:  ${tags} LIKE "%parameter:call_companion_accepted:false%" ;;       label: "Rejected"}
      else: "Other"
    }
  }

  dimension: gcc_rejection_reason {
    label: "Call companion rejection reason"
    type: string
    case: {
      when: {        sql:  ${tags} LIKE "%parameter:call_companion_rejection_reason:user_choice%" ;;    label: "User choice"}
      when: {        sql:  ${tags} LIKE "%parameter:call_companion_rejection_reason:no_match%" ;;       label: "No match"   }
      when: {        sql:  ${tags} LIKE "%parameter:call_companion_rejection_reason:no_input%" ;;       label: "No input"   }
      else: "Other"
    }
  }

  dimension: vra_partial_refund {
    label: "Retention: Partial Refund"
    type: string
    case: {
      when: {        sql:  ${tags} LIKE "%parameter:can_partial_refund:true%" ;;            label: "Eligible"}
      when: {        sql:  ${tags} LIKE "%parameter:can_partial_refund:false%" ;;           label: "Ineligible"}
      else: "Other"
    }
  }


  dimension: vra_full_refund {
    label: "Retention: Full Refund"
    type: string
    case: {
      when: {        sql:  ${tags} LIKE "%parameter:can_full_refund:true%" ;;               label: "Eligible"}
      when: {        sql:  ${tags} LIKE "%parameter:can_full_refund:false%" ;;              label: "Ineligible"}
      else: "Other"
    }
  }

  dimension: vra_discount {
    label: "Retention: Discount"
    type: string
    case: {
      when: {        sql:  ${tags} LIKE "%parameter:can_discount:true%" ;;                  label: "Eligible"}
      when: {        sql:  ${tags} LIKE "%parameter:can_discount:false%" ;;                 label: "Ineligible"}
      else: "Other"
    }
  }

  dimension: vra_change_cycle {
    label: "Retention: Change Cycle"
    type: string
    case: {
      when: {        sql:  ${tags} LIKE "%parameter:can_change_cycle:true%" ;;              label: "Eligible"}
      when: {        sql:  ${tags} LIKE "%parameter:can_change_cycle:false%" ;;             label: "Ineligible"}
      else: "Other"
    }
  }

  dimension: vra_ar_off {
    label: "Retention: Turn off AR"
    type: string
    case: {
      when: {        sql:  ${tags} LIKE "%parameter:can_ar_off:true%" ;;                    label: "Eligible"}
      when: {        sql:  ${tags} LIKE "%parameter:can_ar_off:false%" ;;                   label: "Ineligible"}
      else: "Other"
    }
  }

  dimension: vra_retained {
    label: "Retention: Retained"
    type: string
    case: {
      when: {        sql:  ${tags} LIKE "%parameter:vra_retained:true%" ;;                  label: "Retained"}
      when: {        sql:  ${tags} LIKE "%parameter:vra_retained:false%" ;;                 label: "Not Retained"}
      else: "Other"
    }
  }

  dimension: vra_order_confirmed {
    label: "Retention: Order Confirmation"
    type: string
    case: {
      when: {        sql:  ${tags} LIKE "%parameter:order_preselection_confirmed:true%" ;;                  label: "Yes"}
      when: {        sql:  ${tags} LIKE "%parameter:order_preselection_confirmed:false%" ;;                 label: "No"}
      else: "NA"
    }
  }

  dimension: vra_tphase {
    label: "Retention: T Phase"
    type: string
    case: {
      when: {        sql:  ${tags} LIKE "%parameter:sub_info-t_phase:t+120%" ;;                   label: "Post Renewal T+120"}
      when: {        sql:  ${tags} LIKE "%parameter:sub_info-t_phase:t+60%" ;;                    label: "Post Renewal T+60"}
      when: {        sql:  ${tags} LIKE "%parameter:sub_info-t_phase:t-185%" ;;                   label: "Pre Renewal T-185"}
      when: {        sql:  ${tags} LIKE "%parameter:sub_info-t_phase:t-65%" ;;                    label: "Pre Renewal T-35"}
      when: {        sql:  ${tags} LIKE "%parameter:sub_info-t_phase:other%" ;;                   label: "Other"}
      else: "NA"
    }
  }

  dimension: response_type{
    label: "Response Type"
    type: string
    case: {
      when: {        sql:  ${tags} LIKE "%parameter:responsetype:datastore%" ;;           label: "DataStore GenAI"  }
      when: {        sql:  ${tags} LIKE "%parameter:responsetype:nomatch%" ;;             label: "No Match Response"}
      else: "Other"
    }
  }

  dimension: gen_ai_feedback{
    label: "Customer Feedback(Gen AI)"
    type: string
    case: {
      when: {        sql:  ${tags} LIKE "%parameter:feedback:positive%" ;;                label: "Positive"}
      when: {        sql:  ${tags} LIKE "%parameter:feedback:negative%" ;;                label: "Negative"}
      else: "Other"
    }
  }

  dimension: wait_time_choice {
    label: "Wait Msg Response"
    type: string
    case: {
      when: {        sql:  ${tags} LIKE "%parameter:wait_time_choice:wait%" ;;        label: "Wait"      }
      when: {        sql:  ${tags} LIKE "%parameter:wait_time_choice:leave%" ;;       label: "Leave"      }
      else: "Other"
    }
  }

  dimension: entry_missing {
    label: "Custom Params Missing?"
    type: yesno
    sql: ${tags} LIKE "%parameter:entry_missing:true%" ;;
  }

  dimension: india_case {
    label: "india case"
    type: yesno
    sql: ${tags} LIKE "%parameter:india_case:true%" ;;
  }


  measure: count_conversation {
    label: "Conversation Count"
    type: count_distinct
    sql: ${session_id} ;;
    drill_fields: [created_date,session_id,ID_VC]
  }

  measure: count_conversation_last_year {
    type: period_over_period
    description: "Conversation Count previous year"
    based_on: count_conversation
    based_on_time: created_year
    period: year
    kind: previous
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

  #Sales voice menu option
  dimension: sales_dtmf_selection {
    label: "Sales IVR selection"
    type: string
    case: {
      when: {        sql:  ${tags} LIKE "%parameter:sales_dtmf:dtmf_digits_1%" ;;        label: "Sales"     }
      when: {        sql:  ${tags} LIKE "%parameter:sales_dtmf:dtmf_digits_2%" ;;        label: "Support"   }
      when: {        sql:  ${tags} LIKE "%parameter:sales_dtmf:dtmf_digits_3%" ;;        label: "Spam"      }
      else: "Other"
    }
  }


  #brand
  dimension: environment {
    label: "Environment"
    type: string
    case: {
      when: {        sql:  ${tags} LIKE "%parameter:env:prod%" ;;     label: "Prod"      }
      when: {        sql:  ${tags} LIKE "%parameter:env:dev%" ;;      label: "Dev"      }
      else: "Other"
    }
  }

  #playbook
  dimension: playbook {
    label: "Playbook"
    type: string
    case: {
      when: {        sql:  ${tags} LIKE "%parameter:playbook:true%" AND ${tags} LIKE "%parameter:playbook_name:Customer Support and Issue Resolution V2%";;   label: "Playbook V2"      }
      when: {        sql:  ${tags} LIKE "%parameter:playbook:true%" AND ${tags} LIKE "%parameter:playbook_name:Customer Support and Issue Resolution%";;      label: "Playbook V1"      }
      when: {        sql:  ${tags} LIKE "%parameter:playbook:true%" ;;                                                                                        label: "Playbook"      }
      else: "Non-Playbook"
    }
  }

  dimension: playbook_name {
    label: "Playbook name"
    type: string
    sql:
    COALESCE(
      REGEXP_EXTRACT(${tags}, r'parameter:playbook_name:"([^"]+)"'),
      REGEXP_EXTRACT(${tags}, r'parameter:playbook_name:([^|]+)')
    ) ;;
  }

  #brand
  dimension: brand {
    label: "Brand"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:brandname:norton%" OR ${tags} LIKE "%parameter:tfn_company:norton%"
        OR ${tags} LIKE "%parameter:tfn_company:nortonvip%" OR ${tags} LIKE "%parameter:chat_company:norton%";;                  label: "Norton"}
      when: {sql:  ${tags} LIKE "%parameter:brandname:lifelock%" OR ${tags} LIKE "%parameter:tfn_company:ll%"
        OR ${tags} LIKE "%parameter:tfn_company:llvip%" OR ${tags} LIKE "%parameter:chat_company:lifelock%";;                    label: "LifeLock"}
      when: {sql:  ${tags} LIKE "%parameter:brandname:avast%" OR ${tags} LIKE "%parameter:tfn_company:avast%"
        OR ${tags} LIKE "%parameter:chat_company:avast%";;                                                                       label: "Avast"}
      when: {sql:  ${tags} LIKE "%parameter:brandname:A V G%" OR ${tags} LIKE "%parameter:brandname:avg%"
        OR ${tags} LIKE "%parameter:tfn_company:avg%" OR ${tags} LIKE "%parameter:chat_company:avg%";;                           label: "AVG"}
      else: "Other"
    }
  }

#### Auth Dimensions added on 30july25##

  dimension: auth_by_otp{
    label: "OTP_Auth"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:auth_by_otp:success%";;     label: "Success"}
      when: {sql:  ${tags} LIKE "%parameter:auth_by_otp:retry%";;    label: "Retry"}
      when: {sql:  ${tags} LIKE "%parameter:auth_by_otp:failed%";;    label: "Failed"}
      else: "Other"
    }
  }

  dimension: otp_email_available {
    label: "Otp_Email_Available"
    type: yesno
    sql: ${tags} LIKE "%parameter:otp_email_available:true%";;
  }

  dimension: otp_sms_available {
    label: "Otp_SMS_Available"
    type: yesno
    sql: ${tags} LIKE "%parameter:otp_sms_available:true%";;
  }

  dimension: otp_url_available {
    label: "Otp_URL_Available"
    type: yesno
    sql: ${tags} LIKE "%parameter:otp_url_available:true%";;
  }

  dimension: otp_method {
    label: "OTP_method_selected"
    type: string
    sql: REGEXP_EXTRACT(${tags}, 'otp_method:([^|]+)') ;;
  }


  dimension: ani_match {
    label: "ANI_Match"
    type: yesno
    sql: ${tags} LIKE "%parameter:ani_match:true%";;
  }


  dimension: lookup_refused {
    label: "Lookup_Refused"
    type: yesno
    sql: ${tags} LIKE "%parameter:lookup_refused:true%";;
  }


  dimension: lookup_confirmed{
    label: "Lookup - Email Confirmation"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:lookup_confirmed:true%";;     label: "Lookup Confirmed"}
      when: {sql:  ${tags} LIKE "%parameter:lookup_confirmed:false%";;    label: "Lookup Confirmation Failed"}
      # possibly more when statements
      else: "Other"
    }
  }

  dimension: us_ani{
    label: "Lookup - US ANI"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:us_ani:true%";;     label: "US ANI"}
      when: {sql:  ${tags} LIKE "%parameter:us_ani:false%";;    label: "Non US ANI"}
      # possibly more when statements
      else: "Other"
    }
  }

  dimension: allow_sms{
    label: "Lookup - Allow SMS"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:allow_sms:true%";;     label: "Can Send SMS"}
      when: {sql:  ${tags} LIKE "%parameter:allow_sms:false%";;    label: "Cannot Send SMS"}
      # possibly more when statements
      else: "Other"
    }
  }

  dimension: auth_status {
    label: "Lookup - Auth Status"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:auth_status:success%";;     label: "Auth Successful"}
      when: {sql:  ${tags} LIKE "%parameter:lookup_status:success%";;     label: "Lookup Successful"}
      when: {sql:  ${tags} LIKE "%parameter:lookup_performed:true%";;     label: "Lookup Performed"}

      # possibly more when statements
      else: "Other"
    }
  }

  dimension: lookup_by_ssn_yob_ani {
    label: "Lookup - By SSN+YOB+ANI"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:event:account\.lookup_by_ssn4_yob_ani\.failed%";;     label: "Lookup Failed"}
      when: {sql:  ${tags} LIKE "%parameter:event:account\.lookup_by_ssn4_yob_ani\.success%";;    label: "Lookup Successful"}

      # possibly more when statements
      else: "Other"
    }
  }

  dimension: lookup_by_ssn_yob_zip {
    label: "Lookup - By SSN+YOB+ZIP"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:event:account\.lookup_by_ssn4_yob_zip\.failed%";;     label: "Lookup Failed"}
      when: {sql:  ${tags} LIKE "%parameter:event:account\.lookup_by_ssn4_yob_zip\.success%";;    label: "Lookup Successful"}

      # possibly more when statements
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
      when: {sql:  ${tags} LIKE "%parameter:call_resolution:sre_dc%";;                                                                                label: "SRE Monitoring"}
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
    label: "Contained"
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
    label: "Escalated"
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
      when: {   sql:  ${tags} LIKE "%parameter:automation_eligible:true%";;     label: "Automation Eligible"       }
      when: {   sql:  ${tags} LIKE "%parameter:chattype:%chatbot%";;            label: "Automation Eligible"       }
      when: {   sql:  ${tags} LIKE "%parameter:chattype:%agent%";;              label: "Direct to Agent Chat"      }
      when: {   sql:  ${tags} LIKE "%parameter:fromIVR:true%";;                 label: "Automation Eligible"       }
      when: {   sql:  ${tags} LIKE "%parameter:entry:welcome%";;                label: "Automation Eligible"       }
      when: {   sql:  ${tags} LIKE "%parameter:entry:sales_flow%";;             label: "Sales Call Flow"           }
      when: {   sql:  ${tags} LIKE "%parameter:entry:basic_call_flow%";;        label: "Basic Call Flow"           }
      when: {   sql:  ${tags} LIKE "%parameter:entry:app_contactus_lifelock%";; label: "Direct to Agent Chat"      }
      when: {   sql:  ${tags} LIKE "%parameter:entry:direct_to_agent%";;        label: "Direct to Agent Call"      }
      when: {   sql:  ${tags} LIKE "%parameter:entry:dial_by_ext%";;            label: "Direct to Agent Call"      }
      else: "Other"
    }
  }

#temp dimension for upgrade offer acceptance ( currently looking only for accepted value)

  dimension: upgrade_Offer{
    label: "Upgrade offer"
    type: string
    case: {
      when: {   sql:  ${tags} LIKE "%parameter:upgradeofferaccept:voiceagent%";;     label: "Offer Accepted"       }
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
      when: {sql:  ${tags} LIKE "%parameter:solution_type_chat:guided%";;       label: "Guided"}
      else: "Other"
    }
  }

  dimension: chat_target{
    label: "Chat Target"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:chattype:agent%";;                  label: "Agent"}
      when: {sql:  ${tags} LIKE "%parameter:chattype:chatbot%";;                label: "Chatbot"}
      when: {sql:  ${tags} LIKE "%parameter:entry:app_contactus_lifelock%";;      label: "Agent"}
      when: {sql:  ${tags} LIKE "%parameter:entry:ngp_dl_norton%";;             label: "Chatbot"}
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
      when: {sql:  ${tags} LIKE "%parameter:use_case:activation_issue%";;                                     label: "Activation Issue"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:activation%";;                                           label: "Activation"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:alerts_l2%";;                                            label: "Alerts L2"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:alerts%";;                                               label: "Alerts"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:billing_issue%";;                                        label: "Billing Issue"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:billing_question%";;                                     label: "Billing Question"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:billing_charge%";;                                       label: "Billing Question - Charge"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:billing_date%";;                                         label: "Billing Question - Date"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:billing_fop%";;                                          label: "Billing Question - FOP"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:billing_confirmpayment%";;                               label: "Billing Question - Payment"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:license_buy%";;                                          label: "Buy"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:callback%";;                                             label: "Call Return"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:case_number%";;                                          label: "Case"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:cloudbackup_issue%";;                                    label: "Cloud Backup Issue"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:cloudbackup_restore%";;                                  label: "Cloud Backup Restore"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:cloudbackup_setup%";;                                    label: "Cloud Backup Setup"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:cloudbackup%";;                                          label: "Cloud Backup"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:norton_security%";;                                      label: "Device Protection"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:nortonsecurity_issue%";;                                 label: "Device Protection Issue"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:subscription_invoice%";;                                 label: "Invoice Download"}
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
      when: {sql:  ${tags} LIKE "%parameter:use_case:license_issue%";;                                        label: "License issue"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:live_agent%";;                                           label: "Live Agent"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:tech_agent%";;                                           label: "Live Agent - Technical"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:liveupdate_issue%";;                                     label: "Live Update Issue"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:liveupdate%";;                                           label: "Live Update"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:rpw_2FA%";;                                              label: "Login Issue - 2FA"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:rpw_pwm%";;                                              label: "Login Issue - PWM"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:rpw%";;                                                  label: "Login Issue - Online Account"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:productkey_find%";;                                      label: "Product Key - Find"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:productkey_issue%";;                                     label: "Product Key - Issue"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:productkey%";;                                           label: "Product Key"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:refund_status%";;                                        label: "Refund Status"}
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
      when: {sql:  ${tags} LIKE "%parameter:use_case:vpn_issue%";;                                            label: "VPN Issue"}
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
      # when: {sql:  ${tags} LIKE "%parameter:use_case:tbd%";;                                                  label: "TBD"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:installation_issue%";;                                   label: "Installation Issue"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:acct_info%";;                                            label: "Account Information"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:dl_find_installer%";;                                    label: "Download - Find Installer"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:dl_not_started%";;                                       label: "Download - Not Started"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:dl_stuck%";;                                             label: "Download - Stuck"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:install_status%";;                                       label: "Install Status"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:something_else%";;                                       label: "Something Else"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:dl_install_help%";;                                      label: "Download - Install Help"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:transfer_license%";;                                     label: "Transfer License"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:full_disk%";;                                            label: "Disk Space Full"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:credit_limit%";;                                         label: "Credit Limit"}

      when: {sql:  ${tags} LIKE "%parameter:use_case:acct_locked%";;                                          label: "Login Issue - Account Locked"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:subscription_downgrade%";;                               label: "Subscription Downgrade"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:subscription_expired%";;                                 label: "Subscription Expired"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:wrongful_cancelation%";;                                 label: "Wrongful Cancelation"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:false_detection%";;                                      label: "False Detection"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:malware_sample%";;                                       label: "Malware Sample"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:device_threat%";;                                        label: "Device Threat"}
      else: "Other"
    }
  }

  dimension: intent_category{
    label: "Intent Category"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:use_case:account_duplicate%";;                                    label:  "Account"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:account_info%";;                                         label:  "Account"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:account_setup%";;                                        label:  "Account"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:rpw_2FA%";;                                              label:  "Account"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:rpw_pwm%";;                                              label:  "Account"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:rpw%";;                                                  label:  "Account"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:subscription_info%";;                                    label:  "Account"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:manage_subscription%";;                                  label:  "Account"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:update_account%";;                                       label:  "Account"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:update_address%";;                                       label:  "Account"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:update_billing%";;                                       label:  "Account"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:update_email%";;                                         label:  "Account"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:update_phone%";;                                         label:  "Account"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:add_member%";;                                           label:  "Account"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:subscription_validate%";;                                label:  "Account"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:acct_info%";;                                            label:  "Account"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:acct_locked%";;                                          label:  "Account"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:subscription_downgrade%";;                               label:  "Account"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:subscription_expired%";;                                 label:  "Account"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:billing_issue%";;                                        label:  "Billing"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:billing_question%";;                                     label:  "Billing"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:billing_charge%";;                                       label:  "Billing"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:billing_date%";;                                         label:  "Billing"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:billing_fop%";;                                          label:  "Billing"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:billing_confirmpayment%";;                               label:  "Billing"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:activation_issue%";;                                     label:  "DL, Install & Activation"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:activation%";;                                           label:  "DL, Install & Activation"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:subscription_invoice%";;                                 label:  "DL, Install & Activation"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:download_issue%";;                                       label:  "DL, Install & Activation"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:download%";;                                             label:  "DL, Install & Activation"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:install_setup%";;                                        label:  "DL, Install & Activation"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:license_issue%";;                                        label:  "DL, Install & Activation"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:productkey_find%";;                                      label:  "DL, Install & Activation"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:productkey_issue%";;                                     label:  "DL, Install & Activation"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:productkey%";;                                           label:  "DL, Install & Activation"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:reinstall%";;                                            label:  "DL, Install & Activation"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:installation_issue%";;                                   label:  "DL, Install & Activation"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:dl_find_installer%";;                                    label:  "DL, Install & Activation"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:dl_not_started%";;                                       label:  "DL, Install & Activation"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:dl_stuck%";;                                             label:  "DL, Install & Activation"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:install_status%";;                                       label:  "DL, Install & Activation"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:dl_install_help%";;                                      label:  "DL, Install & Activation"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:transfer_license%";;                                     label:  "DL, Install & Activation"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:alerts_l2%";;                                            label:  "ITPS"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:alerts%";;                                               label:  "ITPS"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:identity_protection%";;                                  label:  "ITPS"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:identity_theft%";;                                       label:  "ITPS"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:collections%";;                                          label:  "ITPS"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:court_records%";;                                        label:  "ITPS"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:credit_score%";;                                         label:  "ITPS"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:dark_web%";;                                             label:  "ITPS"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:data_breach%";;                                          label:  "ITPS"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:financialmonitoring_error%";;                            label:  "ITPS"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:home_title%";;                                           label:  "ITPS"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:payday_loan%";;                                          label:  "ITPS"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:public_record%";;                                        label:  "ITPS"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:sex_offender%";;                                         label:  "ITPS"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:utility_account%";;                                      label:  "ITPS"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:lostwallet%";;                                           label:  "ITPS"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:credit_limit%";;                                         label:  "ITPS"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:live_agent%";;                                           label:  "Live Agent"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:tech_agent%";;                                           label:  "Live Agent"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:license_buy%";;                                          label:  "Misc"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:callback%";;                                             label:  "Misc"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:case_number%";;                                          label:  "Misc"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:spam%";;                                                 label:  "Misc"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:upgrade%";;                                              label:  "Misc"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:genie%";;                                                label:  "Misc"}
    # when: {sql:  ${tags} LIKE "%parameter:use_case:tbd%";;                                                  label:  "Misc"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:something_else%";;                                       label:  "Misc"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:redeem_uhd%";;                                           label:  "Premium Services"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:redeem_tuneup%";;                                        label:  "Premium Services"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:refund%";;                                               label:  "Renewal, Cancel & Refund"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:refund_status%";;                                        label:  "Renewal, Cancel & Refund"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:renewal%";;                                              label:  "Renewal, Cancel & Refund"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:subscription_cancel%";;                                  label:  "Renewal, Cancel & Refund"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:wrongful_cancelation%";;                                 label:  "Renewal, Cancel & Refund"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:cloudbackup_issue%";;                                    label:  "Technical"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:cloudbackup_restore%";;                                  label:  "Technical"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:cloudbackup_setup%";;                                    label:  "Technical"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:cloudbackup%";;                                          label:  "Technical"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:norton_security%";;                                      label:  "Technical"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:nortonsecurity_issue%";;                                 label:  "Technical"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:liveupdate_issue%";;                                     label:  "Technical"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:liveupdate%";;                                           label:  "Technical"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:vpn_issue%";;                                            label:  "Technical"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:vpn%";;                                                  label:  "Technical"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:virus removal%";;                                        label:  "Technical"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:virus_removal%";;                                        label:  "Technical"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:slow_computer%";;                                        label:  "Technical"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:browser_errors%";;                                       label:  "Technical"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:full_disk%";;                                            label:  "Technical"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:software_updater%";;                                     label:  "Technical"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:language_display%";;                                     label:  "Technical"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:threat%";;                                               label:  "Technical"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:full_disk%";;                                            label:  "Technical"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:false_detection%";;                                      label:  "Technical"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:malware_sample%";;                                       label:  "Technical"}
      when: {sql:  ${tags} LIKE "%parameter:use_case:device_threat%";;                                        label:  "Technical"}
      else: "Other"
    }
  }

  dimension: cxl_rfd_reason_collected {
    label: "Cancel Refund reason collected?"
    type: yesno
    sql: ${tags} LIKE "%parameter:cancel_refund_reason_collected:true%";;
  }

  dimension: last_renewed_date {
    type: string
    sql: FORMAT_DATE(
          '%b-%d',
          PARSE_DATE(
            '%Y-%m-%d',
            REGEXP_EXTRACT(${tags}, r'parameter:sub_info-last_renewed_date:(\d{4}-\d{2}-\d{2})')
          )
        ) ;;
  }


  dimension: days_since_last_renewed {
    type: number
    sql: DATE_DIFF(
          CURRENT_DATE(),
          PARSE_DATE(
            '%Y-%m-%d',
            REGEXP_EXTRACT(${tags}, r'parameter:sub_info-last_renewed_date:(\d{4}-\d{2}-\d{2})')
          ),
          DAY
        ) ;;
  }


  dimension: days_since_last_renewed_grouped {
    type: string
    sql:
    CASE
      WHEN DATE_DIFF(
        CURRENT_DATE(),
        PARSE_DATE('%Y-%m-%d', REGEXP_EXTRACT(${tags}, r'parameter:sub_info-last_renewed_date:(\d{4}-\d{2}-\d{2})')),
        DAY
      ) = 1 THEN '0-1 day'
      WHEN DATE_DIFF(
        CURRENT_DATE(),
        PARSE_DATE('%Y-%m-%d', REGEXP_EXTRACT(${tags}, r'parameter:sub_info-last_renewed_date:(\d{4}-\d{2}-\d{2})')),
        DAY
      ) = 2 THEN '1-2 days'
      WHEN DATE_DIFF(
        CURRENT_DATE(),
        PARSE_DATE('%Y-%m-%d', REGEXP_EXTRACT(${tags}, r'parameter:sub_info-last_renewed_date:(\d{4}-\d{2}-\d{2})')),
        DAY
      ) = 3 THEN '2-3 days'
      WHEN DATE_DIFF(
        CURRENT_DATE(),
        PARSE_DATE('%Y-%m-%d', REGEXP_EXTRACT(${tags}, r'parameter:sub_info-last_renewed_date:(\d{4}-\d{2}-\d{2})')),
        DAY
      ) BETWEEN 4 AND 7 THEN '4-7 days'
      WHEN DATE_DIFF(
        CURRENT_DATE(),
        PARSE_DATE('%Y-%m-%d', REGEXP_EXTRACT(${tags}, r'parameter:sub_info-last_renewed_date:(\d{4}-\d{2}-\d{2})')),
        DAY
      ) BETWEEN 8 AND 14 THEN '8-14 days'
      WHEN DATE_DIFF(
        CURRENT_DATE(),
        PARSE_DATE('%Y-%m-%d', REGEXP_EXTRACT(${tags}, r'parameter:sub_info-last_renewed_date:(\d{4}-\d{2}-\d{2})')),
        DAY
      ) BETWEEN 15 AND 30 THEN '15-30 days'
      WHEN DATE_DIFF(
        CURRENT_DATE(),
        PARSE_DATE('%Y-%m-%d', REGEXP_EXTRACT(${tags}, r'parameter:sub_info-last_renewed_date:(\d{4}-\d{2}-\d{2})')),
        DAY
      ) BETWEEN 31 AND 60 THEN '31-60 days'
      WHEN DATE_DIFF(
        CURRENT_DATE(),
        PARSE_DATE('%Y-%m-%d', REGEXP_EXTRACT(${tags}, r'parameter:sub_info-last_renewed_date:(\d{4}-\d{2}-\d{2})')),
        DAY
      ) > 60 THEN 'Beyond 60 days'
      ELSE 'Unknown'
    END ;;
  }


  dimension: estimated_renewal_price {
    type: number
    sql: CAST(
          REGEXP_EXTRACT(${tags}, r'parameter:sub_info-estimated_renewal_price:(\d+(?:\.\d+)?)') AS FLOAT64
        ) ;;
  }


  dimension: estimated_renewal_price_bucket {
    type: string
    sql:
    CASE
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-estimated_renewal_price:(\d+(?:\.\d+)?)') AS FLOAT64) = 0 THEN '$0'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-estimated_renewal_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 20 THEN '$1-$20'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-estimated_renewal_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 50 THEN '$20-$50'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-estimated_renewal_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 100 THEN '$50-$100'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-estimated_renewal_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 150 THEN '$100-$150'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-estimated_renewal_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 200 THEN '$150-$200'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-estimated_renewal_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 300 THEN '$200-$300'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-estimated_renewal_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 400 THEN '$300-$400'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-estimated_renewal_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 500 THEN '$400-$500'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-estimated_renewal_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 600 THEN '$500-$600'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-estimated_renewal_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 700 THEN '$600-$700'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-estimated_renewal_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 800 THEN '$700-$800'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-estimated_renewal_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 900 THEN '$800-$900'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-estimated_renewal_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 1000 THEN '$900-$1000'
      ELSE 'Over $1000'
    END ;;
  }




  dimension: purchase_price {
    type: number
    sql: CAST(
          REGEXP_EXTRACT(${tags}, r'parameter:sub_info-purchase_price:(\d+(?:\.\d+)?)') AS FLOAT64
        ) ;;
  }


  dimension: purchase_price_bucket {
    type: string
    sql:
    CASE
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-purchase_price:(\d+(?:\.\d+)?)') AS FLOAT64) = 0 THEN '$0'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-purchase_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 20 THEN '$1-$20'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-purchase_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 50 THEN '$20-$50'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-purchase_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 100 THEN '$50-$100'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-purchase_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 150 THEN '$100-$150'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-purchase_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 200 THEN '$150-$200'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-purchase_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 300 THEN '$200-$300'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-purchase_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 400 THEN '$300-$400'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-purchase_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 500 THEN '$400-$500'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-purchase_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 600 THEN '$500-$600'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-purchase_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 700 THEN '$600-$700'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-purchase_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 800 THEN '$700-$800'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-purchase_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 900 THEN '$800-$900'
      WHEN CAST(REGEXP_EXTRACT(${tags}, r'parameter:sub_info-purchase_price:(\d+(?:\.\d+)?)') AS FLOAT64) <= 1000 THEN '$900-$1000'
      ELSE 'Over $1000'
    END ;;
  }


  dimension: cxl_rfd_reason{
    label: "Cancel Refund Reason"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:cancel_refund_cust_reason:high_price%";;               label: "Price too High"}
      when: {sql:  ${tags} LIKE "%parameter:cancel_refund_cust_reason:no_longer_needed%";;         label: "No Longer needed"}
      when: {sql:  ${tags} LIKE "%parameter:cancel_refund_cust_reason:ar_questions%";;             label: "AR Questions"}
      when: {sql:  ${tags} LIKE "%parameter:cancel_refund_cust_reason:complaint_product%";;        label: "Product Complaint"}
      when: {sql:  ${tags} LIKE "%parameter:cancel_refund_cust_reason:switch_competitor%";;        label: "Switch to Competitor"}
      when: {sql:  ${tags} LIKE "%parameter:cancel_refund_cust_reason:wrong_product%";;            label: "Wrong Product"}
      when: {sql:  ${tags} LIKE "%parameter:cancel_refund_cust_reason:complaint_support%";;        label: "Support Complaint"}
      when: {sql:  ${tags} LIKE "%parameter:cancel_refund_cust_reason:deceased customer%";;        label: "Deceased customer"}
      when: {sql:  ${tags} LIKE "%parameter:cancel_refund_cust_reason:product_errors%";;           label: "Technical Issues"}
      when: {sql:  ${tags} LIKE "%parameter:cancel_refund_cust_reason:multiple_purchase%";;        label: "Multiple Purchases"}
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
      when: {sql:  ${tags} LIKE "%parameter:entry:app_avastipm_home%";;       label: "APP IPM Avast"}
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
      when: {sql:  ${tags} LIKE "%parameter:entry:direct_to_agent%";;         label: "IVR Direct to Agent Call" }
      else: "Unknown Entry"
    }
  }

  dimension: device_type{
    label: "Device Info"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:browseros:Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36%";;label: "Windows"}
      when: {sql:  ${tags} LIKE "%parameter:browseros:Android%";;label: "Android"}
      when: {sql:  ${tags} LIKE "%parameter:browseros:Linux x%";;label: "Linux"}
      when: {sql:  ${tags} LIKE "%parameter:browseros:Mac OS%";;label: "Mac OS"}
      when: {sql:  ${tags} LIKE "%parameter:browseros:Mozilla/5.0 (Linux; Android;%";;label: "Android"}
      when: {sql:  ${tags} LIKE "%parameter:browseros:Mozilla/5.0 (Macintosh; Intel Mac OS X%";;label: "Mac OS"}
      when: {sql:  ${tags} LIKE "%parameter:browseros:Mozilla/5.0 (Windows NT%";;label: "Windows"}
      when: {sql:  ${tags} LIKE "%parameter:browseros:Mozilla/5.0 (X11;%";;label: "Chrome OS"}
      when: {sql:  ${tags} LIKE "%parameter:browseros:Mozilla/5.0 (iPad;%";;label: "iPad"}
      when: {sql:  ${tags} LIKE "%parameter:browseros:Mozilla/5.0 (iPhone;%";;label: "iPhone"}
      when: {sql:  ${tags} LIKE "%parameter:browseros:Windows%";;label: "Windows"}
      when: {sql:  ${tags} LIKE "%parameter:browseros:iOS%";;label: "iPhone"}
      else: "Other"
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
      when: {sql:  ${tags} LIKE "%parameter:ct:aa%";;         label: "Aruba"}
      when: {sql:  ${tags} LIKE "%parameter:ct:ar%";;         label: "Argentina"}
      when: {sql:  ${tags} LIKE "%parameter:ct:au%";;         label: "Australia"}
      when: {sql:  ${tags} LIKE "%parameter:ct:br%";;         label: "Brazil"}
      when: {sql:  ${tags} LIKE "%parameter:ct:ca%";;         label: "Canada"}
      when: {sql:  ${tags} LIKE "%parameter:ct:de%";;         label: "Germany"}
      when: {sql:  ${tags} LIKE "%parameter:ct:dk%";;         label: "Denmark"}
      when: {sql:  ${tags} LIKE "%parameter:ct:es%";;         label: "Spain"}
      when: {sql:  ${tags} LIKE "%parameter:ct:fi%";;         label: "Finland"}
      when: {sql:  ${tags} LIKE "%parameter:ct:fr%";;         label: "France"}
      when: {sql:  ${tags} LIKE "%parameter:ct:hu%";;         label: "Hungary"}
      when: {sql:  ${tags} LIKE "%parameter:ct:ie%";;         label: "Ireland"}
      when: {sql:  ${tags} LIKE "%parameter:ct:ie%";;         label: "Ireland"}
      when: {sql:  ${tags} LIKE "%parameter:ct:in%";;         label: "India"}
      when: {sql:  ${tags} LIKE "%parameter:ct:ir%";;         label: "Ireland"}
      when: {sql:  ${tags} LIKE "%parameter:ct:it%";;         label: "Italy"}
      when: {sql:  ${tags} LIKE "%parameter:ct:jp%";;         label: "Japan"}
      when: {sql:  ${tags} LIKE "%parameter:ct:me%";;         label: "Montenegro"}
      when: {sql:  ${tags} LIKE "%parameter:ct:mx%";;         label: "Mexico"}
      when: {sql:  ${tags} LIKE "%parameter:ct:my%";;         label: "Malaysia"}
      when: {sql:  ${tags} LIKE "%parameter:ct:nl%";;         label: "Netherlands"}
      when: {sql:  ${tags} LIKE "%parameter:ct:no%";;         label: "Norway"}
      when: {sql:  ${tags} LIKE "%parameter:ct:nz%";;         label: "New Zealand"}
      when: {sql:  ${tags} LIKE "%parameter:ct:ph%";;         label: "Phillipines"}
      when: {sql:  ${tags} LIKE "%parameter:ct:pl%";;         label: "Poland"}
      when: {sql:  ${tags} LIKE "%parameter:ct:pr%";;         label: "Puerto Rico"}
      when: {sql:  ${tags} LIKE "%parameter:ct:pt%";;         label: "Portugal"}
      when: {sql:  ${tags} LIKE "%parameter:ct:ro%";;         label: "Romania"}
      when: {sql:  ${tags} LIKE "%parameter:ct:se%";;         label: "Sweden"}
      when: {sql:  ${tags} LIKE "%parameter:ct:sg%";;         label: "Singapore"}
      when: {sql:  ${tags} LIKE "%parameter:ct:sp%";;         label: "Spain"}
      when: {sql:  ${tags} LIKE "%parameter:ct:tr%";;         label: "Turkey"}
      when: {sql:  ${tags} LIKE "%parameter:ct:gb%";;         label: "UK"}
      when: {sql:  ${tags} LIKE "%parameter:ct:uk%";;         label: "UK"}
      when: {sql:  ${tags} LIKE "%parameter:ct:us%";;         label: "US"}
      when: {sql:  ${tags} LIKE "%parameter:ct:za%";;         label: "South Africa"}
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
      when: {sql:  ${tags} LIKE "%parameter:lg:pl%";;         label: "Polish"}
      when: {sql:  ${tags} LIKE "%parameter:lg:pt%";;         label: "Portuguese"}
      when: {sql:  ${tags} LIKE "%parameter:lg:sv%";;         label: "Swedish"}
      when: {sql:  ${tags} LIKE "%parameter:lg:da%";;         label: "Danish"}
      when: {sql:  ${tags} LIKE "%parameter:lg:nl%";;         label: "Dutch"}
      when: {sql:  ${tags} LIKE "%parameter:lg:tr%";;         label: "Turkish"}
      when: {sql:  ${tags} LIKE "%parameter:lg:fi%";;         label: "Finnish"}
      when: {sql:  ${tags} LIKE "%parameter:lg:no%";;         label: "Norwegian"}
      when: {sql:  ${tags} LIKE "%parameter:lg:ro%";;         label: "Romanian"}
      when: {sql:  ${tags} LIKE "%parameter:lg:hu%";;         label: "Hungarian"}
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

dimension: routing_queue_nlok {
  label: "Routing Queue Nlok"
  type: string
  case: {
    when: {sql:  ${tags} LIKE "%parameter:menu_id:362%";;                 label: "Chat: eStore Acquisition"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:515%";;                 label: "Chat: AOL"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:516%";;                 label: "Chat: AROOD"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:517%";;                 label: "Chat: ATT"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:519%";;                 label: "Chat: Comcast"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:520%";;                 label: "Chat: CRI"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:521%";;                 label: "Chat: CSP"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:522%";;                 label: "Chat: Dispatch"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:523%";;                 label: "Chat: EAP"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:524%";;                 label: "Chat: Empower"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:525%";;                 label: "Chat: ITPS"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:528%";;                 label: "Chat: Mac"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:529%";;                 label: "Chat: Mobile"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:530%";;                 label: "Chat: Norton Core"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:531%";;                 label: "Chat: NortonGo"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:532%";;                 label: "Chat: NPM"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:534%";;                 label: "Chat: NWP"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:535%";;                 label: "Chat: OEM TT"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:536%";;                 label: "Chat: Other Products"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:537%";;                 label: "Chat: PartnerNet"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:538%";;                 label: "Chat: Renewal Purchase"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:539%";;                 label: "Chat: Security Windows"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:540%";;                 label: "Chat: Telus Breach"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:541%";;                 label: "Chat: Telus"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:542%";;                 label: "Chat: Threat Removal"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:543%";;                 label: "Chat: UHD Delivery"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:557%";;                 label: "Chat: KDDI"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:559%";;                 label: "Chat: DWM"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:560%";;                 label: "Chat: Machine Translate"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:567%";;                 label: "Chat: LifeLock Identity"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:16%" ;;                 label: "Voice: LifeLock Basic (16)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:56%" ;;                 label: "Voice: LifeLock IPA (56)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:53%" ;;                 label: "Voice: IPA Upsell (53)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:677%" ;;                label: "Voice: LifeLock VIP Retention (677)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:678%" ;;                label: "Voice: Norton VIP Renewal (678)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:331%";;                 label: "Voice: EB US ACCOUNT (331)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:121%";;                 label: "Voice: UHD Services Queue (121)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:138%";;                 label: "Voice: Computer Tuneup Queue (138)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:60%";;                  label: "Voice: LifeLock Alerts (60)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:80%";;                  label: "Voice: Acct Service Queue (80)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:89%";;                  label: "Voice: MAC (89)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:90%";;                  label: "Voice: Mobile (90)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:53";;                   label: "Voice: IPA Upsell (53)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:88%";;                  label: "Voice: US WinSecurity (88)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:306%";;                 label: "Voice: LifeLock Retention (306)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:307%";;                 label: "Voice: LifeLock Retention Priority (307)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:308%";;                 label: "Voice: Norton Renewals (308)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:81%";;                  label: "Voice: EN US CSP (81)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:7%";;                   label: "Voice: Sales High (81)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:8%";;                   label: "Voice: Sales Mid (81)"}
    when: {sql:  ${tags} LIKE "%parameter:menu_id:9%";;                   label: "Voice: Sales Low (81)"}


# possibly more when statements
    else: "Other"
  }
}

# Retention Dimensions

  dimension: customer_retention_flow {
    label: "Retention Flow"
    type: yesno
    sql: ${tags} LIKE "%parameter:customer_retention_flow:true%";;
  }


  dimension: retention_info_collected {
    label: "Ret_Info Collected"
    type: yesno
    sql: ${tags} LIKE "%parameter:retention_info_collected:true%";;
  }


  dimension: order_id {
    label: "Order ID"
    type: string
    sql: REGEXP_EXTRACT(${tags}, 'order_id:([^|]+)') ;;
  }


  dimension: Purchase_Price {
    label: "Order Price"
    type: number
    sql: safe_cast(REGEXP_EXTRACT(${tags}, 'purchase_price:([0-9.]+)') as FLOAT64) ;;
    value_format: "#.00"
  }


  dimension: Retention_Status {
    label: "Retention status"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:ret_status:cancel%";;                  label: "Cancelled"}
      when: {sql:  ${tags} LIKE "%parameter:ret_status:retained%";;                  label: "Retained"}
      else: "Other"
    }
  }


  dimension: Is_Itps {
    label: "Is Itps"
    type: yesno
    sql: ${tags} LIKE "%parameter:sub_info-is_itps:true%";;
  }

  dimension: Product_Name {
    label: "Product Name"
    type: string
    sql: REGEXP_EXTRACT(${tags}, 'sub_info-product_name:([^|]+)') ;;
  }



  dimension: Billing_Cycle {
    label: "Billing Cycle"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:sub_info-billing_cycle:annual%";;                  label: "Annual"}
      when: {sql:  ${tags} LIKE "%parameter:sub_info-billing_cycle:monthly%";;                  label: "Monthly"}
      else: "Other"
    }
  }


  dimension: matched_rule_code {
    label: "Matched Rule Code"
    type: string
    sql: REGEXP_EXTRACT(${tags}, 'matched_rule_code:([^|]+)') ;;
  }


  dimension: renewal_count {
    label: "Renewal Count"
    type: number
    sql: safe_cast(REGEXP_EXTRACT(${tags}, 'sub_info-renewal_count:([0-9]+)') as INTEGER) ;;
  }

  dimension: Currency_Code {
    label: "Currency Code"
    type: string
    sql: REGEXP_EXTRACT(${tags}, 'sub_info-purchase_currency:([^|]+)') ;;
  }


  ########### Ineligible Reasons ###########

  dimension: Ineligible_Reason1 {
    label: "Ineligible Reason 1"
    type: string
    sql: NULLIF(REGEXP_REPLACE(REGEXP_EXTRACT(${tags}, 'ineligible_reasons1:([^|]+)'), '\\[|\\]', ''), '') ;;
  }



  dimension: Ineligible_Reason2 {
    label: "Ineligible Reason 2"
    type: string
    sql: NULLIF(REGEXP_REPLACE(REGEXP_EXTRACT(${tags}, 'ineligible_reasons2:([^|]+)'), '\\[|\\]', ''), '') ;;
  }



  dimension: Ineligible_Reason3 {
    label: "Ineligible Reason 3"
    type: string
    sql: NULLIF(REGEXP_REPLACE(REGEXP_EXTRACT(${tags}, 'ineligible_reasons3:([^|]+)'), '\\[|\\]', ''), '') ;;
  }


  dimension: Ineligible_Reason4 {
    label: "Ineligible Reason 4"
    type: string
    sql: NULLIF(REGEXP_REPLACE(REGEXP_EXTRACT(${tags}, 'ineligible_reasons4:([^|]+)'), '\\[|\\]', ''), '') ;;
  }

########### Retention Offers ###########


  dimension: offer1 {
    label: "Offer - 1"
    type: string
    sql: CASE
         WHEN REGEXP_EXTRACT(${tags}, 'parameter:refund-percentage1:([0-9.]+)') IS NOT NULL
         THEN CONCAT(
           REGEXP_EXTRACT(${tags}, 'offer1:([^|]+)'),
           '_',
           REGEXP_EXTRACT(${tags}, 'parameter:refund-percentage1:([0-9.]+)')
         )
         ELSE REGEXP_EXTRACT(${tags}, 'offer1:([^|]+)')
       END ;;
  }


  dimension: offer2 {
    label: "Offer - 2"
    type: string
    sql: CASE
         WHEN REGEXP_EXTRACT(${tags}, 'parameter:refund-percentage2:([0-9.]+)') IS NOT NULL
         THEN CONCAT(
           REGEXP_EXTRACT(${tags}, 'offer2:([^|]+)'),
           '_',
           REGEXP_EXTRACT(${tags}, 'parameter:refund-percentage2:([0-9.]+)')
         )
         ELSE REGEXP_EXTRACT(${tags}, 'offer2:([^|]+)')
       END ;;
  }



  dimension: offer3 {
    label: "Offer - 3"
    type: string
    sql: CASE
         WHEN REGEXP_EXTRACT(${tags}, 'parameter:refund-percentage3:([0-9.]+)') IS NOT NULL
         THEN CONCAT(
           REGEXP_EXTRACT(${tags}, 'offer3:([^|]+)'),
           '_',
           REGEXP_EXTRACT(${tags}, 'parameter:refund-percentage3:([0-9.]+)')
         )
         ELSE REGEXP_EXTRACT(${tags}, 'offer3:([^|]+)')
       END ;;
  }


  dimension: offer4 {
    label: "Offer - 4"
    type: string
    sql: CASE
         WHEN REGEXP_EXTRACT(${tags}, 'parameter:refund-percentage4:([0-9.]+)') IS NOT NULL
         THEN CONCAT(
           REGEXP_EXTRACT(${tags}, 'offer4:([^|]+)'),
           '_',
           REGEXP_EXTRACT(${tags}, 'parameter:refund-percentage4:([0-9.]+)')
         )
         ELSE REGEXP_EXTRACT(${tags}, 'offer4:([^|]+)')
       END ;;
  }


########## Offer Presented ###############

  dimension: offer_presented1 {
    label: "Offer Presented 1"
    type: yesno
    sql: ${tags} LIKE "%parameter:offer-presented1:true%";;
  }

  dimension: offer_presented2 {
    label: "Offer-Presented 2"
    type: yesno
    sql: ${tags} LIKE "%parameter:offer-presented2:true%";;
  }

  dimension: offer_presented3 {
    label: "Offer-Presented 3"
    type: yesno
    sql: ${tags} LIKE "%parameter:offer-presented3:true%";;
  }

  dimension: offer_presented4 {
    label: "Offer-Presented 4"
    type: yesno
    sql: ${tags} LIKE "%parameter:offer-presented4:true%";;
  }

########## Offer Accepted ###############

  dimension: offer_accepted1 {
    label: "Offer Accepted 1"
    type: yesno
    sql: ${tags} LIKE "%parameter:offer-accepted1:true%";;
  }


  dimension: offer_accepted2 {
    label: "Offer Accepted 2"
    type: yesno
    sql: ${tags} LIKE "%parameter:offer-accepted2:true%";;
  }


  dimension: offer_accepted3 {
    label: "Offer Accepted 3"
    type: yesno
    sql: ${tags} LIKE "%parameter:offer-accepted3:true%";;
  }


  dimension: offer_accepted4 {
    label: "Offer Accepted 4"
    type: yesno
    sql: ${tags} LIKE "%parameter:offer-accepted4:true%";;
  }



  dimension: Refund_Amount {
    label: "Refunded Amount:"
    type: number
    sql: CASE
      WHEN ${offer_accepted1} = TRUE
          THEN safe_cast(REGEXP_EXTRACT(${tags}, 'parameter:refund-total1:([0-9.]+)') as FLOAT64)

      WHEN ${offer_accepted2} = TRUE
          THEN safe_cast(REGEXP_EXTRACT(${tags}, 'parameter:refund-total2:([0-9.]+)') as FLOAT64)

      WHEN ${offer_accepted3} = TRUE
          THEN safe_cast(REGEXP_EXTRACT(${tags}, 'parameter:refund-total3:([0-9.]+)') as FLOAT64)

      WHEN ${offer_accepted4} = TRUE
          THEN safe_cast(REGEXP_EXTRACT(${tags}, 'parameter:refund-total4:([0-9.]+)') as FLOAT64)

      ELSE 0

      END ;;
    value_format: "#.00"
  }

############## Retention Eligibility ##########

dimension: retention_offer_eligible {
  label: "VRA Offer Eligbility"
  type: string
  sql:
    CASE
    WHEN ${conversation_tags.vra_order_confirmed} = "No"
      OR ${conversation_tags.vra_order_confirmed} = "NA"
      THEN "Ineligible - Order Confirmation"

    WHEN ${conversation_tags.offer1} = "no-rule-matched"
      THEN "Ineligible - Matrix Exception"

    WHEN ${conversation_tags.offer1} = "failed"
      THEN "Ineligible - Failure"

    WHEN ${conversation_tags.offer1} = "escalate"
      THEN "Ineligible - Matrix Escalation"

    WHEN ${conversation_tags.offer_presented1} = TRUE
      OR ${conversation_tags.offer_presented2} = TRUE
      OR ${conversation_tags.offer_presented3} = TRUE
      OR ${conversation_tags.offer_presented4} = TRUE
      THEN "Eligible"

    WHEN IFNULL(STRPOS(${conversation_tags.Ineligible_Reason1}, "country"), 0) > 0
      THEN "Ineligible - Country"

    WHEN IFNULL(STRPOS(${conversation_tags.Ineligible_Reason1}, "multiple"), 0) > 0
      THEN "Ineligible - Multiple Product"

    WHEN IFNULL(STRPOS(${conversation_tags.Ineligible_Reason1}, "ar_already_off"), 0) > 0
      THEN "Ineligible - AR Off"

    WHEN IFNULL(STRPOS(${conversation_tags.Ineligible_Reason1}, "outside_money"), 0) > 0
      THEN "Ineligible - Outside MBG"

    WHEN IFNULL(STRPOS(${conversation_tags.Ineligible_Reason1}, "already_refunded"), 0) > 0
      THEN "Ineligible - Refunded"

    ELSE "Ineligible - Other"
  END;;
}

dimension: retention_offer_accepted {
  label: "VRA Offer Accepted"
  type: string
  sql:
    CASE
      WHEN ${retention_offer_eligible} = "Eligible" THEN
        CASE
          WHEN ${conversation_tags.offer_accepted1} = TRUE THEN ${conversation_tags.offer1}
          WHEN ${conversation_tags.offer_accepted2} = TRUE THEN ${conversation_tags.offer2}
          WHEN ${conversation_tags.offer_accepted3} = TRUE THEN ${conversation_tags.offer3}
          WHEN ${conversation_tags.offer_accepted4} = TRUE THEN ${conversation_tags.offer4}
          ELSE "All Offers Rejected"
        END
      ELSE "NA"
    END;;
}
############## Retention Measures #############

# 1. Retained count
  measure: retained {
    type: count
    filters: [conversation_tags.Retention_Status: "Retained"]
    description: "Count of retained customers"
  }

# 2. Eligible for offer count
  measure: eligible_for_offer {
    type: count
    filters: [conversation_tags.retention_offer_eligible: "Eligible"]
    description: "Count of customers eligible for offer"
  }

# 3. Retention Rate
  measure: retention_rate {
    type: number
    sql: CASE
         WHEN ${eligible_for_offer} != 0 THEN ${retained} / ${eligible_for_offer}
         ELSE NULL
       END ;;
    value_format_name: percent_2
    description: "Retention rate among eligible customers"
  }


  measure: Saved_Amount {
    label: "Saved Amount"
    type: sum
    sql:
    CASE
      WHEN ${tags} LIKE '%parameter:vra_retained:true%' THEN ${Purchase_Price} - ${Refund_Amount}
      ELSE 0
    END
  ;;
    value_format: "#.00"
  }


  measure: Count_Retained {
    label: "Retained_Cnt"
    type: count_distinct
    sql: ${session_id} ;;
    filters: [Retention_Status: "Retained"]
  }



  measure: Offer_Presented_C {
    label: "No.Offers Presented"
    type: sum
    sql: CASE
     WHEN ${offer_presented4} = TRUE
         THEN 4
     WHEN ${offer_presented3} = TRUE
         THEN 3
     WHEN ${offer_presented2} = TRUE
         THEN 2
     WHEN ${offer_presented1} = TRUE
         THEN 1
    ELSE 0
       END ;;
  }

  measure: Offer_Accepted_C {
    label: "No.Offers Accepted"
    type: sum
    sql: CASE
     WHEN ${offer_accepted1} = TRUE
         THEN 1
     WHEN ${offer_accepted2} = TRUE
         THEN 1
     WHEN ${offer_accepted3} = TRUE
         THEN 1
     WHEN ${offer_accepted4} = TRUE
         THEN 1
    ELSE 0
       END ;;
  }


  measure: Amount_Refunded {
    label: "Refund Amount"
    type: sum
    sql: ${Refund_Amount} ;;
    value_format: "#.00"
  }


  measure: Count_Ret_Eligible {
    label: "Ret_Eligible"
    type: count_distinct
    sql: ${session_id} ;;
    filters: [retention_info_collected: "Yes"]
  }


  measure: Retention_Percentage {
    label: "Retention %"
    type: number
    sql:  ${Count_Retained} / ${Count_Ret_Eligible};;
    value_format_name: percent_2
  }


  ##############################################################################################



  dimension: routing_queue_avast_avg {
    label: "Routing Queue Avast AVG"
    type: string
    case: {
      when: {sql:  ${tags} LIKE "%parameter:menu_id:55%";;                  label: "Voice: AVAST Account Services (55)"}
      when: {sql:  ${tags} LIKE "%parameter:menu_id:54%";;                  label: "Voice: AVAST Tech (54)"}
      when: {sql:  ${tags} LIKE "%parameter:menu_id:43%";;                  label: "Voice: AVG Account Services (43)"}
      when: {sql:  ${tags} LIKE "%parameter:menu_id:42%";;                  label: "Voice: AVG Tech (42)"}
      when: {sql:  ${tags} LIKE "%parameter:menu_id:44%";;                  label: "Voice: AVG Refund (44)"}
      when: {sql:  ${tags} LIKE "%parameter:menu_id:56%";;                  label: "Voice: AVAST Refund (56)"}
# possibly more when statements
      else: "Other"
    }
  }
  set: detail {
    fields: [
      session_id,
      chat_id,
      call_id_test,
      ID_VC
    ]
  }
  parameter: date_granularity_picker {
    label: "Date Granularity"
    type: unquoted
    allowed_value: {
      label: "Day"
      value: "__day__"
    }
    allowed_value: {
      label: "Week"
      value: "__week__"
    }
    allowed_value: {
      label: "Month"
      value: "__month__"
    }
    allowed_value: {
      label: "Quarter"
      value: "__quarter__"
    }
    default_value: "__day__"
  }

  dimension: date_granularity {
    sql:
      {% if date_granularity_picker._parameter_value == '__day__' %}
        ${created_date}
      {% elsif date_granularity_picker._parameter_value == '__week__' %}
        ${created_week}
      {% elsif date_granularity_picker._parameter_value == '__month__' %}
        ${created_month}
      {% elsif date_granularity_picker._parameter_value == '__quarter__' %}
        ${created_quarter}
      {% endif%} ;;
  }
}
