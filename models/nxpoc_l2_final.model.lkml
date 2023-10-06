connection: "nxpoc_l2_final"

# include all the views
include: "/views/survey/*.view.lkml"
include: "/views/**/*.view.lkml"

explore: survey {
  label: "Survey"
  description: "Survey Data from BQ"

  join: survey_form {
    type: left_outer
    sql_on: ${survey.qid} = ${survey_form.qid} ;;
    relationship: many_to_one
  }
  join: user_segment {
    type: left_outer
    sql_on: ${survey.nexonsn} = ${user_segment.nexonsn} and ${survey.sid} = ${user_segment.sid};;
    relationship: many_to_one
  }

  join: user_reliable {
    type: left_outer
    sql_on: ${survey.nexonsn} = ${user_reliable.nexonsn};;
    relationship: many_to_one
  }
  join: user_nexon {
    type: left_outer
    sql_on: ${survey.nexonsn} = ${user_nexon.nexonsn};;
    relationship: many_to_one
  }
  join: user_info {
    type: left_outer
    sql_on: ${survey.nexonsn} = ${user_info.nexonsn};;
    relationship: many_to_one
  }

}
explore: lgcns_v2_survey {}
explore: lgcns_nxpoc_nxuser {}
