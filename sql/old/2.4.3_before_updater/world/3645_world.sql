UPDATE creature_template SET unit_flags = unit_flags & ~0x2, faction_a = 1826, faction_h = 1826 WHERE entry = 21506;
UPDATE creature_template SET flags_extra = flags_extra | 2 WHERE entry IN (22430, 22431);

UPDATE creature_template SET AIName = "SmartAI", ScriptName = "" WHERE entry IN (22431, 22432, 22507);
UPDATE creature SET spawntimesecs = 15 WHERE id = 22431;
UPDATE quest_template SET ReqSpellCast1 = 0 WHERE entry = 10935;

UPDATE quest_bugs SET bugged = 0 WHERE entry = 10935;

DELETE FROM smart_scripts WHERE entryorguid IN (22431, 2243100, 22432, 2243200, 2243201, 22507);
INSERT INTO smart_scripts VALUES
-- Anchorite Barada
(22431, 0, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, -710.890747, 2749.650391, 101.591362, 1.544293, "Move to event point"),
(22431, 0, 1, 2, 34, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Say text 0"),
(22431, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 80, 2243100, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Start event"),
(22431, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Set REACT_PASSIVE"),
(22431, 0, 4, 0, 38, 0, 100, 0, 0, 1, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Evade"),
-- Timed action list
(2243100, 9, 0, 0, 0, 0, 100, 0, 500, 500, 0, 0, 45, 0, 1, 0, 0, 0, 0, 19, 22432, 0, 0, 0, 0, 0, 0, "SetData on Colonel Jules"),
(2243100, 9, 1, 0, 0, 0, 100, 0, 500, 500, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1.516778, "Face bed"), -- FIXME
-- Colonel Jules
(22432, 0, 0, 1, 38, 0, 100, 0, 0, 1, 500, 500, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Say text 0"),
(22432, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 11, 39284, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Jules threatens, aura"),
(22432, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 2243200, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Start first action list"),
-- Timed action lists
(2243200, 9, 0, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Start flying"),
(2243200, 9, 1, 0, 0, 0, 100, 0, 500, 500, 0, 0, 17, 42, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Swimming emote"),
(2243200, 9, 2, 0, 0, 0, 100, 0, 500, 500, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, -710.357117, 2754.494629, 104.499573, 1.555354, "Elevates"),
(2243200, 9, 3, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 53, 0, 22432, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Start path"),
(2243200, 9, 5, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 12, 22507, 5, 0, 0, 1, 0, 8, 0, 0, 0, -707.923218, 2744.073975, 104.591003, 0, "Summon quest mob"),
(2243200, 9, 6, 0, 0, 0, 100, 0, 8000, 8000, 0, 0, 12, 22507, 5, 0, 0, 1, 0, 8, 0, 0, 0, -707.923218, 2744.073975, 104.591003, 0, "Summon quest mob"),
(2243200, 9, 7, 0, 0, 0, 100, 0, 8000, 8000, 0, 0, 12, 22507, 5, 0, 0, 1, 0, 8, 0, 0, 0, -707.923218, 2744.073975, 104.591003, 0, "Summon quest mob"),
(2243200, 9, 8, 0, 0, 0, 100, 0, 8000, 8000, 0, 0, 12, 22507, 5, 0, 0, 1, 0, 8, 0, 0, 0, -707.923218, 2744.073975, 104.591003, 0, "Summon quest mob"),
(2243200, 9, 9, 0, 0, 0, 100, 0, 8000, 8000, 0, 0, 33, 22432, 0, 0, 0, 0, 0, 18, 10, 0, 0, 0, 0, 0, 0, "Complete quest for all near players"),
(2243200, 9, 19, 20, 0, 0, 100, 0, 1000, 1000, 0, 0, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Suicide to end event"),
(2243200, 0, 20, 0, 61, 0, 100, 0, 0, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 19, 22431, 0, 0, 0, 0, 0, 0, "SetData on Anchorite Barada"),
-- Darkness Released
(22507, 0, 0, 1, 25, 0, 100, 0, 0, 0, 0, 0, 11, 39303, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Cast visual on self"),
(22507, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Start flying"),
(22507, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 89, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Start random movement"),
-- (22507, 0, 3, 0, 0, 0, 100, 0, 1000, 1000, 2000, 2000, 11, 39320, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Cast attack on victim");
(22507, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Set REACT_PASSIVE"),
(22507, 0, 4, 0, 8, 0, 100, 0, 39371, 0, 500, 500, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Suicide on spellhit");

DELETE FROM creature_text WHERE entry IN (22431, 22432);
INSERT INTO creature_text VALUES
(22431, 0, 0, "[PH] Debut de l'event (Barada)", 0, 0, 100, 1, 0, 0, "Text 0"),
(22432, 0, 0, "[PH] Debut de l'event (Jules)", 0, 0, 100, 1, 0, 0, "Text 0");

DELETE FROM waypoints WHERE entry = 22432;
INSERT INTO waypoints VALUES
(22432, 1, -707.258667, 2749.870605, 104.591003, "North West"),
(22432, 2, -707.923218, 2744.073975, 104.591003, "North East"),
(22432, 3, -714.383301, 2744.349121, 104.591003, "South East"),
(22432, 4, -714.364624, 2750.551270, 104.591003, "South West");