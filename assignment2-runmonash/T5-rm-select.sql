/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T5-rm-select.sql

-- student: 34423680
-- student name: Ian Leong Zheng Yan


/* Comments for your marker:
(a) Used nested subqueries with ROWNUM to find most successful team name, then correlated 
subquery for member counting. Composite JOIN identifies team captain via FK reference.

(b) Complex MIN subqueries find fastest time per event type with tie-breaking by lowest 
competitor number. Used MONTHS_BETWEEN for age calculation and LPAD for formatting.

(c) CROSS JOIN ensures all carnival/event combinations shown. Inline view pre-calculates 
carnival totals for percentage calculations. CASE handles zero-entry scenarios.
*/


/* (a) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT t.team_name AS "TEAM_NAME",
       to_char(
           ev.carn_date,
           'DD-MON-YYYY'
       ) AS "CARNIVAL_DATE",
       comp.comp_fname
       || ' '
       || comp.comp_lname AS "TEAMLEADER",
       (
           SELECT COUNT(*)
             FROM entry e2
            WHERE e2.team_id = t.team_id
       ) AS "TEAM_NO_MEMBERS"
  FROM team t
  JOIN event ev
ON t.event_id = ev.event_id
  JOIN entry e
ON t.event_id = e.event_id
   AND t.entry_no = e.entry_no
  JOIN competitor comp
ON e.comp_no = comp.comp_no
 WHERE ev.carn_date < TO_DATE('01-JUN-2025','DD-MON-YYYY')
   AND t.team_name = (
    SELECT team_name
      FROM (
        SELECT t2.team_name,
               COUNT(*) AS team_count
          FROM team t2
          JOIN event ev2
        ON t2.event_id = ev2.event_id
         WHERE ev2.carn_date < TO_DATE('01-JUN-2025','DD-MON-YYYY')
         GROUP BY t2.team_name
         ORDER BY COUNT(*) DESC,
                  t2.team_name
    )
     WHERE ROWNUM = 1
)
 ORDER BY t.team_name,
          ev.carn_date;

/* (b) */
SELECT et.eventtype_desc AS "Event",
       c.carn_name
       || ' held '
       || to_char(
           c.carn_date,
           'Dy DD-MON-YYYY'
       ) AS "Carnival",
       to_char(
           e.entry_elapsedtime,
           'HH24:MI:SS'
       ) AS "Current Record",
       lpad(
           to_char(comp.comp_no),
           5,
           '0'
       )
       || ' '
       || TRIM(comp.comp_fname)
       || ' '
       || TRIM(comp.comp_lname) AS "Competitor No and Name",
       round(
           months_between(
               c.carn_date,
               comp.comp_dob
           ) / 12,
           0
       ) AS "Age at Carnival"
  FROM entry e
  JOIN event ev
ON e.event_id = ev.event_id
  JOIN carnival c
ON ev.carn_date = c.carn_date
  JOIN eventtype et
ON ev.eventtype_code = et.eventtype_code
  JOIN competitor comp
ON e.comp_no = comp.comp_no
 WHERE e.entry_elapsedtime IS NOT NULL
   AND e.entry_elapsedtime = (
    SELECT MIN(e2.entry_elapsedtime)
      FROM entry e2
      JOIN event ev2
    ON e2.event_id = ev2.event_id
     WHERE ev2.eventtype_code = ev.eventtype_code
       AND e2.entry_elapsedtime IS NOT NULL
)
   AND comp.comp_no = (
    SELECT MIN(comp2.comp_no)
      FROM entry e3
      JOIN event ev3
    ON e3.event_id = ev3.event_id
      JOIN competitor comp2
    ON e3.comp_no = comp2.comp_no
     WHERE ev3.eventtype_code = ev.eventtype_code
       AND e3.entry_elapsedtime = (
        SELECT MIN(e4.entry_elapsedtime)
          FROM entry e4
          JOIN event ev4
        ON e4.event_id = ev4.event_id
         WHERE ev4.eventtype_code = ev.eventtype_code
           AND e4.entry_elapsedtime IS NOT NULL
    )
)
 ORDER BY et.eventtype_desc,
          comp.comp_no;


/* (c) */
SELECT c.carn_name AS "Carnival Name",
       to_char(
           c.carn_date,
           'DD-MON-YYYY'
       ) AS "Carnival Date",
       et.eventtype_desc AS "Event",
       CASE
           WHEN COUNT(e.entry_no) = 0 THEN
               'Not offered'
           ELSE
               to_char(count(e.entry_no))
       END AS "No of Entries",
       CASE
           WHEN COUNT(e.entry_no) = 0 THEN
               ''
           ELSE
               to_char(round(
                   count(e.entry_no) * 100.0 / carnival_totals.total_entries,
                   0
               ))
       END AS "% of Carnival Entries"
  FROM carnival c
 CROSS JOIN eventtype et
  LEFT JOIN event ev
ON c.carn_date = ev.carn_date
   AND et.eventtype_code = ev.eventtype_code
  LEFT JOIN entry e
ON ev.event_id = e.event_id
  JOIN (
    SELECT c2.carn_date,
           COUNT(e2.entry_no) AS total_entries
      FROM carnival c2
      LEFT JOIN event ev2
    ON c2.carn_date = ev2.carn_date
      LEFT JOIN entry e2
    ON ev2.event_id = e2.event_id
     GROUP BY c2.carn_date
) carnival_totals
ON c.carn_date = carnival_totals.carn_date
 WHERE carnival_totals.total_entries > 0
 GROUP BY c.carn_name,
          c.carn_date,
          et.eventtype_desc,
          carnival_totals.total_entries
 ORDER BY c.carn_date,
          COUNT(e.entry_no) DESC,
          et.eventtype_desc;