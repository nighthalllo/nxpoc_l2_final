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
  }
}
