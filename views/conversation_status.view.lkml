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
                                          "intent.paydayloan","intent.publicrecord","intent.sexoffender","intent.spam", "intent.update.account",
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
                                        "intent.reinstall", "intent.vpn", "intent.vpn.issues", "intent.productkey.issue", "intent.subscription.cancel", "intent.hacked")
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
