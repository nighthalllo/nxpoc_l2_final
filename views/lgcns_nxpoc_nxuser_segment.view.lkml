view: lgcns_nxpoc_nxuser_segment {
  sql_table_name: `NXPOC_L2.LGCNS_NXPOC_NXUSER_SEGMENT` ;;

  dimension: answer_likert_cnt {
    type: number
    sql: ${TABLE}.answer_likert_cnt ;;
  }
  dimension: answer_select_cnt {
    type: number
    sql: ${TABLE}.answer_select_cnt ;;
  }
  dimension: answer_text_cnt {
    type: number
    sql: ${TABLE}.answer_text_cnt ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: group_title {
    type: string
    sql: ${TABLE}.group_title ;;
  }
  dimension: is_main_account {
    type: string
    sql: ${TABLE}.is_main_account ;;
  }
  dimension: is_none_access {
    type: yesno
    sql: ${TABLE}.is_none_access ;;
  }
  dimension: is_none_info_group_title {
    type: yesno
    sql: ${TABLE}.is_none_info_group_title ;;
  }
  dimension: is_none_info_main_account {
    type: yesno
    sql: ${TABLE}.is_none_info_main_account ;;
  }
  dimension: is_none_korean_open_ended {
    type: yesno
    sql: ${TABLE}.is_none_korean_open_ended ;;
  }
  dimension: is_response_unreliable {
    type: yesno
    sql: ${TABLE}.is_response_unreliable ;;
  }
  dimension: is_same_response {
    type: yesno
    sql: ${TABLE}.is_same_response ;;
  }
  dimension: new_or_return_user {
    type: string
    sql: ${TABLE}.new_or_return_user ;;
  }
  dimension: nexonsn {
    type: number
    sql: ${TABLE}.nexonsn ;;
  }
  dimension: question_cnt {
    type: number
    sql: ${TABLE}.question_cnt ;;
  }
  dimension: same_response_ratio {
    type: number
    sql: ${TABLE}.same_response_ratio ;;
  }
  dimension_group: sdate {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.sdate ;;
  }
  dimension_group: sdatetime {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.sdatetime ;;
  }
  dimension: sid {
    type: number
    value_format_name: id
    sql: ${TABLE}.sid ;;
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
