view: lgcns_golla_nxuser2 {
  sql_table_name: `NXPOC_L2.LGCNS_GOLLA_NXUSER2` ;;

  dimension_group: creation {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.creation_date ;;
  }
  dimension: is_main_account {
    type: string
    sql: ${TABLE}.is_main_account ;;
  }
  dimension_group: last_update {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.last_update_date ;;
  }
  dimension: new_or_return_user {
    type: string
    sql: ${TABLE}.new_or_return_user ;;
  }
  dimension: nexonsn {
    type: number
    sql: ${TABLE}.nexonsn ;;
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
  dimension: suvey_group {
    type: number
    sql: ${TABLE}.suvey_group ;;
  }
  dimension: user_segmentation {
    type: string
    sql: ${TABLE}.user_segmentation ;;
  }
  measure: count {
    type: count
  }
}
