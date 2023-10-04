view: lgcns_nxpoc_surveyform {
  sql_table_name: `NXPOC_L2.LGCNS_NXPOC_SURVEYFORM` ;;

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension_group: creation {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.creation_date ;;
  }
  dimension: is_regular {
    type: string
    sql: ${TABLE}.is_regular ;;
  }
  dimension_group: last_update {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.last_update_date ;;
  }
  dimension: question_group {
    type: string
    sql: ${TABLE}.question_group ;;
  }
  dimension: question_id {
    type: string
    sql: ${TABLE}.question_id ;;
  }
  dimension: question_seq {
    type: string
    sql: ${TABLE}.question_seq ;;
  }
  dimension: question_title {
    type: string
    sql: ${TABLE}.question_title ;;
  }
  dimension: survey1_id {
    type: string
    sql: ${TABLE}.survey1_id ;;
  }
  dimension: survey1_name {
    type: string
    sql: ${TABLE}.survey1_name ;;
  }
  dimension: survey2_id {
    type: string
    sql: ${TABLE}.survey2_id ;;
  }
  dimension: survey2_name {
    type: string
    sql: ${TABLE}.survey2_name ;;
  }
  dimension: survey3_id {
    type: string
    sql: ${TABLE}.survey3_id ;;
  }
  dimension: survey3_name {
    type: string
    sql: ${TABLE}.survey3_name ;;
  }
  dimension: survey_type {
    type: string
    sql: ${TABLE}.survey_type ;;
  }
  measure: count {
    type: count
    drill_fields: [survey3_name, survey2_name, survey1_name]
  }
}
