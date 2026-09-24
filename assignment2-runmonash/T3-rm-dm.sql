--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-rm-dm.sql

-- student: 34423680
-- student name: Ian Leong Zheng Yan

/* 
Comments for your marker:
(a) Created sequences starting at 100 to separate operational data from test data (1-99).

(b) Add Keith and Jackson, create entries with dynamic numbering, form Super Runners team
Using MAX(entry_no)+1 for automatic entry numbering within each event
Keith becomes team captain through composite FK reference

(c) Jackson downgrades from 10km to 5km and switches charity preference
Chose UPDATE approach to preserve original entry while changing event and charity

(d) Handle Keith's withdrawal and team disbandment
Step-by-step deletion to prevent FK violations: team assignments to team to individual entries
*/
-- (a)
DROP SEQUENCE competitor_seq;
DROP SEQUENCE team_seq;

CREATE SEQUENCE competitor_seq
  START WITH 100
  INCREMENT BY 5;

CREATE SEQUENCE team_seq
  START WITH 100
  INCREMENT BY 5;

--(b)
-- Insert Keith Rose
INSERT INTO competitor (comp_no, comp_fname, comp_lname, comp_gender, comp_dob, comp_email, comp_unistatus, comp_phone)
VALUES (
    competitor_seq.NEXTVAL,
    'Keith',
    'Rose',
    'M',
    TO_DATE('1995-03-15', 'YYYY-MM-DD'),
    'keith.rose@student.monash.edu',
    'Y',
    '0422141112'
);

-- Insert Jackson Bull
INSERT INTO competitor (comp_no, comp_fname, comp_lname, comp_gender, comp_dob, comp_email, comp_unistatus, comp_phone)
VALUES (
    competitor_seq.NEXTVAL,
    'Jackson',
    'Bull',
    'M',
    TO_DATE('1996-08-22', 'YYYY-MM-DD'),
    'jackson.bull@student.monash.edu',
    'Y',
    '0422412524'
);

-- Create entries for both competitors in RM WINTER SERIES CAULFIELD 2025, 10 km run
-- First, get Keith's entry
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
SELECT 
    e.event_id,
    (SELECT NVL(MAX(entry_no), 0) + 1 FROM entry WHERE event_id = e.event_id),
    NULL,
    NULL,
    NULL,
    c.comp_no,
    NULL,
    ch.char_id
FROM event e
JOIN carnival ca ON e.carn_date = ca.carn_date
JOIN competitor c ON UPPER(c.comp_fname) = UPPER('Keith') AND UPPER(c.comp_lname) = UPPER('Rose')
JOIN charity ch ON UPPER(ch.char_name) = UPPER('Salvation Army')
WHERE UPPER(ca.carn_name) = UPPER('RM Winter Series Caulfield 2025')
    AND UPPER (e.eventtype_code) = UPPER('10K');

-- Get Jackson's entry
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
SELECT 
    e.event_id,
    (SELECT NVL(MAX(entry_no), 0) + 1 FROM entry WHERE event_id = e.event_id),
    NULL,
    NULL,
    NULL,
    c.comp_no,
    NULL,
    ch.char_id
FROM event e
JOIN carnival ca ON e.carn_date = ca.carn_date
JOIN competitor c ON UPPER(c.comp_fname) = UPPER('Jackson') AND UPPER(c.comp_lname) = UPPER('Bull')
JOIN charity ch ON UPPER(ch.char_name) = UPPER('RSPCA')
WHERE UPPER(ca.carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
    AND UPPER(e.eventtype_code) = UPPER('10K');

-- Create Super Runners team with Keith as leader
INSERT INTO team (team_id, team_name, carn_date, event_id, entry_no)
SELECT 
    team_seq.NEXTVAL,
    'Super Runners',
    ca.carn_date,
    e.event_id,
    en.entry_no
FROM event e
JOIN carnival ca ON e.carn_date = ca.carn_date
JOIN entry en ON en.event_id = e.event_id
JOIN competitor c ON en.comp_no = c.comp_no
WHERE UPPER(ca.carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
    AND UPPER(e.eventtype_code) = UPPER('10K')
    AND UPPER(c.comp_fname) = UPPER('Keith') 
    AND UPPER(c.comp_lname) = UPPER('Rose');

-- Assign both Keith and Jackson to the Super Runners team
UPDATE entry
SET team_id = (
    SELECT t.team_id 
    FROM team t
    JOIN carnival ca ON t.carn_date = ca.carn_date
    WHERE UPPER(t.team_name) = UPPER('Super Runners')
        AND UPPER(ca.carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
)
WHERE comp_no IN (
    SELECT comp_no 
    FROM competitor 
    WHERE (UPPER(comp_fname) = UPPER('Keith') AND UPPER(comp_lname) = UPPER('Rose'))
        OR (UPPER(comp_fname) = UPPER('Jackson') AND UPPER(comp_lname) = UPPER('Bull'))
)
AND event_id IN (
    SELECT e.event_id 
    FROM event e
    JOIN carnival ca ON e.carn_date = ca.carn_date
    WHERE UPPER(ca.carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
        AND UPPER(e.eventtype_code) = UPPER('10K')
);

--(c)
-- Jackson downgrades from 10km to 5km and changes charity from RSPCA to Beyond Blue

-- Update Jackson's existing entry to change event and charity
UPDATE entry 
SET event_id = (
    SELECT e.event_id 
    FROM event e
    JOIN carnival ca ON e.carn_date = ca.carn_date
    WHERE UPPER(ca.carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
        AND UPPER(e.eventtype_code) = UPPER('5K')
),
char_id = (
    SELECT char_id 
    FROM charity 
    WHERE UPPER(char_name) = UPPER('BEYOND BLUE')
)
WHERE comp_no = (
    SELECT comp_no 
    FROM competitor 
    WHERE UPPER(comp_fname) = UPPER('Jackson') AND UPPER(comp_lname) = UPPER('Bull')
)
AND event_id IN (
    SELECT e.event_id 
    FROM event e
    JOIN carnival ca ON e.carn_date = ca.carn_date
    WHERE UPPER(ca.carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
        AND UPPER(e.eventtype_code) = UPPER('10K')
);

--(d)
-- Keith withdraws from the marathon, disband Super Runners team, Jackson continues individually
-- STEP 1: Remove ALL team members from Super Runners team
UPDATE entry
SET team_id = NULL
WHERE team_id = (
    SELECT t.team_id 
    FROM team t
    JOIN carnival ca ON t.carn_date = ca.carn_date
    WHERE UPPER(t.team_name) = UPPER('Super Runners')
        AND UPPER(ca.carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
);

-- STEP 2: Delete Super Runners team
DELETE FROM team 
WHERE UPPER(team_name) = UPPER('Super Runners')
AND carn_date = (
    SELECT carn_date 
    FROM carnival 
    WHERE UPPER(carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
);

-- STEP 3: Delete Keith's entry
DELETE FROM entry 
WHERE comp_no = (
    SELECT comp_no 
    FROM competitor 
    WHERE UPPER(comp_fname) = UPPER('Keith') AND UPPER(comp_lname) = UPPER('Rose')
)
AND event_id IN (
    SELECT e.event_id 
    FROM event e
    JOIN carnival ca ON e.carn_date = ca.carn_date
    WHERE UPPER(ca.carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
);

COMMIT;