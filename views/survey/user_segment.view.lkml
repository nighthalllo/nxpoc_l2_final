view: user_segment {
  sql_table_name: `NXPOC_L2.LGCNS_NXPOC_NXUSER_SEGMENT` ;;

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.promotion_id, ${TABLE}.sku) ;;
  }
  dimension: sid {
    description: "설문 ID"
    type: number
    value_format_name: id
    sql: ${TABLE}.sid ;;
    link: {
      label: "1-1. Survey Overview"
      url: "/dashboards/33?설문ID={{ value }}"
    }
    link: {
      label: "1-2. Question Breakdown"
      url: "/dashboards/36?설문타입=NXFirst_survey={{ value }}"
    }
  }
  dimension: nexonsn {
    description: "유저 ID"
    type: number
    sql: ${TABLE}.nexonsn ;;
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

  measure: count {
    description: "Count"
    type: count
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
