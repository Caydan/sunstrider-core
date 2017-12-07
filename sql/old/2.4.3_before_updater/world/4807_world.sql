DELETE FROM escort_waypoints WHERE entry = 12717;
INSERT INTO escort_waypoints VALUES 
(12717, 0, 3344.163330, 1005.368408, 3.774920, 0, ""),
(12717, 1, 3383.086670, 1016.591431, 2.904611, 0, ""),
(12717, 2, 3443.630127, 1010.207458, 2.729088, 0, ""),
(12717, 3, 3473.494385, 1032.455078, 0.863782, 0, ""),
(12717, 4, 3496.264648, 1048.797974, 5.218233, 0, ""),
(12717, 5, 3513.336670, 1061.051025, 11.544600, 0, ""),
(12717, 6, 3517.601074, 1073.063599, 12.572226, 0, ""),
(12717, 7, 3518.980469, 1087.423828, 9.856125, 0, ""),
(12717, 8, 3529.336670, 1084.211792, 5.804341, 0, ""),
(12717, 9, 3541.440186, 1105.109375, 0.641935, 0, ""),
(12717, 10, 3585.736328, 1122.687866, 0.804930, 0, ""),
(12717, 11, 3587.355957, 1141.651855, 8.037621, 0, ""),
(12717, 12, 3596.806885, 1146.416626, 6.979097, 0, ""),
(12717, 13, 3603.676270, 1149.879883, 10.541241, 0, ""),
(12717, 14, 3604.845215, 1149.059692, 10.683486, 0, "");

UPDATE creature_template SET ScriptName = "npc_muglash" WHERE entry = 12717;
UPDATE gameobject_template SET ScriptName = "go_naga_brazier" WHERE entry = 178247;