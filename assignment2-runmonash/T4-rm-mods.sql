--****PLEASE ENTER YOUR DETAILS BELOW****
--T4-rm-mods.sql

-- student: 34423680
-- student name: Ian Leong Zheng Yan

/* Comments for your marker:
(a) Added comp_completed_events column to track competitor performance metrics.
Used COUNT with finishtime IS NOT NULL to only count completed races.

(b) Redesigned charity relationships to support multiple charities per entry with percentages.
Created entry_charity table with composite FK to entry for per-race charity choices.
Migrated existing data and demonstrated Jackson Bull with split charity allocation.
Removed char_id from entry table to eliminate redundancy.
*/

--(a)
-- Add column to store number of completed events for each competitor
ALTER TABLE competitor ADD comp_completed_events NUMBER(3) DEFAULT 0 NOT NULL;

-- Add comment to the new column
COMMENT ON COLUMN competitor.comp_completed_events IS
    'Number of events completed by this competitor';

-- Update the column with current completed events count
UPDATE competitor
   SET
    comp_completed_events = (
        SELECT COUNT(*)
          FROM entry
         WHERE entry.comp_no = competitor.comp_no
           AND entry.entry_finishtime IS NOT NULL
    );

-- Display the updated competitor table structure
DESC competitor;

-- Show updated competitor data with completed events count
SELECT comp_no,
       comp_fname,
       comp_lname,
       comp_completed_events
  FROM competitor
 ORDER BY comp_no;


--(b)
-- First, drop the existing entry_charity table
DROP TABLE entry_charity;
-- Create new table to store competitor-charity relationships with percentages
-- Create new table to store entry-charity relationships with percentages
CREATE TABLE entry_charity (
    comp_no       NUMBER(5) NOT NULL,
    char_id       NUMBER(3) NOT NULL,
    event_id      NUMBER(6) NOT NULL,
    entry_no      NUMBER(5) NOT NULL,
    ec_percentage NUMBER(3) NOT NULL
);

-- Add constraints separately
ALTER TABLE entry_charity
    ADD CONSTRAINT pk_entry_charity
        PRIMARY KEY ( comp_no,
                      char_id,
                      event_id,
                      entry_no );

ALTER TABLE entry_charity
    ADD CONSTRAINT fk_ec_comp_no FOREIGN KEY ( comp_no )
        REFERENCES competitor ( comp_no );

ALTER TABLE entry_charity
    ADD CONSTRAINT fk_ec_char_id FOREIGN KEY ( char_id )
        REFERENCES charity ( char_id );

ALTER TABLE entry_charity
    ADD CONSTRAINT fk_ec_entry
        FOREIGN KEY ( event_id,
                      entry_no )
            REFERENCES entry ( event_id,
                               entry_no );

ALTER TABLE entry_charity
    ADD CONSTRAINT chk_ec_percentage
        CHECK ( ec_percentage >= 1
           AND ec_percentage <= 100 );

-- Add column comments
COMMENT ON COLUMN entry_charity.comp_no IS
    'Foreign key to COMPETITOR';
COMMENT ON COLUMN entry_charity.char_id IS
    'Foreign key to CHARITY';
COMMENT ON COLUMN entry_charity.event_id IS
    'Foreign key to EVENT (part of ENTRY composite key)';
COMMENT ON COLUMN entry_charity.entry_no IS
    'Foreign key to ENTRY_NO (part of ENTRY composite key)';
COMMENT ON COLUMN entry_charity.ec_percentage IS
    'Percentage of funds allocated to this charity (1-100)';

-- Migrate existing charity relationships from ENTRY table to ENTRY_CHARITY table
INSERT INTO entry_charity (
    comp_no,
    char_id,
    event_id,
    entry_no,
    ec_percentage
)
    SELECT e.comp_no,
           e.char_id,
           e.event_id,
           e.entry_no,
           100
      FROM entry e
      JOIN competitor c
    ON e.comp_no = c.comp_no
     WHERE e.char_id IS NOT NULL
       AND NOT ( upper(c.comp_fname) = upper('Jackson')
       AND upper(c.comp_lname) = upper('Bull') );

-- Add RSPCA charity for Jackson Bull with 70%
INSERT INTO entry_charity (
    comp_no,
    char_id,
    event_id,
    entry_no,
    ec_percentage
)
    SELECT e.comp_no,
           ch.char_id,
           e.event_id,
           e.entry_no,
           70
      FROM entry e
      JOIN competitor c
    ON e.comp_no = c.comp_no
      JOIN charity ch
    ON upper(ch.char_name) = upper('RSPCA')
     WHERE upper(c.comp_fname) = upper('Jackson')
       AND upper(c.comp_lname) = upper('Bull');

-- Add Beyond Blue charity for Jackson Bull with 30% (to complete the split)
INSERT INTO entry_charity (
    comp_no,
    char_id,
    event_id,
    entry_no,
    ec_percentage
)
    SELECT e.comp_no,
           ch.char_id,
           e.event_id,
           e.entry_no,
           30
      FROM entry e
      JOIN competitor c
    ON e.comp_no = c.comp_no
      JOIN charity ch
    ON upper(ch.char_name) = upper('Beyond Blue')
     WHERE upper(c.comp_fname) = upper('Jackson')
       AND upper(c.comp_lname) = upper('Bull');

-- Remove char_id column from ENTRY table
ALTER TABLE entry DROP CONSTRAINT fk_entry_char_id;
ALTER TABLE entry DROP COLUMN char_id;

-- Display the new table structure
DESC entry_charity;
DESC entry;

-- Show the entry-charity relationships
SELECT c.comp_fname
       || ' '
       || c.comp_lname AS competitor_name,
       ch.char_name,
       ec.ec_percentage,
       ec.entry_no,
       ec.event_id,
       ec.char_id,
       car.carn_name,
       et.eventtype_desc
  FROM entry_charity ec
  JOIN competitor c
ON ec.comp_no = c.comp_no
  JOIN charity ch
ON ec.char_id = ch.char_id
  JOIN entry e
ON ec.event_id = e.event_id
   AND ec.entry_no = e.entry_no
  JOIN event ev
ON e.event_id = ev.event_id
  JOIN carnival car
ON ev.carn_date = car.carn_date
  JOIN eventtype et
ON ev.eventtype_code = et.eventtype_code
 ORDER BY c.comp_fname,
          c.comp_lname,
          ec.ec_percentage DESC;

COMMIT;