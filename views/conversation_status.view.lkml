view: conversation_status {
  sql_table_name: `support-df-cx-26hwzn7k.df_cx_iva.conversation_status`
    ;;

#Time/Duration metrics&dimensions
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

  measure: max_timestamp {
    hidden: yes
    type: date_time
    sql: MAX(${receive_timestamp_raw}) ;;
  }

  measure: min_timestamp {
    hidden: yes
    type: date_time
    sql: MIN(${receive_timestamp_raw}) ;;
  }

  dimension_group: max_timestamp {
    type: time
    label: "Conversation End"
    group_label: "Conversation End"
    description: "Time when session ended"
  }
  dimension_group: min_timestamp {
    type: time
    label: "Conversation Start"
    group_label: "Conversation Start"
    description: "Time when session started"
  }

  dimension: conversation_duration {
    label: "Session Duration (Seconds)"
    description: "Number of seconds from beginning to end of session"
    type: duration_second
    sql_start: ${min_timestamp_raw} ;;
    sql_end: ${max_timestamp_raw} ;;
    group_label: "Duration"
  }

  dimension: conversation_duration_tiers {
    label: "Session Duration Tier (Seconds)"
    description: "Tiers sessions based on number of seconds from beginning to end of session"
    type: tier
    tiers: [0,10,30,120,560]
    sql: ${conversation_duration} ;;
    group_label: "Duration"
  }

  dimension: conversation_duration_minutes {
    label: "Session Duration (Minutes)"
    description: "Number of Minutes from beginning to end of session"
    type: duration_minute
    sql_start: ${min_timestamp_raw} ;;
    sql_end: ${max_timestamp_raw} ;;
    group_label: "Duration"
  }

  dimension: session_duration_tiers_minutes {
    label: "Session Duration Tier (Minutes)"
    description: "Tiers sessions based on number of minutes from beginning to end of session"
    type: tier
    tiers: [1,2,5,10]
    sql: ${conversation_duration} ;;
    group_label: "Duration"
  }

  measure: average_session_duration {
    type: average
    label: "Average Session Duration (Seconds)"
    sql: ${conversation_duration};;
    value_format_name: decimal_1
    description: "Average length of session in number of seconds"
  }

  measure: total_session_duration {
    type: sum
    label: "Total Session Duration (Seconds)"
    sql: ${conversation_duration};;
    value_format_name: decimal_1
    description: "Total length of sessions in number of seconds"
  }

#Intent Metrics

  dimension: matched_intent {
    type: string
    sql: ${TABLE}.matchedIntent ;;
  }

  dimension: intent_type{
    description: "Full, Partial Solution,No Use Case & Speak with agent"
    type:  string
    sql: CASE WHEN ${matched_intent} in ("intent.alert","intent.collections","intent.courtrecords","intent.creditscore","intent.darkweb",
                                          "intent.databreach","intent.download","intent.download.issue","intent.email.update","intent.hometitle","intent.login.issue",
                                          "intent.paydayloan","intent.publicrecord","intent.sexoffender","intent.spam","intent.subscription.cancel","intent.update.account",
                                          "intent.update.address","intent.update.billing","intent.update.phone","intent.virus","intent.utilityaccount")
                                     THEN "Full Solution"
              WHEN ${matched_intent} in ("intent.accountinfo","intent.billing.charge","intent.subscription.manage","intent.subscription.info",
                                         "intent.billing.confirmpayment","intent.activate","intent.billing.issue","intent.billing.date","intent.activation.issue",
                                         "intent.billing.fop","intent.billing.questions","intent.financialmonitoring.error","intent.add.member")
                                     THEN "Partial Solution"
              WHEN ${matched_intent} in ("intent.subscription.renew","intent.call.return","intent.identity.theft","intent.identity.protection",
                                         "intent.subscription.refund","intent.case","intent.liveupdate","intent.subscription.buy","intent.nortonsecurity",
                                        "intent.account.duplicate", "intent.account.setup", "intent.cloudbackup", "intent.cloudbackup.issue",
                                        "intent.cloudbackup.restore", "intent.cloudbackup.setup", "intent.nortonsecurity.error", "intent.install.status",
                                        "intent.license.issue", "intent.liveupdate.issue", "intent.lostwallet", "intent.productkey", "intent.productkey.find",
                                        "intent.reinstall", "intent.vpn", "intent.vpn.issues", "intent.productkey.issue", "intent.hacked")
                                     THEN "No Use Case"
              WHEN ${matched_intent} in ("intent.liveagent","intent.liveagent.technical","intent.subscription.upgrade")
                                     THEN "Speak with an Agent"
        ELSE ${matched_intent} END;;
  }

  dimension: insert_id {
    label: "Conversation Turn"
    type: string
    sql: ${TABLE}.insertId ;;
  }

  dimension: last_text {
    description: "Last text before call transfer / call disconnect"
    type: string
    sql: ${TABLE}.last_text ;;
  }

  dimension: operation {
    label: "Call Type"
    description: "Call Transfer, Disconnect, Hangup"
    type: string
    sql: ${TABLE}.operation ;;
  }

  dimension: session_id {
    label: "Conversation ID"
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: status{
    type:  string
    sql: CASE WHEN ${operation} in ("DISCONNECT", "HANGUP") THEN "CONTAINED"
      ELSE "ESCALATED" END;;
  }

  dimension: dk_sessionid_insertid {
    hidden: yes
    type: string
    sql: CONCAT(${session_id}, ${insert_id}) ;;
  }

  measure: count_insertid_per_session {
    label: "Conversation Turn Count"
    type: count_distinct
    sql: ${dk_sessionid_insertid} ;;
  }

  measure: count_session {
    label: "Conversation Count"
    type: count_distinct
    sql: ${session_id} ;;
  }

#Drill-through

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }

}
