/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-rm-insert.sql

-- student: 34423680
-- student name: Ian Leong Zheng Yan

/* Comments for your marker:
I used ChatGPT to assist with creating the competitor  data for T2-rm-insert.sql. 

Specifically:

Character names and themes: Used ChatGPT to generate anime and gacha game character names for memorable test data (15 competitors)
Data variation: Used AI suggestions to create diverse competitor profiles with realistic email patterns and phone numbers
The SQL INSERT statements and database logic were written independently.

Created 15 diverse competitors with anime and gacha game character theme for memorable testing
Timings for the race idea - mass starts for 5K, wave starts for longer distances 
Added 44 entries across all events with some DNF scenarios for realism. 
Teams have cross-event participation where members 
compete in different races but share the same team identity.
*/

-- Task 2 Load the COMPETITOR, ENTRY and TEAM tables with your own
-- test data following the data requirements expressed in the brief

-- =======================================
-- COMPETITOR
-- =======================================
INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 1,
           'Artoria',
           'Pendragon',
           'F',
           TO_DATE('1999-04-10','YYYY-MM-DD'),
           'apen@student.monash.edu',
           'Y',
           '0104101999' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 2,
           'Ellen',
           'Joe',
           'F',
           TO_DATE('2002-01-04','YYYY-MM-DD'),
           'ejoe@student.monash.edu',
           'Y',
           '0101042002' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 3,
           'Hatsune',
           'Miku',
           'F',
           TO_DATE('2007-08-31','YYYY-MM-DD'),
           'hmiku@student.monash.edu',
           'Y',
           '0108312007' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 4,
           'Kazuto',
           'Kirigaya',
           'M',
           TO_DATE('2001-10-07','YYYY-MM-DD'),
           'kkiri@student.monash.edu',
           'Y',
           '0110072001' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 5,
           'Kasane',
           'Teto',
           'F',
           TO_DATE('2008-04-01','YYYY-MM-DD'),
           'kteto@student.monash.edu',
           'Y',
           '0104012008' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 6,
           'Itachi',
           'Uchiha',
           'M',
           TO_DATE('1987-06-09','YYYY-MM-DD'),
           'clan.killer@gmail.com',
           'N',
           '0106091987' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 7,
           'Hu',
           'Tao',
           'F',
           TO_DATE('1998-07-15','YYYY-MM-DD'),
           'peach.girl@gmail.com',
           'N',
           '0107151998' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 8,
           'Kaneki',
           'Ken',
           'M',
           TO_DATE('1988-12-20','YYYY-MM-DD'),
           'eye.patch@gmail.com',
           'N',
           '0112201988' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 9,
           'Yuuki',
           'Asuna',
           'F',
           TO_DATE('2006-09-30','YYYY-MM-DD'),
           'berserk.healer@gmail.com',
           'N',
           '0109302006' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 10,
           'Cid',
           'Kagenou',
           'M',
           TO_DATE('2009-01-10','YYYY-MM-DD'),
           'lord.shadow@gmail.com',
           'N',
           '0101102009' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 11,
           'Black',
           'Swan',
           'F',
           TO_DATE('1997-02-06','YYYY-MM-DD'),
           'bswan@student.monash.edu',
           'Y',
           '0102061997' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 12,
           'Anos',
           'Voldigoad',
           'M',
           TO_DATE('1944-04-04','YYYY-MM-DD'),
           'the.misfit@gmail.com',
           'N',
           '0104041944' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 13,
           'Akeno',
           'Himejima',
           'F',
           TO_DATE('1995-07-21','YYYY-MM-DD'),
           'ahime@student.monash.edu',
           'Y',
           '0107211995' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 14,
           'Gojo',
           'Satoru',
           'M',
           TO_DATE('1989-12-07','YYYY-MM-DD'),
           'honored.one@gmail.com',
           'N',
           '0112071989' );

