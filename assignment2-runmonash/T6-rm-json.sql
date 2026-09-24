/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T6-rm-json.sql

-- student: 34423680
-- student name: Ian Leong Zheng Yan


/* Comments for your marker:
This query generates JSON documents for MongoDB by joining team, competitor
and event data. Uses JSON_OBJECT and JSON_ARRAYAGG to create proper structure
with team leader info and team members array.
*/


-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    JSON_OBJECT(
        '_id' VALUE t.team_id,
                'carn_name' VALUE c.carn_name,
                'carn_date' VALUE to_char(
            c.carn_date,
            'DD-MON-YYYY'
        ),
                'team_name' VALUE t.team_name,
                'team_leader' VALUE
            JSON_OBJECT(
                'name' VALUE TRIM(leader.comp_fname)
                             || ' '
                             || TRIM(leader.comp_lname),
                        'phone' VALUE nvl(
                    leader.comp_phone,
                    '-'
                ),
                        'email' VALUE nvl(
                    leader.comp_email,
                    '-'
                )
            ),
                'team_no_of_members' VALUE(
            SELECT COUNT(*)
              FROM entry e2
             WHERE e2.team_id = t.team_id
        ),
                'team_members' VALUE JSON_ARRAYAGG(
            JSON_OBJECT(
                'competitor_name' VALUE TRIM(comp.comp_fname)
                                        || ' '
                                        || TRIM(comp.comp_lname),
                        'competitor_phone' VALUE nvl(
                    comp.comp_phone,
                    '-'
                ),
                        'event_type' VALUE et.eventtype_desc,
                        'entry_no' VALUE e.entry_no,
                        'starttime' VALUE nvl(
                    to_char(
                        e.entry_starttime,
                        'HH24:MI:SS'
                    ),
                    '-'
                ),
                        'finishtime' VALUE nvl(
                    to_char(
                        e.entry_finishtime,
                        'HH24:MI:SS'
                    ),
                    '-'
                ),
                        'elapsedtime' VALUE nvl(
                    to_char(
                        e.entry_elapsedtime,
                        'HH24:MI:SS'
                    ),
                    '-'
                )
            )
        )
    FORMAT JSON)
AS team_json
  FROM team t
  JOIN event ev
ON t.event_id = ev.event_id
  JOIN carnival c
ON ev.carn_date = c.carn_date
  JOIN eventtype et
ON ev.eventtype_code = et.eventtype_code
  JOIN entry captain_entry
ON t.event_id = captain_entry.event_id
   AND t.entry_no = captain_entry.entry_no
  JOIN competitor leader
ON captain_entry.comp_no = leader.comp_no
  JOIN entry e
ON t.team_id = e.team_id
  JOIN competitor comp
ON e.comp_no = comp.comp_no
 GROUP BY t.team_id,
          c.carn_name,
          c.carn_date,
          t.team_name,
          leader.comp_fname,
          leader.comp_lname,
          leader.comp_phone,
          leader.comp_email
 ORDER BY t.team_id;