view: survey_form {
  sql_table_name: `NXPOC_L2.LGCNS_NXPOC_SURVEYFORM` ;;


  ## 설문관련
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


  dimension_group: sdate_min {
    description: "최초 설문 답변일"
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.sdate_min ;;
  }

  dimension_group: sdate_max {
    description: "마지막 설문 답변일"
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.sdate_max ;;
  }

  dimension: category {
    description: "카테고리"
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: survey1_id {
    description: "대분류 ID"
    type: string
    sql: ${TABLE}.survey1_id ;;
  }
  dimension: survey1_name {
    description: "대분류"
    type: string
    sql: ${TABLE}.survey1_name ;;
  }
  dimension: survey2_id {
    description: "중분류 ID"
    type: string
    sql: ${TABLE}.survey2_id ;;
  }
  dimension: survey2_name {
    description: "중분류"
    type: string
    sql: ${TABLE}.survey2_name ;;
  }
  dimension: survey3_id {
    description: "소분류 ID"
    type: string
    sql: ${TABLE}.survey3_id ;;
  }
  dimension: survey3_name {
    description: "소분류"
    type: string
    sql: ${TABLE}.survey3_name ;;
  }

  dimension: survey_type {
    description: "설문 종류"
    type: string
    sql: ${TABLE}.survey_type ;;
  }

  dimension: is_regular {
    description: "정기/비정기"
    type: string
    sql: ${TABLE}.is_regular ;;
  }


  ## 질문관련
  dimension: qid {
    description: "질문 ID"
    type: string
    sql: ${TABLE}.question_id ;;
    link: {
      label: "2-2. Response Analysis"
      url: "/dashboards/39?pid={{ value }}"
    }
  }

  dimension: question_group {
    description: "질문 그룹 (수작업 업데이트)"
    type: string
    sql: ${TABLE}.question_group ;;
  }
  dimension: question_group_raw {
    description: "질문 그룹 참조정보"
    type: string
    sql: ${TABLE}.question_group_raw ;;
  }
  dimension: question_id {
    description: "질문 ID"
    type: string
    sql: ${TABLE}.question_id ;;
  }
  dimension: question_seq {
    description: "질문 순서"
    type: number
    sql: ${TABLE}.question_seq ;;
  }
  dimension: question_seq_new {
    description: "질문 순서 (New)"
    type: string
    sql: CONCAT(${TABLE}.question_group, '_', LPAD(CAST(${TABLE}.question_seq AS STRING), 3, '0'), '_', ${TABLE}.question_id) ;;
  }
  dimension: question_title {
    description: "질문"
    type: string
    sql: ${TABLE}.question_title ;;
  }
  dimension: question_type {
    description: "질문의 답변 형식"
    type: string
    sql: ${TABLE}.question_type ;;
  }

  ## Measure
  measure: count {
    description: "Count"
    type: count
    drill_fields: [survey3_name, survey2_name, survey1_name]
  }

  measure: number_of_unique_survey_by_drill_survey_form {
    description: "유니크 설문 수"
    type: count_distinct
    sql: ${sid} ;;
    drill_fields: [survey_form.sid, category, survey1_name, number_of_unique_survey_by_drill_survey_form]
    link: {
      label: "Drill by Survey"
      url: "{{ link | replace: \"survey_form.sid,\", \"\" | replace: \"survey_form.category,\", \"\" }}"
    }
    link: {
      label: "Drill by Category"
      url: "{{ link | replace: \"survey_form.sid,\", \"\" | replace: \"survey_form.survey1_name,\", \"\" }}"
    }
  }

  measure: number_of_unique_question_by_drill_survey_form {
    description: "유니크 질문 수"
    type: count_distinct
    sql: ${survey_form.qid} ;;
    drill_fields: [survey_form.qid, survey_form.question_title, survey_form.question_type, number_of_unique_question_by_drill_survey_form]
    link: {
      label: "Drill by question_type"
      url: "{{ link | replace: \"survey_form.qid,\", \"\" | replace: \"survey_form.question_title,\", \"\" }}"
    }
  }

}