INSERT INTO competitor (
    comp_no,
    comp_fname,
    comp_lname,
    comp_gender,
    comp_dob,
    comp_email,
    comp_unistatus,
    comp_phone
) VALUES ( 15,
           'Mash',
           'Kyrielight',
           'F',
           TO_DATE('2000-07-30','YYYY-MM-DD'),
           'mkyrie@student.monash.edu',
           'Y',
           '0107302000' );

-- =======================================
-- ENTRY
-- =======================================
-- event_id | entry_no | entry_starttime | entry_finishtime | entry_elapsedtime | comp_no | team_id | char_id           
-- Event 1 (5K Run - 22-SEP-2024) - Entry numbers 1, 2, 3, 4
INSERT INTO entry VALUES ( 1,
                           1,
                           TO_DATE('08:00:00','HH24:MI:SS'),
                           TO_DATE('08:28:05','HH24:MI:SS'),
                           TO_DATE('00:28:05','HH24:MI:SS'),
                           1,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 1,
                           2,
                           TO_DATE('08:00:30','HH24:MI:SS'),
                           TO_DATE('08:29:50','HH24:MI:SS'),
                           TO_DATE('00:29:20','HH24:MI:SS'),
                           2,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 1,
                           3,
                           TO_DATE('08:01:15','HH24:MI:SS'),
                           TO_DATE('08:32:45','HH24:MI:SS'),
                           TO_DATE('00:31:30','HH24:MI:SS'),
                           3,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 1,
                           4,
                           TO_DATE('08:01:45','HH24:MI:SS'),
                           TO_DATE('08:34:30','HH24:MI:SS'),
                           TO_DATE('00:32:45','HH24:MI:SS'),
                           4,
                           NULL,
                           NULL );

-- Event 2 (10K Run - 22-SEP-2024) - Entry numbers 5, 6, 7, 8
INSERT INTO entry VALUES ( 2,
                           5,
                           TO_DATE('09:00:00','HH24:MI:SS'),
                           TO_DATE('09:55:01','HH24:MI:SS'),
                           TO_DATE('00:55:01','HH24:MI:SS'),
                           5,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 2,
                           6,
                           TO_DATE('09:01:30','HH24:MI:SS'),
                           TO_DATE('10:04:00','HH24:MI:SS'),
                           TO_DATE('01:02:30','HH24:MI:SS'),
                           6,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 2,
                           7,
                           TO_DATE('09:02:45','HH24:MI:SS'),
                           TO_DATE('10:11:30','HH24:MI:SS'),
                           TO_DATE('01:08:45','HH24:MI:SS'),
                           7,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 2,
                           8,
                           NULL,
                           NULL,
                           NULL,
                           8,
                           NULL,
                           NULL );

-- Event 3 (5K Run - 05-OCT-2024) - Entry numbers 9, 10, 11, 12
INSERT INTO entry VALUES ( 3,
                           9,
                           TO_DATE('08:00:00','HH24:MI:SS'),
                           TO_DATE('08:29:15','HH24:MI:SS'),
                           TO_DATE('00:29:15','HH24:MI:SS'),
                           9,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 3,
                           10,
                           TO_DATE('08:00:45','HH24:MI:SS'),
                           TO_DATE('08:31:15','HH24:MI:SS'),
                           TO_DATE('00:30:30','HH24:MI:SS'),
                           10,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 3,
                           11,
                           NULL,
                           NULL,
                           NULL,
                           11,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 3,
                           12,
                           TO_DATE('08:01:30','HH24:MI:SS'),
                           TO_DATE('08:34:50','HH24:MI:SS'),
                           TO_DATE('00:33:20','HH24:MI:SS'),
                           12,
                           NULL,
                           NULL );

