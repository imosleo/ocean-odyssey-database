/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T1-rm-schema.sql

-- student: 34423680
-- student name: Ian Leong Zheng Yan

/* Comments for your marker:
I’ve created the COMPETITOR, ENTRY and TEAM tables based on the ERD provided.
All column names, data types and constraints (including primary and foreign keys).  
I also included comments for each column to explain their purpose.  
Foreign keys are added at the end.  
*/

/* drop table statements - do not remove*/

DROP TABLE competitor CASCADE CONSTRAINTS PURGE;

DROP TABLE entry CASCADE CONSTRAINTS PURGE;

DROP TABLE team CASCADE CONSTRAINTS PURGE;

/* end of drop table statements*/

-- Task 1 Add Create table statements for the Missing TABLES below.
-- Ensure all column comments, and constraints (other than FK's)are included.
-- FK constraints are to be added at the end of this script

-- COMPETITOR
CREATE TABLE competitor (
    comp_no        NUMBER(5) NOT NULL,
    comp_fname     VARCHAR2(30) NOT NULL,
    comp_lname     VARCHAR2(30) NOT NULL,
    comp_gender    CHAR(1),
    comp_dob       DATE NOT NULL,
    comp_email     VARCHAR2(50) NOT NULL,
    comp_unistatus CHAR(1),
    comp_phone     CHAR(10) NOT NULL
);

-- Add PRIMARY KEY constraint
ALTER TABLE competitor ADD CONSTRAINT pk_competitor PRIMARY KEY ( comp_no );

-- Add UNIQUE constraints
ALTER TABLE competitor ADD CONSTRAINT uq_competitor_email UNIQUE ( comp_email );

ALTER TABLE competitor ADD CONSTRAINT uq_competitor_phone UNIQUE ( comp_phone );

-- Add CHECK constraints
ALTER TABLE competitor
    ADD CONSTRAINT chk_comp_gender
        CHECK ( comp_gender IN ( 'M',
                                 'F',
                                 'U' ) );

ALTER TABLE competitor
    ADD CONSTRAINT chk_comp_unistatus CHECK ( comp_unistatus IN ( 'Y',
                                                                  'N' ) );

COMMENT ON COLUMN competitor.comp_no IS
    'Unique identifier for a competitor';
COMMENT ON COLUMN competitor.comp_fname IS
    'Competitor''s first name';
COMMENT ON COLUMN competitor.comp_lname IS
    'Competitor''s last name';
COMMENT ON COLUMN competitor.comp_gender IS
    'Competitor''s gender (''M'' for male, ''F'' for female, or ''U'' for ''Undisclosed'')'
    ;
COMMENT ON COLUMN competitor.comp_dob IS
    'Competitor''s date of birth';
COMMENT ON COLUMN competitor.comp_email IS
    'Competitor''s email - unique for each competitor';
COMMENT ON COLUMN competitor.comp_unistatus IS
    'Competitor is a university student or staff (''Y'' for Yes or ''N'' for No)';
COMMENT ON COLUMN competitor.comp_phone IS
    'Competitor''s phone number - unique for each competitor';

-- ENTRY
CREATE TABLE entry (
    event_id          NUMBER(6) NOT NULL,
    entry_no          NUMBER(5),
    entry_starttime   DATE, -- Format: hh24:mi:ss
    entry_finishtime  DATE, -- Format: hh24:mi:ss
    entry_elapsedtime DATE, -- Format: hh24:mi:ss
    comp_no           NUMBER(5) NOT NULL,
    team_id           NUMBER(3),
    char_id           NUMBER(3)
);

-- Add PRIMARY KEY constraint
ALTER TABLE entry ADD CONSTRAINT pk_entry PRIMARY KEY ( event_id,
                                                        entry_no );

COMMENT ON COLUMN entry.event_id IS
    'Foreign key to EVENT';
COMMENT ON COLUMN entry.entry_no IS
    'Entry number (unique only within an event)';
COMMENT ON COLUMN entry.entry_starttime IS
    'The entrant''s start time (time only), stored using the format of hh24:mi:ss';
COMMENT ON COLUMN entry.entry_finishtime IS
    'The entrant''s finish time (time only), stored using the format of hh24:mi:ss';
COMMENT ON COLUMN entry.entry_elapsedtime IS
    'The time the entrant took to complete the event, in format hh24:mi:ss (e.g. 01:25:30)'
    ;
COMMENT ON COLUMN entry.comp_no IS
    'Foreign key to COMPETITOR';
COMMENT ON COLUMN entry.team_id IS
    'Optional foreign key to TEAM';
COMMENT ON COLUMN entry.char_id IS
    'Optional foreign key to CHARITY';

-- TEAM
CREATE TABLE team (
    team_id   NUMBER(3) NOT NULL,
    team_name VARCHAR2(30) NOT NULL,
    carn_date DATE NOT NULL,
    event_id  NUMBER(6) NOT NULL,
    entry_no  NUMBER(5) NOT NULL
);

-- Add PRIMARY KEY constraint
ALTER TABLE team ADD CONSTRAINT pk_team PRIMARY KEY ( team_id );

-- Add UNIQUE constraint
ALTER TABLE team ADD CONSTRAINT uq_team_name_date UNIQUE ( team_name,
                                                           carn_date );

COMMENT ON COLUMN team.team_id IS
    'Team identifier (unique)';
COMMENT ON COLUMN team.team_name IS
    'Team name';
COMMENT ON COLUMN team.carn_date IS
    'Date of the carnival this team belongs to';
COMMENT ON COLUMN team.event_id IS
    'Event the team is participating in';
COMMENT ON COLUMN team.entry_no IS
    'Entry number of the lead competitor';

-- Add all missing FK Constraints below here

-- Add foreign key constraints for COMPETITOR table
ALTER TABLE entry
    ADD CONSTRAINT fk_entry_comp_no FOREIGN KEY ( comp_no )
        REFERENCES competitor ( comp_no );

ALTER TABLE entry
    ADD CONSTRAINT fk_entry_event_id FOREIGN KEY ( event_id )
        REFERENCES event ( event_id );

ALTER TABLE entry
    ADD CONSTRAINT fk_entry_team_id FOREIGN KEY ( team_id )
        REFERENCES team ( team_id );

ALTER TABLE entry
    ADD CONSTRAINT fk_entry_char_id FOREIGN KEY ( char_id )
        REFERENCES charity ( char_id );

-- Add foreign key constraints for TEAM table
ALTER TABLE team
    ADD CONSTRAINT fk_team_carn_date FOREIGN KEY ( carn_date )
        REFERENCES carnival ( carn_date );

ALTER TABLE team
    ADD CONSTRAINT fk_team_event_id FOREIGN KEY ( event_id )
        REFERENCES event ( event_id );

ALTER TABLE team
    ADD CONSTRAINT fk_team_entry_ref
        FOREIGN KEY ( event_id,
                      entry_no )
            REFERENCES entry ( event_id,
                               entry_no );