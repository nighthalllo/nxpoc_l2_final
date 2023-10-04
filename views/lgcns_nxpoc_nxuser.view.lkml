view: lgcns_nxpoc_nxuser {
  sql_table_name: `NXPOC_L2.LGCNS_NXPOC_NXUSER` ;;

  dimension: nexonsn {
    type: number
    sql: ${TABLE}.nexonsn ;;
  }
  measure: count {
    type: count
  }
}
