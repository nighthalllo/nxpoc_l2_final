view: user_info {
  sql_table_name: `NXPOC_L2.LGCNS_NXPOC_NXUSER` ;;

  dimension: nexonsn {
    type: number
    sql: ${TABLE}.nexonsn ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: play_type {
    type: string
    sql: ${TABLE}.play_type ;;
  }
  dimension: age_range {
    type: string
    sql: ${TABLE}.age_range ;;
  }
  measure: count {
    type: count
  }
}
