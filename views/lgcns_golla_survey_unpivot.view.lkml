view: lgcns_golla_survey_unpivot {
  sql_table_name: `NXPOC_L2.LGCNS_GOLLA_SURVEY_UNPIVOT` ;;

  dimension: answer_content_list_exploded {
    type: string
    sql: ${TABLE}.answer_content_list_exploded ;;
  }
  dimension: answer_content_list_exploded2_matrix_answer_contentlist_content {
    type: string
    sql: ${TABLE}.answer_content_list_exploded2_matrix_answer_contentlist_content ;;
  }
  dimension: answer_id {
    type: number
    sql: ${TABLE}.answer_id ;;
  }
  dimension: nexonsn {
    type: number
    sql: ${TABLE}.nexonsn ;;
  }
  dimension: num_answer_content_list_exploded2_matrix_answer_contentlist_content {
    type: number
    sql: ${TABLE}.num_answer_content_list_exploded2_matrix_answer_contentlist_content ;;
  }
  dimension: question_id {
    type: string
    sql: ${TABLE}.Question_id ;;
  }
  dimension: question_title2 {
    type: string
    sql: ${TABLE}.question_title2 ;;
  }
  dimension: question_view_content {
    type: string
    sql: ${TABLE}.question_view_content ;;
  }
  dimension: survey_id {
    type: number
    sql: ${TABLE}.survey_id ;;
  }
  measure: count {
    type: count
  }
}
