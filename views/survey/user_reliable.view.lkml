view: user_reliable {
  derived_table: {
    sql: SELECT survey.nexonsn,
            max(CASE WHEN user_segment.is_none_access  THEN survey.nexonsn ELSE null END) AS user_segment_is_none_access,
            max(CASE WHEN user_segment.is_none_info_group_title  THEN survey.nexonsn ELSE null END) AS user_segment_is_none_info_group_title,
            max(CASE WHEN user_segment.is_none_info_main_account  THEN survey.nexonsn ELSE null END) AS user_segment_is_none_info_main_account,
            max(CASE WHEN user_segment.is_same_response  THEN survey.nexonsn ELSE null END) AS user_segment_is_same_response,
            max(CASE WHEN user_segment.is_response_unreliable  THEN survey.nexonsn ELSE null END) AS user_segment_is_response_unreliable,
            max(CASE WHEN user_segment.is_response_unreliable  THEN null ELSE survey.nexonsn END) AS user_segment_is_response_reliable
    FROM `NXPOC_L2.LGCNS_NXPOC_SURVEY`  AS survey
    LEFT JOIN `NXPOC_L2.LGCNS_NXPOC_USER_SEGMENT`  AS user_segment ON survey.nexonsn = user_segment.nexonsn and survey.sid = user_segment.sid
    group by 1;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: nexonsn {
    type: number
    sql: ${TABLE}.nexonsn ;;
  }

  measure: user_segment_is_none_access {
    type: count_distinct
    sql: ${TABLE}.user_segment_is_none_access ;;
  }

  measure: user_segment_is_none_info_group_title {
    type: count_distinct
    sql: ${TABLE}.user_segment_is_none_info_group_title ;;
  }

  measure: user_segment_is_none_info_main_account {
    type: count_distinct
    sql: ${TABLE}.user_segment_is_none_info_main_account ;;
  }

  measure: user_segment_is_same_response {
    type: count_distinct
    sql: ${TABLE}.user_segment_is_same_response ;;
  }

  measure: user_segment_is_response_unreliable {
    type: count_distinct
    sql: ${TABLE}.user_segment_is_response_unreliable ;;
  }

  measure: user_segment_is_response_reliable {
    type: count_distinct
    sql: ${TABLE}.user_segment_is_response_reliable ;;
  }

  set: detail {
    fields: [
      nexonsn,
      user_segment_is_none_access,
      user_segment_is_none_info_group_title,
      user_segment_is_none_info_main_account,
      user_segment_is_same_response,
      user_segment_is_response_unreliable,
      user_segment_is_response_reliable
    ]
  }
}
