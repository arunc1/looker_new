view: event {
  sql_table_name: `support-df-cx-26hwzn7k.df_cx_iva.event`
    ;;

  dimension: insert_id {
    label: "Conversation Turn"
    type: string
    sql: ${TABLE}.insertId ;;
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

  dimension: matched_intent {
    type: string
    sql: ${TABLE}.matchedIntent ;;
  }

  dimension: request_type {
    description: "request/response"
    type: string
    sql: ${TABLE}.Request_type ;;
  }

  dimension: session_id {
    drill_fields: [conversation_lookup*]
    label: "Conversation Id"
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: source {
    description: "Agent/Customer"
    type: string
    sql: ${TABLE}.Source ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.Text ;;
  }

  dimension: operation {
    label: "Call Type"
    description: "Whether conversation was a Transfer, Disconnect, or Hangup"
    type: string
    sql: ${TABLE}.operation ;;
  }

  dimension: dk_sessionid_insertid {
    hidden: yes
    type: string
    sql: CONCAT(${session_id}, ${insert_id}) ;;
  }

  dimension: is_conversation_escalated{
    type: yesno
    sql: ${operation} = "TRANSFER";;
  }

  dimension: status{
    description: "Escalated (Transfer) vs Contained (Disconnect, Hangup)"
    type:  string
    sql: CASE WHEN ${operation} in ("DISCONNECT", "HANGUP") THEN "CONTAINED"
        ELSE "ESCALATED" END;;
  }

  dimension: intent_type{
    description: "Full, Partial Solution,No Use Case & Speak with agent"
    type:  string
    sql: CASE WHEN ${matched_intent} in ("intent.account.duplicate","intent.accountinfo","intent.account.setup","intent.activate","intent.activation.issue",
    "intent.alert","intent.billing.issue","intent.billing.questions","intent.billing.charge","intent.billing.date","intent.billing.fop",
    "intent.billing.confirmpayment","intent.subscription.buy","intent.call.return","intent.case","intent.cloudbackup","intent.cloudbackup.issue",
    "intent.cloudbackup.restore","intent.cloudbackup.setup","intent.nortonsecurity","intent.nortonsecurity.error","intent.download","intent.download.issue",
    "intent.identity.protection","intent.identity.theft","intent.install.status","intent.courtrecords","intent.creditscore","intent.darkweb","intent.databreach",
    "intent.hometitle","intent.paydayloan","intent.publicrecord","intent.sexoffender","intent.license.issue","intent.liveagent","intent.liveagent.technical",
    "intent.liveupdate","intent.liveupdate.issue","intent.login.issue","intent.productkey","intent.productkey.find","intent.productkey.issue",
    "intent.subscription.refund","intent.reinstall","intent.subscription.renew","intent.spam","intent.subscription.cancel","intent.subscription.info",
    "intent.subscription.manage","intent.liveagent.technical","intent.liveagent.technical","intent.liveagent.technical","intent.update.account",
    "intent.update.address","intent.update.billing","intent.email.update","intent.update.phone","intent.subscription.upgrade","intent.vpn","intent.vpn.issues",
    "intent.lostwallet","intent.collections","intent.virus") THEN "Full Solution"
              WHEN ${matched_intent} in ("intent.billing.questions","intent.accountinfo","intent.billing.charge","intent.subscription.manage",
    "intent.subscription.info","intent.billing.confirmpayment","intent.activate","intent.billing.issue","intent.billing.date","intent.activation.issue",
    "intent.billing.fop") THEN "Partial Solution"
      ELSE "NO SOLUTION" END;;
  }

  # Across all the conversation
  # Use Session Level → not include InsertID
  dimension: dk_session_id_matchedIntent {
    hidden: yes
    type: string
    sql: CONCAT(${session_id},${matched_intent}) ;;
  }

  measure: count_calltype {
    hidden: yes
    type: count_distinct
    sql: ${operation} ;;
  }
  measure: minimum_timestamp {
    label: "Start Call Time"
    type: date_time
    sql: CAST(MIN(${receive_timestamp_raw}) AS TIMESTAMP) ;;
  }

  measure: maximum_timestamp {
    label: "End Call Time"
    type: date_time
    sql: CAST(MAX(${receive_timestamp_raw}) AS TIMESTAMP) ;;
  }

  measure: duration_minutes {
    label: "Duration Minutes"
    type: number
    description: "Call duration in minutes"
    sql:TIMESTAMP_DIFF(CAST(MAX(${receive_timestamp_raw}) AS TIMESTAMP),CAST(MIN(${receive_timestamp_raw}) AS TIMESTAMP), MINUTE)  ;;
  }

  measure: count_session {
    drill_fields: [conversation_lookup*]
    label: "Conversation Count"
    type: count_distinct
    sql: ${session_id} ;;
  }

  measure: count_insertid_per_session {
    label: "Conversation Turn Count"
    type: count_distinct
    sql: ${dk_sessionid_insertid} ;;
  }
  measure: total_count_matchedIntent {
    type: count_distinct
    sql:${dk_session_id_matchedIntent} ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }

  set: conversation_lookup {
    fields: [
      minimum_timestamp,
      operation,
      status,
      matched_intent,
      duration_minutes,
      source
    ]}
}
