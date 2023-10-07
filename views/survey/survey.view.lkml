view: survey {

  sql_table_name: `NXPOC_L2.LGCNS_NXPOC_SURVEY` ;;

  dimension: qid {
    description: "질문 ID"
    type: string
    sql: ${TABLE}.qid ;;
    #link: {
    #  label: "2-2. Response Analysis"
    #  url: "/dashboards/48?질문Id={{ value }}"
    #}
  }

  dimension: sid {
    description: "설문 ID"
    type: number
    value_format_name: id
    sql: ${TABLE}.sid ;;
    #link: {
    #  label: "2-1. Survey Analysis"
    #  url: "/dashboards/46?설문ID={{ value }}"
    #}
  }

  dimension: category {
    description: "카테고리"
    type: string
    sql: ${TABLE}.category ;;
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
    link: {
      label: "2-3. User Analysis"
      url: "/dashboards/49?Nexonsn={{ value }}"
    }
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

  dimension: survey1_id {
    description: "대분류"
    type: string
    sql: ${TABLE}.survey1_id ;;
  }

  dimension: survey1_name {
    description: "대분류"
    type: string
    sql: ${TABLE}.survey1_name ;;
  }

  dimension: survey2_id {
    description: "중분류"
    type: string
    sql: ${TABLE}.survey2_id ;;
  }

  dimension: survey2_name {
    description: "대분류"
    type: string
    sql: ${TABLE}.survey2_name ;;
  }

  dimension: survey3_id {
    description: "소분류"
    type: string
    sql: ${TABLE}.survey3_id ;;
  }

  dimension: survey3_name {
    description: "소분류"
    type: string
    sql: ${TABLE}.survey3_name ;;
    link: {
      label: "2-1. Survey Analysis"
      url: "/dashboards/46?설문명={{ value }}"
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
    link: {
      label: "2-2. Response Analysis"
      url: "https://nexonux.cloud.looker.com/dashboards/48?질문명={{ value }}&설문명={{ survey.survey3_name }}"
    }
  }
  dimension: question_type {
    description: "질문의 답변 형식"
    type: string
    sql: ${TABLE}.question_type ;;
  }


  dimension: group_title {
    description: "세그먼트"
    type: string
    sql: ${TABLE}.group_title ;;
  }
  dimension: is_main_account {
    description: "메인케릭터"
    type: string
    sql: ${TABLE}.is_main_account ;;
  }
  dimension: new_or_return_user {
    description: "신규/복귀"
    type: string
    sql: ${TABLE}.new_or_return_user ;;
  }

  dimension: is_response_unreliable {
    description: "불성실 여부"
    type: yesno
    sql: ${TABLE}.is_response_unreliable ;;
  }

  dimension: is_none_info_group_title {
    description: "불성실 판별정보 - 세그먼트"
    type: yesno
    sql: ${TABLE}.is_none_info_group_title ;;
  }
  dimension: is_none_info_main_account {
    description: "불성실 판별정보 - 메인케릭터"
    type: yesno
    sql: ${TABLE}.is_none_info_main_account ;;
  }


  dimension: same_response_ratio {
    description: "불성실 판별정보 - 동일 답변 비율"
    type: number
    sql: ${TABLE}.same_response_ratio ;;
  }
  dimension: is_same_response {
    description: "불성실 판별정보 - 동일 답변 98%"
    type: yesno
    sql: ${TABLE}.is_same_response ;;
  }

  dimension: is_none_access {
    description: "불성실 판별정보 - 접속여부"
    type: yesno
    sql: ${TABLE}.is_none_access ;;
  }
  dimension: is_none_korean_open_ended {
    description: "불성실 판별정보 - 한글답변 미존재"
    type: yesno
    sql: ${TABLE}.is_none_korean_open_ended ;;
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

  measure: sdate_max_date {
    type: max
    sql: ${sdate_date} ;;
  }

  measure: sdate_min_date {
    type: min
    sql: ${sdate_date} ;;
  }

  measure: answer_select_max {
    type: string
    sql: MAX(${answer_select}) ;;
  }

  measure: number_of_unique_user_drill_by_user{
    description: "유니크 유저 수"
    type: count_distinct
    sql: ${nexonsn} ;;
    drill_fields: [user_segment.nexonsn, user_segment.group_title, user_segment.new_or_return_user, number_of_unique_user_drill_by_user]
    link: {
      label: "Drill by User Segment"
      url: "{{ link | replace: \"user_segment.nexonsn,\", \"\" | replace: \"user_segment.new_or_return_user,\", \"\" }}&sorts=user_segment.group_title+asc"
    }
    link: {
      label: "Drill by New/Return"
      url: "{{ link | replace: \"user_segment.nexonsn,\", \"\" | replace: \"user_segment.group_title,\", \"\" }}&sorts=user_segment.group_title+asc"
    }
    link: {
      label: "Drill by User Segment & New/Return"
      url: "{{ link | replace: \"user_segment.nexonsn,\", \"\" }}&pivots=user_segment.new_or_return_user&toggle=dat,pik,vis&sorts=user_segment.group_title+asc"
    }
  }
}
