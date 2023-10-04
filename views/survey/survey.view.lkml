view: survey {

  sql_table_name: `NXPOC_L2.LGCNS_NXPOC_SURVEY` ;;

  dimension: qid {
    description: "질문 ID"
    type: string
    sql: ${TABLE}.qid ;;
    link: {
      label: "2-2. Response Analysis"
      url: "/dashboards/39?pid={{ value }}"
    }
  }

  dimension: sid {
    description: "설문 ID"
    type: number
    value_format_name: id
    sql: ${TABLE}.sid ;;
    link: {
      label: "2-1. Survey Analysis"
      url: "/dashboards/33?설문ID={{ value }}"
    }
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
  dimension: category {
    description: "카테고리"
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: survey1_name {
    description: "대분류"
    type: string
    sql: ${TABLE}.survey1_name ;;
  }

  ##### MEASURES #####
  measure: count {
    description: "Count"
    type: count
  }


  measure: average_likert_drill_by_survey {
    description: "평균점수"
    type: average
    value_format_name: decimal_2
    sql: ${survey.answer_num} ;;
    drill_fields: [user_segment.nexonsn, user_segment.group_title, user_segment.new_or_return_user, average_likert_drill_by_survey]
    link: {
      label: "Drill by User Segment"
      url: "{{ link | replace: \"user_segment.nexonsn,\", \"\" | replace: \"user_segment.new_or_return_user,\", \"\" }}&limit=20&sorts=survey.group_title+asc"
    }
    link: {
      label: "Drill by New/Return"
      url: "{{ link | replace: \"user_segment.nexonsn,\", \"\" | replace: \"user_segment.group_title,\", \"\" }}&limit=20&sorts=survey.group_title+asc"
    }
    link: {
      label: "Drill by User Segment & New/Return"
      url: "{{ link | replace: \"user_segment.nexonsn,\", \"\" }}&limit=20&pivots=user_segment.new_or_return_user&sorts=survey.group_title+asc"
    }
  }
  measure: number_of_unique_survey_by_drill_survey {
    description: "유니크 설문 수"
    type: count_distinct
    sql: ${sid} ;;
    drill_fields: [survey.sid, category, survey1_name, number_of_unique_survey_by_drill_survey]
    link: {
      label: "Drill by Survey"
      url: "{{ link | replace: \"survey.sid,\", \"\" | replace: \"survey.category,\", \"\" }}"
    }
    link: {
      label: "Drill by Category"
      url: "{{ link | replace: \"survey.sid,\", \"\" | replace: \"survey.survey1_name,\", \"\" }}"
    }
  }
  measure: number_of_unique_question_by_drill_survey {
    description: "유니크 질문 수"
    type: count_distinct
    sql: ${survey.qid} ;;
    drill_fields: [survey.qid, survey.question_title, survey.question_type, number_of_unique_question_by_drill_survey]
    link: {
      label: "Drill by question_type"
      url: "{{ link | replace: \"survey.qid,\", \"\" | replace: \"survey.question_title,\", \"\" }}"
    }
  }
}
