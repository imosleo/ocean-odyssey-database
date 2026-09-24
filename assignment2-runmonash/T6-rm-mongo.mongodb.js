// *****PLEASE ENTER YOUR DETAILS BELOW*****
// T6-rm-mongo.mongodb.js

// -- student: 34423680
// -- student name: Ian Leong Zheng Yan

// Comments for your marker:
// For new WINTER SERIES carnival, using entry numbers starting from 200
// to clearly differentiate from existing carnival entries (which range 13-39).
// Team ID 100 chosen for new winter carnival to separate from existing team IDs (23, 47, 64, 81, 92).
// This prevents confusion and maintains data integrity across different carnivals.

// ===================================================================================
// DO NOT modify or remove any of the comments below (items marked with //)
// ===================================================================================

// Use (connect to) your database - you MUST update xyz001
// with your authcate username

use("ileo0005");

// (b)
// PLEASE PLACE REQUIRED MONGODB COMMAND TO CREATE THE COLLECTION HERE
// YOU MAY PICK ANY COLLECTION NAME
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Drop collection
db.runmonash_teams.drop();

// Create collection and insert documents
db.runmonash_teams.insertMany([
    {
        "_id": 23,
        "carn_name": "RM Spring Series Caulfield 2024",
        "carn_date": "05-OCT-2024",
        "team_name": "Akatsuki Ninjas",
        "team_leader": {
            "name": "Akeno Himejima",
            "phone": "0107211995",
            "email": "ahime@student.monash.edu"
        },
        "team_no_of_members": 3,
        "team_members": [
            {
                "competitor_name": "Artoria Pendragon",
                "competitor_phone": "0104101999",
                "event_type": "10 Km Run",
                "entry_no": 16,
                "starttime": "09:15:00",
                "finishtime": "10:18:20",
                "elapsedtime": "01:03:20"
            },
            {
                "competitor_name": "Mash Kyrielight",
                "competitor_phone": "0107302000",
                "event_type": "10 Km Run",
                "entry_no": 15,
                "starttime": "09:10:00",
                "finishtime": "10:11:45",
                "elapsedtime": "01:01:45"
            },
            {
                "competitor_name": "Akeno Himejima",
                "competitor_phone": "0107211995",
                "event_type": "10 Km Run",
                "entry_no": 13,
                "starttime": "09:00:00",
                "finishtime": "09:58:30",
                "elapsedtime": "00:58:30"
            }
        ]
    },
    {
        "_id": 47,
        "carn_name": "RM Summer Series Caulfield 2025",
        "carn_date": "02-FEB-2025",
        "team_name": "Starfall Knights",
        "team_leader": {
            "name": "Artoria Pendragon",
            "phone": "0104101999",
            "email": "apen@student.monash.edu"
        },
        "team_no_of_members": 2,
        "team_members": [
            {
                "competitor_name": "Artoria Pendragon",
                "competitor_phone": "0104101999",
                "event_type": "10 Km Run",
                "entry_no": 31,
                "starttime": "09:10:00",
                "finishtime": "10:06:30",
                "elapsedtime": "00:56:30"
            },
            {
                "competitor_name": "Ellen Joe",
                "competitor_phone": "0101042002",
                "event_type": "10 Km Run",
                "entry_no": 32,
                "starttime": "09:15:00",
                "finishtime": "10:12:10",
                "elapsedtime": "00:57:10"
            }
        ]
    },
    {
        "_id": 64,
        "carn_name": "RM Summer Series Caulfield 2025",
        "carn_date": "02-FEB-2025",
        "team_name": "Akatsuki Ninjas",
        "team_leader": {
            "name": "Itachi Uchiha",
            "phone": "0106091987",
            "email": "clan.killer@gmail.com"
        },
        "team_no_of_members": 3,
        "team_members": [
            {
                "competitor_name": "Itachi Uchiha",
                "competitor_phone": "0106091987",
                "event_type": "21.1 Km Half Marathon",
                "entry_no": 36,
                "starttime": "07:15:00",
                "finishtime": "10:09:30",
                "elapsedtime": "02:54:30"
            },
            {
                "competitor_name": "Yuuki Asuna",
                "competitor_phone": "0109302006",
                "event_type": "21.1 Km Half Marathon",
                "entry_no": 39,
                "starttime": "08:10:00",
                "finishtime": "08:27:20",
                "elapsedtime": "00:17:20"
            },
            {
                "competitor_name": "Yuuki Asuna",
                "competitor_phone": "0109302006",
                "event_type": "21.1 Km Half Marathon",
                "entry_no": 24,
                "starttime": "08:15:00",
                "finishtime": "08:32:15",
                "elapsedtime": "00:17:15"
            }
        ]
    },
    {
        "_id": 81,
        "carn_name": "RM Spring Series Caulfield 2024",
        "carn_date": "05-OCT-2024",
        "team_name": "Vocaloid Singers",
        "team_leader": {
            "name": "Gojo Satoru",
            "phone": "0112071989",
            "email": "honored.one@gmail.com"
        },
        "team_no_of_members": 2,
        "team_members": [
            {
                "competitor_name": "Hatsune Miku",
                "competitor_phone": "0108312007",
                "event_type": "10 Km Run",
                "entry_no": 18,
                "starttime": "07:05:00",
                "finishtime": "09:52:30",
                "elapsedtime": "02:47:30"
            },
            {
                "competitor_name": "Gojo Satoru",
                "competitor_phone": "0112071989",
                "event_type": "10 Km Run",
                "entry_no": 14,
                "starttime": "09:05:00",
                "finishtime": "10:04:15",
                "elapsedtime": "00:59:15"
            }
        ]
    },
    {
        "_id": 92,
        "carn_name": "RM Summer Series Caulfield 2025",
        "carn_date": "02-FEB-2025",
        "team_name": "Hestia Familia",
        "team_leader": {
            "name": "Gojo Satoru",
            "phone": "0112071989",
            "email": "honored.one@gmail.com"
        },
        "team_no_of_members": 2,
        "team_members": [
            {
                "competitor_name": "Gojo Satoru",
                "competitor_phone": "0112071989",
                "event_type": "10 Km Run",
                "entry_no": 29,
                "starttime": "09:00:00",
                "finishtime": "09:56:20",
                "elapsedtime": "00:56:20"
            },
            {
                "competitor_name": "Mash Kyrielight",
                "competitor_phone": "0107302000",
                "event_type": "10 Km Run",
                "entry_no": 30,
                "starttime": "09:05:00",
                "finishtime": "10:01:45",
                "elapsedtime": "00:56:45"
            }
        ]
    }
]);





