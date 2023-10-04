view: lgcns_golla_surveyform {
  sql_table_name: `NXPOC_L2.LGCNS_GOLLA_SURVEYFORM` ;;

  dimension: question_id {
    type: string
    sql: ${TABLE}.Question_id ;;
  }
  dimension: question_title2 {
    type: string
    sql: ${TABLE}.question_title2 ;;
  }
  measure: count {
    type: count
  }
}