-- Event 4 (10K Run - 05-OCT-2024) - Entry numbers 13, 14, 15, 16
INSERT INTO entry VALUES ( 4,
                           13,
                           TO_DATE('09:00:00','HH24:MI:SS'),
                           TO_DATE('09:58:30','HH24:MI:SS'),
                           TO_DATE('00:58:30','HH24:MI:SS'),
                           13,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 4,
                           14,
                           TO_DATE('09:01:15','HH24:MI:SS'),
                           TO_DATE('10:05:30','HH24:MI:SS'),
                           TO_DATE('01:04:15','HH24:MI:SS'),
                           14,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 4,
                           15,
                           TO_DATE('09:02:30','HH24:MI:SS'),
                           TO_DATE('10:14:15','HH24:MI:SS'),
                           TO_DATE('01:11:45','HH24:MI:SS'),
                           15,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 4,
                           16,
                           TO_DATE('09:03:15','HH24:MI:SS'),
                           TO_DATE('10:21:35','HH24:MI:SS'),
                           TO_DATE('01:18:20','HH24:MI:SS'),
                           1,
                           NULL,
                           NULL );

-- Event 5 (21K Half Marathon - 05-OCT-2024) - Entry numbers 17, 18, 19, 20
INSERT INTO entry VALUES ( 5,
                           17,
                           TO_DATE('07:00:00','HH24:MI:SS'),
                           TO_DATE('09:43:10','HH24:MI:SS'),
                           TO_DATE('02:43:10','HH24:MI:SS'),
                           2,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 5,
                           18,
                           TO_DATE('07:02:00','HH24:MI:SS'),
                           TO_DATE('09:49:30','HH24:MI:SS'),
                           TO_DATE('02:47:30','HH24:MI:SS'),
                           3,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 5,
                           19,
                           TO_DATE('07:04:00','HH24:MI:SS'),
                           TO_DATE('09:55:45','HH24:MI:SS'),
                           TO_DATE('02:51:45','HH24:MI:SS'),
                           4,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 5,
                           20,
                           NULL,
                           NULL,
                           NULL,
                           5,
                           NULL,
                           NULL );

-- Event 6 (3K Community Run - 02-FEB-2025) - Entry numbers 21, 22, 23, 24
INSERT INTO entry VALUES ( 6,
                           21,
                           TO_DATE('08:00:00','HH24:MI:SS'),
                           TO_DATE('08:13:22','HH24:MI:SS'),
                           TO_DATE('00:13:22','HH24:MI:SS'),
                           6,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 6,
                           22,
                           TO_DATE('08:01:30','HH24:MI:SS'),
                           TO_DATE('08:16:15','HH24:MI:SS'),
                           TO_DATE('00:14:45','HH24:MI:SS'),
                           7,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 6,
                           23,
                           TO_DATE('08:02:45','HH24:MI:SS'),
                           TO_DATE('08:19:15','HH24:MI:SS'),
                           TO_DATE('00:16:30','HH24:MI:SS'),
                           8,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 6,
                           24,
                           TO_DATE('08:04:00','HH24:MI:SS'),
                           TO_DATE('08:21:15','HH24:MI:SS'),
                           TO_DATE('00:17:15','HH24:MI:SS'),
                           9,
                           NULL,
                           NULL );

-- Event 7 (5K Run - 02-FEB-2025) - Entry numbers 25, 26, 27, 28
INSERT INTO entry VALUES ( 7,
                           25,
                           TO_DATE('08:00:00','HH24:MI:SS'),
                           TO_DATE('08:31:45','HH24:MI:SS'),
                           TO_DATE('00:31:45','HH24:MI:SS'),
                           10,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 7,
                           26,
                           TO_DATE('08:00:45','HH24:MI:SS'),
                           TO_DATE('08:33:05','HH24:MI:SS'),
                           TO_DATE('00:32:20','HH24:MI:SS'),
                           11,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 7,
                           27,
                           NULL,
                           NULL,
                           NULL,
                           12,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 7,
                           28,
                           TO_DATE('08:01:30','HH24:MI:SS'),
                           TO_DATE('08:37:00','HH24:MI:SS'),
                           TO_DATE('00:35:30','HH24:MI:SS'),
                           13,
                           NULL,
                           NULL );

