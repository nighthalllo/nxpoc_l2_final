view: lgcns_nxpoc_survey_llm_result {
  sql_table_name: `NXPOC_L2.LGCNS_NXPOC_SURVEY_LLM_RESULT` ;;

  dimension: category {
    type: string
    sql: ${TABLE}.CATEGORY ;;
  }
  dimension: criteria {
    type: string
    sql: ${TABLE}.CRITERIA ;;
  }
  dimension: criteria_id {
    type: string
    sql: ${TABLE}.CRITERIA_ID ;;
  }
  dimension: summary_subjective_answer {
    type: string
    sql: ${TABLE}.SUMMARY_SUBJECTIVE_ANSWER ;;
  }
  measure: count {
    type: count
  }
}