// List all documents you added
db.runmonash_teams.find();

// (c)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer
db.runmonash_teams.find(
    {
        "team_members.event_type": { "$in": ["5 Km Run", "10 Km Run"] }
    },
    {
        "carn_date": 1,
        "carn_name": 1,
        "team_members.competitor_name": 1,
        "team_members.competitor_phone": 1,
        "team_members.event_type": 1,
        "_id": 0
    }
);



// (d)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer


// (i) Add new team
db.runmonash_teams.insertOne({
    "_id": 100, // Using 100 as team ID for new WINTER SERIES carnival
    "carn_name": "RM WINTER SERIES CAULFIELD 2025",
    "carn_date": "29-JUN-2025",
    "team_name": "The Great Runners",
    "team_leader": {
        "name": "Jackson Bull",
        "phone": "0422412524",
        "email": "jackson.bull@gmail.com"
    },
    "team_no_of_members": 1,
    "team_members": [
        {
            "competitor_name": "Jackson Bull",
            "competitor_phone": "0422412524",
            "event_type": "5 Km Run",
            "entry_no": 200,  // Starting at 200 for new carnival to differentiate from existing data
            "starttime": "-",
            "finishtime": "-",
            "elapsedtime": "-"
        }
    ]
});




// Illustrate/confirm changes made

db.runmonash_teams.find({ "team_name": "The Great Runners" });


// (ii) Add new team member

db.runmonash_teams.updateOne(
    { "team_name": "The Great Runners" },
    {
        "$push": {
            "team_members": {
                "competitor_name": "Steve Bull",
                "competitor_phone": "0422251427",
                "event_type": "10 Km Run",
                "entry_no": 201, // Sequential entry number for new carnival
                "starttime": "-",
                "finishtime": "-",
                "elapsedtime": "-"
            }
        },
        "$inc": { "team_no_of_members": 1 }
    }
);



// Illustrate/confirm changes made
db.runmonash_teams.find({ "team_name": "The Great Runners" });


