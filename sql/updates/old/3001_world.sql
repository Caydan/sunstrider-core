DELETE FROM creature WHERE id = 22275;
UPDATE gameobject_template SET flags = 0 WHERE name LIKE "Large%cluster";

UPDATE creature_template SET flags_extra = 130, scriptname = "npc_simon_bunny_large" WHERE entry = 23378;
UPDATE gameobject_template SET scriptname = "go_blue_cluster_large" WHERE entry IN (185604, 185640, 185795, 185816, 185844, 185776, 185660);
UPDATE gameobject_template SET scriptname = "go_green_cluster_large" WHERE entry IN (185605, 185641, 185793, 185818, 185846, 185777, 185661);
UPDATE gameobject_template SET scriptname = "go_red_cluster_large" WHERE entry IN (185606, 185642, 185794, 185817, 185778, 185845, 185662);
UPDATE gameobject_template SET scriptname = "go_yellow_cluster_large" WHERE entry IN (185607, 185643, 185792, 185819, 185847, 185779, 185663);

UPDATE gameobject_template SET scriptname = "go_apexis_monument" WHERE entry = 185944;

DELETE FROM spell_script_target WHERE targetEntry IN (185604, 185640, 185795, 185816, 185844, 185776, 185660, 185605, 185641, 185793, 185818, 185846, 185777, 185661, 185606, 185642, 185794, 185817, 185778, 185845, 185662, 185607, 185643, 185792, 185819, 185847, 185779, 185663);
INSERT INTO spell_script_target VALUES
(40281, 0, 185604),
(40281, 0, 185640),
(40281, 0, 185795),
(40281, 0, 185816),
(40281, 0, 185844),
(40281, 0, 185776),
(40281, 0, 185660),

(40287, 0, 185605),
(40287, 0, 185641),
(40287, 0, 185793),
(40287, 0, 185818),
(40287, 0, 185846),
(40287, 0, 185777),
(40287, 0, 185661),

(40288, 0, 185606),
(40288, 0, 185642),
(40288, 0, 185794),
(40288, 0, 185817),
(40288, 0, 185778),
(40288, 0, 185845),
(40288, 0, 185662),

(40289, 0, 185607),
(40289, 0, 185643),
(40289, 0, 185792),
(40289, 0, 185819),
(40289, 0, 185847),
(40289, 0, 185779),
(40289, 0, 185663),

(40244, 0, 185604),
(40244, 0, 185640),
(40244, 0, 185795),
(40244, 0, 185816),
(40244, 0, 185844),
(40244, 0, 185776),
(40244, 0, 185660),

(40245, 0, 185605),
(40245, 0, 185641),
(40245, 0, 185793),
(40245, 0, 185818),
(40245, 0, 185846),
(40245, 0, 185777),
(40245, 0, 185661),

(40246, 0, 185606),
(40246, 0, 185642),
(40246, 0, 185794),
(40246, 0, 185817),
(40246, 0, 185778),
(40246, 0, 185845),
(40246, 0, 185662),

(40247, 0, 185607),
(40247, 0, 185643),
(40247, 0, 185792),
(40247, 0, 185819),
(40247, 0, 185847),
(40247, 0, 185779),
(40247, 0, 185663);

UPDATE creature_loot_template SET ChanceOrQuestChance = -100 WHERE item = 32697;