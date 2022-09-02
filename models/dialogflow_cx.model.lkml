connection: "voice_stage"

# include all the views
include: "/views/**/*.view"

datagroup: dialogflow_cx_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: dialogflow_cx_default_datagroup


explore: event {}

explore: metric_1 {}

explore: metric_3 {}

explore: metric_4 {}

explore: metric_5 {}
