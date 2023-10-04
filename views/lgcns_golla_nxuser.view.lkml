view: lgcns_golla_nxuser {
  sql_table_name: `NXPOC_L2.LGCNS_GOLLA_NXUSER` ;;

  dimension_group: crdt_acc {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.crdt_acc ;;
  }
  dimension_group: createdate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.createdate ;;
  }
  dimension: group_title {
    type: string
    sql: ${TABLE}.group_title ;;
  }
  dimension: main_character_f {
    type: number
    sql: ${TABLE}.MainCharacter_F ;;
  }
  dimension: nexonsn {
    type: number
    sql: ${TABLE}.nexonsn ;;
  }
  measure: count {
    type: count
  }
}
