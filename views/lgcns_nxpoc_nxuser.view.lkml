view: lgcns_nxpoc_nxuser {
  sql_table_name: `NXPOC_L2.LGCNS_NXPOC_NXUSER` ;;

  dimension: nexonsn {
    type: number
    sql: ${TABLE}.nexonsn ;;
  }
  dimension: gender {
    type: number
    sql: ${TABLE}.gender ;;
  }
  dimension: play_type {
    type: number
    sql: ${TABLE}.play_type ;;
  }
  dimension: age_range {
    type: number
    sql: ${TABLE}.age_range ;;
  }
  measure: count {
    type: count
  }
}
