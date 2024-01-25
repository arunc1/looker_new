view: conversations_agent_environment {
  sql_table_name: `support-df-cx-26hwzn7k.df_cx_iva.conversations_agent_environment` ;;

  dimension: agent_id {
    type: string
    sql: ${TABLE}.agent_id ;;
  }
  dimension: environment_id {
    type: string
    sql: ${TABLE}.environment_id ;;
  }
  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }
  measure: count {
    type: count
  }
  dimension: environment_prod {
    label: "DF Agent"
    type: string
    case: {
      when: {        sql: ${environment_id} = "d3aa2cbe-708d-4651-9b68-6267af4f225b" ;;              label: "Agent-CCAI-IVA"}
      when: {        sql: ${environment_id} = "742212b1-aa52-4dc7-916f-e006bb1ac3c9" ;;              label: "Agent-IVA"}
      when: {        sql: ${environment_id} = "7a42f901-bf6c-44eb-b6b7-fce7a18c4d4d" ;;              label: "Agent-IVA-Avast-AVG"}
      when: {        sql: ${environment_id} = "eadb0652-414b-43f4-8d76-114f5fd5f911" ;;              label: "Agent-CCAIP-SecureIVR"}
      when: {        sql: ${environment_id} = "45517b1d-f27f-40c8-8c87-42ccdd42a1ae" ;;              label: "Agent-CCAIP-Chat-LLMobileApp"}
      when: {        sql: ${environment_id} = "c2fe5684-aa20-4215-8294-9afd06f4c122" ;;              label: "Agent-CCAIP-Japanese Chatbot"}
      when: {        sql: ${environment_id} = "f3003d70-117f-44ad-b2a1-860799eea913" ;;              label: "Agent-CCAIP-NSL Chatbot"}
      else: "Other"
      }
    }
}
