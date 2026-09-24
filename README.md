# Ocean Odyssey and RunMonash: Relational Database Design and SQL

Two database assignments for FIT2094 Databases at Monash University Malaysia (Semester 1, 2025, unit result High Distinction). The first takes a written case study for a cruise company from a conceptual model through normalisation to a logical model and a generated Oracle schema. The second works against a supplied running-carnival schema: creating tables, loading data, writing transactional changes, evolving the schema, answering reporting questions in SQL and exporting documents to MongoDB.

| | |
|---|---|
| **Author** | Ian Leong Zheng Yan |
| **Unit** | FIT2094 Databases, Monash University Malaysia |
| **Period** | March to May 2025 |
| **Tools** | Oracle Database 12c, Oracle SQL Developer and SQL Developer Data Modeler, MongoDB |

## Assignment 1: Ocean Odyssey database design

Ocean Odyssey is a worldwide cruise company. Operators run ships; ships have cabins and sail cruises that call at ports on a schedule; passengers register with an address, book a cabin on a cruise, and minors must have a registered guardian. The task was to turn that description into a working database.

| Step | File | What it contains |
|---|---|---|
| Conceptual model | `oo_conceptual.pdf` | Entities, keys, relationships with cardinality, identifying vs non-identifying |
| Normalisation | `oo_normalisation.pdf` | The cruise itinerary form taken from unnormalised form to 3NF, showing partial and transitive dependencies at each step |
| Logical model | `oo_logical.pdf` | The relational model integrating the conceptual model and the normalised relations |
| Assumptions | `oo_assumptions.pdf` | Design decisions: a separate ADDRESS entity, a recursive guardian relationship on PASSENGER, surrogate keys, minimum cardinalities |
| Schema | `oo_schema.sql` | Generated Oracle DDL, 10 tables with constraints and column comments; `oo_schema_output.txt` is the clean run (0 errors, 0 warnings) |
| Modeler project | `oo_model_sql_developer_data_modeler.zip` | The SQL Developer Data Modeler project |

Tables: OPERATOR, SHIP, CABIN, CRUISE, PORT, PORT_SCHEDULE, PASSENGER, ADDRESS, COUNTRY, MANIFEST.

## Assignment 2: RunMonash carnival SQL

RunMonash organises running carnivals with events, competitors, entries and charity teams. Given the existing schema, each script answers one task and includes comments explaining the approach.

| Script | Task |
|---|---|
| `T1-rm-schema.sql` | Create the missing COMPETITOR, ENTRY and TEAM tables with constraints, comments and foreign keys |
| `T2-rm-insert.sql` | Load 64 rows of sample data respecting all constraints |
| `T3-rm-dm.sql` | Data manipulation: sequences for new records, registering competitors and forming a team, changing an entry's event and charity, and withdrawing a competitor with the team disbandment handled in dependency order |
| `T4-rm-mods.sql` | Schema evolution: add a completed-events count, and redesign entry-to-charity as a many-to-many with percentage splits, migrating the existing data |
| `T5-rm-select.sql` | Reporting queries with joins, subqueries, aggregates and window-style comparisons against averages and minimums |
| `T6-rm-json.sql` | Build JSON documents from the relational data with JSON_OBJECT and JSON_ARRAYAGG |
| `T6-rm-mongo.mongodb.js` | Load those documents into MongoDB and query and update them |

## Running the scripts

All Oracle scripts were run in SQL Developer against the unit's Oracle 12c server with `set echo on` and spooled output. They are plain SQL and run in any Oracle 12c or later instance; the Assignment 2 scripts need the unit's base RunMonash schema (not included). The MongoDB script runs in the MongoDB for VS Code playground or `mongosh`.

## Notes

The assignment briefs, checklists and the unit's sample solutions are not included; only my own work is here.
