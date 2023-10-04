view: lgcns_v2_survey {

  sql_table_name: `NXPOC_L2.LGCNS_NXPOC_SURVEY` ;;

  dimension: survey3_name {
    description: "서베이소분류"
    type: string
    sql: ${TABLE}.survey3_name ;;
  }
  dimension: question_title {
    description: "질문명"
    type: string
    sql: ${TABLE}.question_title ;;
  }

  dimension: question_group {
    description: "질문그룹"
    type: string
    sql: ${TABLE}.question_group ;;
  }

  dimension: question_sequence {
    description: "질문순서"
    type: string
    sql: ${TABLE}.question_sequence ;;
  }


  dimension: answer_id {
    description: "답변 ID"
    type: number
    sql: ${TABLE}.answer_id ;;
  }
  dimension: answer_num {
    group_label: "Answer"
    description: "답변 - 숫자"
    type: number
    sql: ${TABLE}.answer_num ;;
  }
  dimension: answer_num_raw {
    group_label: "Answer"
    description: "답변 - 숫자 Raw"
    type: string
    sql: ${TABLE}.answer_num_raw ;;
  }
  dimension: answer_select {
    group_label: "Answer"
    description: "답변 - 선택"
    type: string
    sql: ${TABLE}.answer_select ;;
  }
  dimension: answer_text {
    group_label: "Answer"
    description: "답변 - 숫자"
    type: string
    sql: ${TABLE}.answer_text ;;
  }
  dimension: nexonsn {
    description: "유저 ID"
    type: number
    sql: ${TABLE}.nexonsn ;;
  }
  dimension: group_title {
    description: "유저그룹"
    type: string
    sql: ${TABLE}.group_title ;;
  }
  dimension: is_main_account {
    description: "본계정여부"
    type: string
    sql: ${TABLE}.is_main_account ;;
  }
  dimension: new_or_return_user {
    description: "신규/복귀"
    type: string
    sql: ${TABLE}.new_or_return_user ;;
  }


  dimension_group: sdate {
    description: "설문일"
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.sdate ;;
  }
  dimension_group: sdatetime {
    description: "설문일시"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.sdatetime ;;
  }

  ##### MEASURES #####
  measure: count {
    description: "Count"
    type: count
    drill_fields: [question_title ,question_group]
    link: {
      label: "group by question_title"
      url: "{{link}}&pivots=count"
    }
    link: {
      label: "group by question_group"
      url: "{{link}}&pivots=count"
    }
  }
  measure: average_likert_drill_by_survey {
    description: "평균점수"
    type: average
    value_format_name: decimal_2
    sql: ${answer_num} ;;
    drill_fields: [question_title, question_group]
    link: {
      label: "Drill by question_title"
      url: "{{ link | replace: \"user_segment.nexonsn,\", \"\" | replace: \"user_segment.new_or_return_user,\", \"\" }}&limit=20&sorts=survey.group_title+asc"
    }
    link: {
      label: "Drill by question_group"
      url: "{{ link | replace: \"user_segment.nexonsn,\", \"\" | replace: \"user_segment.group_title,\", \"\" }}&limit=20&sorts=survey.group_title+asc"
    }
  }
}
