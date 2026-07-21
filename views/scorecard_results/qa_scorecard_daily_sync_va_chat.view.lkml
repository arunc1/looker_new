# The name of this view in Looker is "Qa Scorecard Daily Sync Va Chat"
view: qa_scorecard_daily_sync_va_chat {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `scorecard_results.qa_scorecard_daily_sync_va_chat` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Agent ID" in Explore.

  dimension: agent_id {
    type: string
    sql: ${TABLE}.agentId ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: analysed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.analysedTime ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: conversation_id {
    type: string
    sql: ${TABLE}.conversationId ;;
  }

  dimension: did_the_customer_report_not_receiving_the_code_via_email_or_sms_and_did_the_va_handle_it_appropriately_answer {
    type: string
    sql: ${TABLE}.did_the_customer_report_not_receiving_the_code_via_email_or_sms_and_did_the_va_handle_it_appropriately_answer ;;
  }

  dimension: did_the_customer_report_not_receiving_the_code_via_email_or_sms_and_did_the_va_handle_it_appropriately_score {
    type: string
    sql: ${TABLE}.did_the_customer_report_not_receiving_the_code_via_email_or_sms_and_did_the_va_handle_it_appropriately_score ;;
  }

  dimension: did_the_va_avoid_promoting_competitors_answer {
    type: string
    sql: ${TABLE}.did_the_va_avoid_promoting_competitors_answer ;;
  }

  dimension: did_the_va_avoid_promoting_competitors_score {
    type: string
    sql: ${TABLE}.did_the_va_avoid_promoting_competitors_score ;;
  }

  dimension: did_the_va_avoid_providing_unsafe_noncompliant_or_hallucinated_responses_answer {
    type: string
    sql: ${TABLE}.did_the_va_avoid_providing_unsafe_noncompliant_or_hallucinated_responses_answer ;;
  }

  dimension: did_the_va_avoid_providing_unsafe_noncompliant_or_hallucinated_responses_score {
    type: string
    sql: ${TABLE}.did_the_va_avoid_providing_unsafe_noncompliant_or_hallucinated_responses_score ;;
  }

  dimension: did_the_va_avoid_robotic_or_repetitive_responses_answer {
    type: string
    sql: ${TABLE}.did_the_va_avoid_robotic_or_repetitive_responses_answer ;;
  }

  dimension: did_the_va_avoid_robotic_or_repetitive_responses_score {
    type: string
    sql: ${TABLE}.did_the_va_avoid_robotic_or_repetitive_responses_score ;;
  }

  dimension: did_the_va_avoid_using_technical_jargon_or_complex_language_that_may_confuse_the_customer_answer {
    type: string
    sql: ${TABLE}.did_the_va_avoid_using_technical_jargon_or_complex_language_that_may_confuse_the_customer_answer ;;
  }

  dimension: did_the_va_avoid_using_technical_jargon_or_complex_language_that_may_confuse_the_customer_score {
    type: string
    sql: ${TABLE}.did_the_va_avoid_using_technical_jargon_or_complex_language_that_may_confuse_the_customer_score ;;
  }

  dimension: did_the_va_correctly_identify_the_customers_primary_intent_answer {
    type: string
    sql: ${TABLE}.did_the_va_correctly_identify_the_customers_primary_intent_answer ;;
  }

  dimension: did_the_va_correctly_identify_the_customers_primary_intent_score {
    type: string
    sql: ${TABLE}.did_the_va_correctly_identify_the_customers_primary_intent_score ;;
  }

  dimension: did_the_va_correctly_initiate_account_lookup_when_required_considering_authentication_status_answer {
    type: string
    sql: ${TABLE}.did_the_va_correctly_initiate_account_lookup_when_required_considering_authentication_status_answer ;;
  }

  dimension: did_the_va_correctly_initiate_account_lookup_when_required_considering_authentication_status_score {
    type: string
    sql: ${TABLE}.did_the_va_correctly_initiate_account_lookup_when_required_considering_authentication_status_score ;;
  }

  dimension: did_the_va_correctly_send_or_trigger_sending_of_the_authentication_code_answer {
    type: string
    sql: ${TABLE}.did_the_va_correctly_send_or_trigger_sending_of_the_authentication_code_answer ;;
  }

  dimension: did_the_va_correctly_send_or_trigger_sending_of_the_authentication_code_score {
    type: string
    sql: ${TABLE}.did_the_va_correctly_send_or_trigger_sending_of_the_authentication_code_score ;;
  }

  dimension: did_the_va_direct_the_customer_to_nortoncomverify_to_obtain_or_enter_the_authentication_code_answer {
    type: string
    sql: ${TABLE}.did_the_va_direct_the_customer_to_nortoncomverify_to_obtain_or_enter_the_authentication_code_answer ;;
  }

  dimension: did_the_va_direct_the_customer_to_nortoncomverify_to_obtain_or_enter_the_authentication_code_score {
    type: string
    sql: ${TABLE}.did_the_va_direct_the_customer_to_nortoncomverify_to_obtain_or_enter_the_authentication_code_score ;;
  }

  dimension: did_the_va_direct_the_customer_to_the_appropriate_thirdparty_or_correct_brand_support_when_the_query_was_outside_the_scope_of_the_our_brand_answer {
    type: string
    sql: ${TABLE}.did_the_va_direct_the_customer_to_the_appropriate_thirdparty_or_correct_brand_support_when_the_query_was_outside_the_scope_of_the_our_brand_answer ;;
  }

  dimension: did_the_va_direct_the_customer_to_the_appropriate_thirdparty_or_correct_brand_support_when_the_query_was_outside_the_scope_of_the_our_brand_score {
    type: string
    sql: ${TABLE}.did_the_va_direct_the_customer_to_the_appropriate_thirdparty_or_correct_brand_support_when_the_query_was_outside_the_scope_of_the_our_brand_score ;;
  }

  dimension: did_the_va_escalate_to_a_live_agent_when_the_customer_was_not_able_to_follow_the_instructions_answer {
    type: string
    sql: ${TABLE}.did_the_va_escalate_to_a_live_agent_when_the_customer_was_not_able_to_follow_the_instructions_answer ;;
  }

  dimension: did_the_va_escalate_to_a_live_agent_when_the_customer_was_not_able_to_follow_the_instructions_score {
    type: string
    sql: ${TABLE}.did_the_va_escalate_to_a_live_agent_when_the_customer_was_not_able_to_follow_the_instructions_score ;;
  }

  dimension: did_the_va_give_the_customer_sufficient_time_to_enter_the_authentication_code_answer {
    type: string
    sql: ${TABLE}.did_the_va_give_the_customer_sufficient_time_to_enter_the_authentication_code_answer ;;
  }

  dimension: did_the_va_give_the_customer_sufficient_time_to_enter_the_authentication_code_score {
    type: string
    sql: ${TABLE}.did_the_va_give_the_customer_sufficient_time_to_enter_the_authentication_code_score ;;
  }

  dimension: did_the_va_identify_and_handle_all_distinct_intents_present_in_the_conversation_answer {
    type: string
    sql: ${TABLE}.did_the_va_identify_and_handle_all_distinct_intents_present_in_the_conversation_answer ;;
  }

  dimension: did_the_va_identify_and_handle_all_distinct_intents_present_in_the_conversation_score {
    type: string
    sql: ${TABLE}.did_the_va_identify_and_handle_all_distinct_intents_present_in_the_conversation_score ;;
  }

  dimension: did_the_va_maintain_a_consistent_experience_throughout_the_interaction_answer {
    type: string
    sql: ${TABLE}.did_the_va_maintain_a_consistent_experience_throughout_the_interaction_answer ;;
  }

  dimension: did_the_va_maintain_a_consistent_experience_throughout_the_interaction_score {
    type: string
    sql: ${TABLE}.did_the_va_maintain_a_consistent_experience_throughout_the_interaction_score ;;
  }

  dimension: did_the_va_offer_a_live_agent_when_the_customers_request_was_outside_the_vas_scope_to_resolve_answer {
    type: string
    sql: ${TABLE}.did_the_va_offer_a_live_agent_when_the_customers_request_was_outside_the_vas_scope_to_resolve_answer ;;
  }

  dimension: did_the_va_offer_a_live_agent_when_the_customers_request_was_outside_the_vas_scope_to_resolve_score {
    type: string
    sql: ${TABLE}.did_the_va_offer_a_live_agent_when_the_customers_request_was_outside_the_vas_scope_to_resolve_score ;;
  }

  dimension: did_the_va_offer_authentication_when_required_answer {
    type: string
    sql: ${TABLE}.did_the_va_offer_authentication_when_required_answer ;;
  }

  dimension: did_the_va_offer_authentication_when_required_score {
    type: string
    sql: ${TABLE}.did_the_va_offer_authentication_when_required_score ;;
  }

  dimension: did_the_va_offer_live_help_before_attempting_to_provide_a_resolution_answer {
    type: string
    sql: ${TABLE}.did_the_va_offer_live_help_before_attempting_to_provide_a_resolution_answer ;;
  }

  dimension: did_the_va_offer_live_help_before_attempting_to_provide_a_resolution_score {
    type: string
    sql: ${TABLE}.did_the_va_offer_live_help_before_attempting_to_provide_a_resolution_score ;;
  }

  dimension: did_the_va_provide_clear_instructions_to_enter_the_authentication_code_answer {
    type: string
    sql: ${TABLE}.did_the_va_provide_clear_instructions_to_enter_the_authentication_code_answer ;;
  }

  dimension: did_the_va_provide_clear_instructions_to_enter_the_authentication_code_score {
    type: string
    sql: ${TABLE}.did_the_va_provide_clear_instructions_to_enter_the_authentication_code_score ;;
  }

  dimension: did_the_va_provide_correct_information_in_response_to_the_customers_query_answer {
    type: string
    sql: ${TABLE}.did_the_va_provide_correct_information_in_response_to_the_customers_query_answer ;;
  }

  dimension: did_the_va_provide_correct_information_in_response_to_the_customers_query_score {
    type: string
    sql: ${TABLE}.did_the_va_provide_correct_information_in_response_to_the_customers_query_score ;;
  }

  dimension: did_the_va_show_empathy_where_required_answer {
    type: string
    sql: ${TABLE}.did_the_va_show_empathy_where_required_answer ;;
  }

  dimension: did_the_va_show_empathy_where_required_score {
    type: string
    sql: ${TABLE}.did_the_va_show_empathy_where_required_score ;;
  }

  dimension: did_the_va_successfully_resolve_the_customers_query_or_escalate_to_a_live_agent_answer {
    type: string
    sql: ${TABLE}.did_the_va_successfully_resolve_the_customers_query_or_escalate_to_a_live_agent_answer ;;
  }

  dimension: did_the_va_successfully_resolve_the_customers_query_or_escalate_to_a_live_agent_score {
    type: string
    sql: ${TABLE}.did_the_va_successfully_resolve_the_customers_query_or_escalate_to_a_live_agent_score ;;
  }

  dimension: did_the_va_use_the_appropriate_transfer_script_when_transferring_to_live_help_answer {
    type: string
    sql: ${TABLE}.did_the_va_use_the_appropriate_transfer_script_when_transferring_to_live_help_answer ;;
  }

  dimension: did_the_va_use_the_appropriate_transfer_script_when_transferring_to_live_help_score {
    type: string
    sql: ${TABLE}.did_the_va_use_the_appropriate_transfer_script_when_transferring_to_live_help_score ;;
  }

  dimension: did_va_stop_responding_in_the_middle_of_the_conversation_that_led_to_customer_disconnecting_the_conversation_answer {
    type: string
    sql: ${TABLE}.did_va_stop_responding_in_the_middle_of_the_conversation_that_led_to_customer_disconnecting_the_conversation_answer ;;
  }

  dimension: did_va_stop_responding_in_the_middle_of_the_conversation_that_led_to_customer_disconnecting_the_conversation_score {
    type: string
    sql: ${TABLE}.did_va_stop_responding_in_the_middle_of_the_conversation_that_led_to_customer_disconnecting_the_conversation_score ;;
  }

  dimension: if_the_issue_was_resolved_did_the_va_confirm_the_resolution_and_ask_if_further_assistance_was_needed_answer {
    type: string
    sql: ${TABLE}.if_the_issue_was_resolved_did_the_va_confirm_the_resolution_and_ask_if_further_assistance_was_needed_answer ;;
  }

  dimension: if_the_issue_was_resolved_did_the_va_confirm_the_resolution_and_ask_if_further_assistance_was_needed_score {
    type: string
    sql: ${TABLE}.if_the_issue_was_resolved_did_the_va_confirm_the_resolution_and_ask_if_further_assistance_was_needed_score ;;
  }

  dimension: language_code {
    type: string
    sql: ${TABLE}.languageCode ;;
  }

  dimension: mtchat {
    type: string
    sql: ${TABLE}.MTChat ;;
  }

  dimension: normalized_score {
    type: number
    sql: ${TABLE}.normalizedScore ;;
  }

  dimension: overall_score {
    type: number
    sql: ${TABLE}.overallScore ;;
  }

  dimension: potential_score {
    type: number
    sql: ${TABLE}.potentialScore ;;
  }

  dimension: scorecard_name {
    type: string
    sql: ${TABLE}.scorecard_name ;;
  }

  dimension_group: start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.startTime ;;
  }

  dimension: start_time_utc {
    type: number
    sql: ${TABLE}.startTimeUtc ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: topics_results {
    hidden: yes
    sql: ${TABLE}.topicsResults ;;
  }

  dimension: turn_count {
    type: number
    sql: ${TABLE}.turnCount ;;
  }

  dimension: was_the_authentication_code_successfully_validated_answer {
    type: string
    sql: ${TABLE}.was_the_authentication_code_successfully_validated_answer ;;
  }

  dimension: was_the_authentication_code_successfully_validated_score {
    type: string
    sql: ${TABLE}.was_the_authentication_code_successfully_validated_score ;;
  }

  dimension: was_the_call_or_chat_successfully_connected_to_a_live_agent_answer {
    type: string
    sql: ${TABLE}.was_the_call_or_chat_successfully_connected_to_a_live_agent_answer ;;
  }

  dimension: was_the_call_or_chat_successfully_connected_to_a_live_agent_score {
    type: string
    sql: ${TABLE}.was_the_call_or_chat_successfully_connected_to_a_live_agent_score ;;
  }

  dimension: was_the_conversation_successfully_resolved_1_answer {
    type: string
    sql: ${TABLE}.was_the_conversation_successfully_resolved_1_answer ;;
  }

  dimension: was_the_conversation_successfully_resolved_1_score {
    type: string
    sql: ${TABLE}.was_the_conversation_successfully_resolved_1_score ;;
  }

  dimension: was_the_conversation_successfully_resolved_answer {
    type: string
    sql: ${TABLE}.was_the_conversation_successfully_resolved_answer ;;
  }

  dimension: was_the_conversation_successfully_resolved_score {
    type: string
    sql: ${TABLE}.was_the_conversation_successfully_resolved_score ;;
  }

  dimension: was_the_information_clear_complete_and_actionable_for_the_customer_defect_management_answer {
    type: string
    sql: ${TABLE}.was_the_information_clear_complete_and_actionable_for_the_customer_defect_management_answer ;;
  }

  dimension: was_the_information_clear_complete_and_actionable_for_the_customer_defect_management_score {
    type: string
    sql: ${TABLE}.was_the_information_clear_complete_and_actionable_for_the_customer_defect_management_score ;;
  }

  dimension: was_the_tone_appropriate_and_conversational_answer {
    type: string
    sql: ${TABLE}.was_the_tone_appropriate_and_conversational_answer ;;
  }

  dimension: was_the_tone_appropriate_and_conversational_score {
    type: string
    sql: ${TABLE}.was_the_tone_appropriate_and_conversational_score ;;
  }

  dimension: was_the_va_able_to_execute_the_requested_tasks_accurately_answer {
    type: string
    sql: ${TABLE}.was_the_va_able_to_execute_the_requested_tasks_accurately_answer ;;
  }

  dimension: was_the_va_able_to_execute_the_requested_tasks_accurately_score {
    type: string
    sql: ${TABLE}.was_the_va_able_to_execute_the_requested_tasks_accurately_score ;;
  }

  dimension: was_there_a_meaningful_interaction_between_the_customer_and_the_virtual_agent_va_to_evaluate_performance_answer {
    type: string
    sql: ${TABLE}.was_there_a_meaningful_interaction_between_the_customer_and_the_virtual_agent_va_to_evaluate_performance_answer ;;
  }

  dimension: was_there_a_meaningful_interaction_between_the_customer_and_the_virtual_agent_va_to_evaluate_performance_score {
    type: string
    sql: ${TABLE}.was_there_a_meaningful_interaction_between_the_customer_and_the_virtual_agent_va_to_evaluate_performance_score ;;
  }

  dimension: were_relevant_kb_links_or_resource_urls_shared_with_the_customer_answer {
    type: string
    sql: ${TABLE}.were_relevant_kb_links_or_resource_urls_shared_with_the_customer_answer ;;
  }

  dimension: were_relevant_kb_links_or_resource_urls_shared_with_the_customer_score {
    type: string
    sql: ${TABLE}.were_relevant_kb_links_or_resource_urls_shared_with_the_customer_score ;;
  }

  dimension: when_the_intent_was_unclear_did_the_va_ask_relevant_clarifying_questions_answer {
    type: string
    sql: ${TABLE}.when_the_intent_was_unclear_did_the_va_ask_relevant_clarifying_questions_answer ;;
  }

  dimension: when_the_intent_was_unclear_did_the_va_ask_relevant_clarifying_questions_score {
    type: string
    sql: ${TABLE}.when_the_intent_was_unclear_did_the_va_ask_relevant_clarifying_questions_score ;;
  }

  dimension: who_escalated_the_conversation_answer {
    type: string
    sql: ${TABLE}.who_escalated_the_conversation_answer ;;
  }

  dimension: who_escalated_the_conversation_score {
    type: string
    sql: ${TABLE}.who_escalated_the_conversation_score ;;
  }
  measure: count {
    type: count
    drill_fields: [scorecard_name]
  }
}

# The name of this view in Looker is "Qa Scorecard Daily Sync Va Chat Topics Results"
view: qa_scorecard_daily_sync_va_chat__topics_results {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Qa Scorecard Daily Sync Va Chat Topics Results" in Explore.

  dimension: qa_scorecard_daily_sync_va_chat__topics_results {
    type: string
    sql: qa_scorecard_daily_sync_va_chat__topics_results ;;
  }
}
