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

#Drill Selector
  parameter: Drill_By {
    type: string
    default_value: "group_title"
    allowed_value:{label:"group_title" value:"group_title" }
    allowed_value:{label:"is_main_account" value:"is_main_account" }
    allowed_value:{label:"new_or_return_user" value:"new_or_return_user" }
  }

  ## dynamic dimension to drill by
  dimension: Drill_fielded {
    type: string
    label_from_parameter: Drill_By
    sql:
    {% case Drill_By._parameter_value %}
      {% when "'group_title'" %}
        ${group_title}
      {% when "'is_main_account'" %}
        ${is_main_account}
      {% when "'new_or_return_user'" %}
        ${new_or_return_user}
      {% else %}
        null
      {% endcase %}  ;;
  }

  measure: average_score {
    type: average
    sql: ${answer_num};;
    drill_fields: [Drill_fielded,average_score]
    }
  ##### MEASURES #####
  measure: average_question_group {
    type: average
    sql: ${answer_num} ;;
    drill_fields: [question_group, average_question_group]
    link: {
      label: "group by question_title"
    }
  }

  measure: count {
    description: "Count"
    type: count
    drill_fields: [question_group, average_question_group]
    link: {
      label: "group by question_title"
    }
  }



  measure: average_question_title {
    type: average
    value_format_name: decimal_2
    sql: ${answer_num} ;;
    drill_fields: [question_title,average_question_title]
    link: {
      label: "group by question_title"
    }
  }
}