-- Event 8 (10K Run - 02-FEB-2025) - Entry numbers 29, 30, 31, 32
INSERT INTO entry VALUES ( 8,
                           29,
                           TO_DATE('09:00:00','HH24:MI:SS'),
                           TO_DATE('09:56:20','HH24:MI:SS'),
                           TO_DATE('00:56:20','HH24:MI:SS'),
                           14,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 8,
                           30,
                           TO_DATE('09:01:15','HH24:MI:SS'),
                           TO_DATE('10:03:00','HH24:MI:SS'),
                           TO_DATE('01:01:45','HH24:MI:SS'),
                           15,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 8,
                           31,
                           TO_DATE('09:02:00','HH24:MI:SS'),
                           TO_DATE('10:08:30','HH24:MI:SS'),
                           TO_DATE('01:06:30','HH24:MI:SS'),
                           1,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 8,
                           32,
                           TO_DATE('09:02:45','HH24:MI:SS'),
                           TO_DATE('10:14:55','HH24:MI:SS'),
                           TO_DATE('01:12:10','HH24:MI:SS'),
                           2,
                           NULL,
                           NULL );

-- Event 9 (21K Half Marathon - 02-FEB-2025) - Entry numbers 33, 34, 35, 36
INSERT INTO entry VALUES ( 9,
                           33,
                           TO_DATE('07:00:00','HH24:MI:SS'),
                           TO_DATE('09:45:20','HH24:MI:SS'),
                           TO_DATE('02:45:20','HH24:MI:SS'),
                           3,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 9,
                           34,
                           TO_DATE('07:02:00','HH24:MI:SS'),
                           TO_DATE('09:51:15','HH24:MI:SS'),
                           TO_DATE('02:49:15','HH24:MI:SS'),
                           4,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 9,
                           35,
                           TO_DATE('07:04:00','HH24:MI:SS'),
                           TO_DATE('09:56:45','HH24:MI:SS'),
                           TO_DATE('02:52:45','HH24:MI:SS'),
                           5,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 9,
                           36,
                           TO_DATE('07:06:00','HH24:MI:SS'),
                           TO_DATE('10:00:30','HH24:MI:SS'),
                           TO_DATE('02:54:30','HH24:MI:SS'),
                           6,
                           NULL,
                           NULL );

-- Event 10 (3K Community Run - 15-MAR-2025) - Entry numbers 37, 38, 39, 40
INSERT INTO entry VALUES ( 10,
                           37,
                           TO_DATE('08:00:00','HH24:MI:SS'),
                           TO_DATE('08:15:10','HH24:MI:SS'),
                           TO_DATE('00:15:10','HH24:MI:SS'),
                           7,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 10,
                           38,
                           TO_DATE('08:01:15','HH24:MI:SS'),
                           TO_DATE('08:17:50','HH24:MI:SS'),
                           TO_DATE('00:16:35','HH24:MI:SS'),
                           8,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 10,
                           39,
                           TO_DATE('08:02:30','HH24:MI:SS'),
                           TO_DATE('08:19:50','HH24:MI:SS'),
                           TO_DATE('00:17:20','HH24:MI:SS'),
                           9,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 10,
                           40,
                           TO_DATE('08:03:45','HH24:MI:SS'),
                           TO_DATE('08:22:30','HH24:MI:SS'),
                           TO_DATE('00:18:45','HH24:MI:SS'),
                           10,
                           NULL,
                           NULL );

-- Event 11 (42K Marathon - 15-MAR-2025) - Entry numbers 41, 42, 43, 44
INSERT INTO entry VALUES ( 11,
                           41,
                           TO_DATE('06:00:00','HH24:MI:SS'),
                           TO_DATE('09:06:35','HH24:MI:SS'),
                           TO_DATE('03:06:35','HH24:MI:SS'),
                           11,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 11,
                           42,
                           TO_DATE('06:03:00','HH24:MI:SS'),
                           TO_DATE('09:16:45','HH24:MI:SS'),
                           TO_DATE('03:13:45','HH24:MI:SS'),
                           12,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 11,
                           43,
                           TO_DATE('06:06:00','HH24:MI:SS'),
                           TO_DATE('09:21:20','HH24:MI:SS'),
                           TO_DATE('03:15:20','HH24:MI:SS'),
                           13,
                           NULL,
                           NULL );
INSERT INTO entry VALUES ( 11,
                           44,
                           TO_DATE('06:09:00','HH24:MI:SS'),
                           TO_DATE('09:26:10','HH24:MI:SS'),
                           TO_DATE('03:17:10','HH24:MI:SS'),
                           14,
                           NULL,
                           NULL );

-- =======================================
-- TEAM
-- =======================================
-- TEAM INSERTS  
INSERT INTO team VALUES ( 23,
                          'Akatsuki Ninjas',
                          TO_DATE('2024-10-05','YYYY-MM-DD'),
                          4,
                          13 );  -- Event 4, entry 13
INSERT INTO team VALUES ( 47,
                          'Starfall Knights',
                          TO_DATE('2025-02-02','YYYY-MM-DD'),
                          8,
                          31 );  -- Event 8, entry 31  
INSERT INTO team VALUES ( 81,
                          'Vocaloid Singers',
                          TO_DATE('2024-10-05','YYYY-MM-DD'),
                          4,
                          14 );   -- Event 4, entry 14
INSERT INTO team VALUES ( 64,
                          'Akatsuki Ninjas',
                          TO_DATE('2025-02-02','YYYY-MM-DD'),
                          9,
                          36 );  -- Event 9, entry 36
INSERT INTO team VALUES ( 92,
                          'Hestia Familia',
                          TO_DATE('2025-02-02','YYYY-MM-DD'),
                          8,
                          29 );   -- Event 8, entry 29

-- ENTRY TEAM UPDATES 
UPDATE entry
   SET
    team_id = 23
 WHERE event_id = 4
   AND entry_no = 13;  -- Akatsuki Ninjas member 1 (captain)
UPDATE entry
   SET
    team_id = 23
 WHERE event_id = 4
   AND entry_no = 15;  -- Akatsuki Ninjas member 2
UPDATE entry
   SET
    team_id = 23
 WHERE event_id = 4
   AND entry_no = 16;  -- Akatsuki Ninjas member 3

UPDATE entry
   SET
    team_id = 47
 WHERE event_id = 8
   AND entry_no = 31;  -- Starfall Knights member 1 (captain) 
UPDATE entry
   SET
    team_id = 47
 WHERE event_id = 8
   AND entry_no = 32;  -- Starfall Knights member 2

UPDATE entry
   SET
    team_id = 81
 WHERE event_id = 4
   AND entry_no = 14;  -- Vocaloid Singers member 1 (captain)
UPDATE entry
   SET
    team_id = 81
 WHERE event_id = 5
   AND entry_no = 18;  -- Vocaloid Singers member 2

UPDATE entry
   SET
    team_id = 64
 WHERE event_id = 9
   AND entry_no = 36;  -- Akatsuki Ninjas member 1 (captain)
UPDATE entry
   SET
    team_id = 64
 WHERE event_id = 6
   AND entry_no = 24;  -- Akatsuki Ninjas member 2
UPDATE entry
   SET
    team_id = 64
 WHERE event_id = 10
   AND entry_no = 39; -- Akatsuki Ninjas member 3

UPDATE entry
   SET
    team_id = 92
 WHERE event_id = 8
   AND entry_no = 29;  -- Hestia Familia member 1 (captain)
UPDATE entry
   SET
    team_id = 92
 WHERE event_id = 8
   AND entry_no = 30;  -- Hestia Familia member 2


COMMIT;