#update creature_template structure

ALTER TABLE creature_template
	CHANGE heroic_entry difficulty_entry_1 MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0';
	
ALTER TABLE creature_template 
	ADD COLUMN `exp` SMALLINT(6) NOT NULL DEFAULT '0' AFTER maxlevel;
	
ALTER TABLE creature_template 
	DROP COLUMN minhealth;
	
ALTER TABLE creature_template 
	DROP COLUMN maxhealth;
	
ALTER TABLE creature_template 
	DROP COLUMN armor;
	
ALTER TABLE creature_template 
	DROP COLUMN mindmg;
	
ALTER TABLE creature_template 
	DROP COLUMN maxdmg;
		
ALTER TABLE creature_template 
	DROP COLUMN attackpower;
	
ALTER TABLE creature_template
	CHANGE baseattacktime BaseAttackTime INT(10) UNSIGNED NOT NULL DEFAULT '0';
	
ALTER TABLE creature_template
	CHANGE rangeattacktime RangeAttackTime INT(10) UNSIGNED NOT NULL DEFAULT '0';
	
ALTER TABLE creature_template
	ADD COLUMN `BaseVariance` FLOAT NOT NULL DEFAULT '1' AFTER `RangeAttackTime`;
	
ALTER TABLE creature_template
	ADD COLUMN `RangeVariance` FLOAT NOT NULL DEFAULT '1' AFTER `BaseVariance`;

ALTER TABLE creature_template
	ADD COLUMN `unit_class` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `RangeVariance`;

ALTER TABLE creature_template
	CHANGE class `trainer_class` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0';
	
ALTER TABLE creature_template
	CHANGE race `trainer_race` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0';
	
ALTER TABLE creature_template
	DROP COLUMN minrangedmg;
	
ALTER TABLE creature_template
	DROP COLUMN maxrangedmg;
	
ALTER TABLE creature_template
	DROP COLUMN rangedattackpower;
	
ALTER TABLE creature_template
	ADD COLUMN `HealthModifier` FLOAT NOT NULL DEFAULT '1' AFTER InhabitType;
	
ALTER TABLE creature_template
	ADD COLUMN `ManaModifier` FLOAT NOT NULL DEFAULT '1' AFTER HealthModifier;
	
ALTER TABLE creature_template
	ADD COLUMN `ArmorModifier` FLOAT NOT NULL DEFAULT '1' AFTER ManaModifier;
	
ALTER TABLE creature_template
	ADD COLUMN `DamageModifier` FLOAT NOT NULL DEFAULT '1' AFTER ArmorModifier;
	
ALTER TABLE creature_template
	ADD COLUMN `ExperienceModifier` FLOAT NOT NULL DEFAULT '1' AFTER DamageModifier;
	
	
	
DROP TABLE IF EXISTS `creature_classlevelstats`;

CREATE TABLE `creature_classlevelstats` (
  `level` tinyint(3) unsigned NOT NULL,
  `class` tinyint(3) unsigned NOT NULL,
  `basehp0` smallint(5) unsigned NOT NULL DEFAULT '1',
  `basehp1` smallint(5) unsigned NOT NULL DEFAULT '1',
  `basehp2` smallint(5) unsigned NOT NULL DEFAULT '1',
  `basemana` smallint(5) unsigned NOT NULL DEFAULT '0',
  `basearmor` smallint(5) unsigned NOT NULL DEFAULT '1',
  `attackpower` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rangedattackpower` smallint(5) unsigned NOT NULL DEFAULT '0',
  `damage_base` float NOT NULL DEFAULT '0',
  `damage_exp1` float NOT NULL DEFAULT '0',
  `damage_exp2` float NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`level`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `creature_classlevelstats` */

insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (1,1,42,1,1,0,8,10,1,0.0607,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (2,1,55,1,1,0,20,10,1,0.3603,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (3,1,71,1,1,0,33,11,1,0.6976,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (4,1,86,1,1,0,68,13,1,1.0863,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (5,1,102,1,1,0,111,17,1,1.4422,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (6,1,120,1,1,0,165,19,1,2.1375,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (7,1,137,1,1,0,230,21,1,2.9811,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (8,1,156,1,1,0,306,24,1,3.485,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (9,1,176,1,1,0,387,28,1,3.0304,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (10,1,198,1,1,0,463,32,1,3.2707,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (11,1,222,1,1,0,528,36,1,4.8425,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (12,1,247,1,1,0,562,40,1,5.603,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (13,1,273,1,1,0,596,44,1,6.0787,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (14,1,300,1,1,0,630,50,1,6.6101,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (15,1,328,1,1,0,665,54,2,7.1981,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (16,1,356,1,1,0,700,56,2,7.7861,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (17,1,386,1,1,0,734,60,2,8.3741,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (18,1,417,1,1,0,768,64,3,8.9621,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (19,1,449,1,1,0,802,68,3,9.5501,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (20,1,484,1,1,0,836,70,4,10.1381,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (21,1,521,1,1,0,872,74,4,10.7261,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (22,1,562,1,1,0,906,78,4,11.3141,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (23,1,605,1,1,0,940,80,5,11.9021,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (24,1,651,1,1,0,975,84,6,12.4901,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (25,1,699,1,1,0,1008,86,6,13.0781,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (26,1,750,1,1,0,1043,90,7,13.6661,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (27,1,800,1,1,0,1078,92,7,14.2541,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (28,1,853,1,1,0,1111,96,8,14.8421,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (29,1,905,1,1,0,1145,100,8,15.4301,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (30,1,955,1,1,0,1179,102,9,16.0181,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (31,1,1006,1,1,0,1213,106,9,16.6061,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (32,1,1057,1,1,0,1249,108,10,17.1941,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (33,1,1110,1,1,0,1281,112,10,17.7821,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (34,1,1163,1,1,0,1317,114,11,18.3701,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (35,1,1220,1,1,0,1349,118,11,18.9581,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (36,1,1277,1,1,0,1456,120,12,19.5461,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (37,1,1336,1,1,0,1568,124,12,20.1341,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (38,1,1395,1,1,0,1684,128,13,20.7221,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (39,1,1459,1,1,0,1808,132,13,21.3101,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (40,1,1524,1,1,0,1938,136,14,21.8981,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (41,1,1585,1,1,0,2074,142,15,22.4861,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (42,1,1651,1,1,0,2218,152,15,23.0741,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (43,1,1716,1,1,0,2369,162,16,23.6621,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (44,1,1782,1,1,0,2528,174,16,24.2501,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (45,1,1848,1,1,0,2695,184,17,24.8381,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (46,1,1919,1,1,0,2750,188,17,25.4261,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (47,1,1990,1,1,0,2804,192,18,26.0141,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (48,1,2062,1,1,0,2857,196,19,26.6021,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (49,1,2138,1,1,0,2912,200,19,27.1901,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (50,1,2215,1,1,0,2966,206,20,27.7781,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (51,1,2292,1,1,0,3018,210,20,28.3661,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (52,1,2371,1,1,0,3060,214,21,28.9541,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (53,1,2453,1,1,0,3128,218,22,29.5421,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (54,1,2533,1,1,0,3180,224,22,30.1301,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (55,1,2614,1,1,0,3234,228,23,30.7177,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (56,1,2699,1,1,0,3289,234,23,31.3057,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (57,1,2784,1,1,0,3342,238,24,31.8937,42.1353,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (58,1,2871,3989,1,0,3396,242,25,32.4817,46.9207,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (59,1,2961,4142,1,0,3449,248,25,33.0697,51.7061,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (60,1,3052,4979,1,0,3750,252,26,33.6577,56.4915,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (61,1,3144,5158,1,0,4047,258,28,34.2457,61.2769,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (62,1,3237,5341,1,0,4344,262,30,34.8337,66.0623,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (63,1,3331,5527,1,0,4641,268,32,35.4217,70.8477,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (64,1,3427,5715,1,0,4937,272,33,36.0097,75.6331,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (65,1,3524,5914,1,0,5234,278,35,36.5977,80.4185,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (66,1,3624,6116,1,0,5531,282,37,37.1857,85.2039,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (67,1,3728,6326,1,0,5829,288,39,37.7737,89.9893,111.174,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (68,1,3834,6542,6986,0,6126,292,41,38.3617,94.7747,115.224,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (69,1,3942,6761,7984,0,6423,298,43,38.9497,99.5601,119.274,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (70,1,4050,6986,8982,0,6719,304,44,39.5377,104.346,123.324,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (71,1,4163,7181,9291,0,7018,308,48,40.1257,109.131,127.374,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (72,1,4278,7380,9610,0,7318,314,53,40.7137,113.916,131.424,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (73,1,4399,7588,9940,0,7618,320,58,41.3017,118.702,135.474,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (74,1,4524,7804,10282,0,7918,354,63,41.8897,0,139.524,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (75,1,4652,8025,10635,0,8219,392,68,42.4777,0,143.574,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (76,1,4781,8247,11001,0,8520,432,74,43.0657,0,147.624,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (77,1,4916,8480,11379,0,8822,478,81,43.6537,0,151.674,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (78,1,5052,8715,11770,0,9124,528,88,44.2417,0,155.724,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (79,1,5194,8960,12175,0,9426,582,95,44.8297,0,160.258,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (80,1,5342,9215,12600,0,9729,642,103,45.4177,0,164.924,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (81,1,5492,9474,13033,0,10033,708,112,46.0057,0,168.974,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (82,1,5647,9741,13481,0,10356,782,121,46.5937,0,173.024,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (83,1,5808,11570,13945,0,10673,805,135,47.1817,0,177.074,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (84,1,5971,10300,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (85,1,6141,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (86,1,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (87,1,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (88,1,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (89,1,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (90,1,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (91,1,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (92,1,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (93,1,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (94,1,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (95,1,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (96,1,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (97,1,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (98,1,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (99,1,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (100,1,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (1,2,41,1,1,60,7,1,1,0.746,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (2,2,54,1,1,69,19,3,1,0.7365,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (3,2,69,1,1,79,33,7,1,0.6984,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (4,2,83,1,1,104,66,18,1,1.2138,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (5,2,98,1,1,115,109,19,1,1.8471,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (6,2,115,1,1,126,163,24,1,2.6006,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (7,2,131,1,1,138,208,28,1,3.5412,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (8,2,148,1,1,165,303,32,1,4.1435,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (9,2,166,1,1,178,369,36,1,4.7933,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (10,2,186,1,1,191,460,38,1,5.066,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (11,2,208,1,1,205,526,40,1,5.3387,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (12,2,230,1,1,249,560,42,1,5.6114,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (13,2,253,1,1,264,596,44,1,5.8841,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (14,2,276,1,1,295,630,46,1,6.1568,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (15,2,301,1,1,326,665,48,2,6.8211,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (16,2,325,1,1,357,700,52,2,7.1374,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (17,2,350,1,1,390,734,56,2,7.6355,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (18,2,377,1,1,408,768,58,3,8.1353,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (19,2,404,1,1,456,802,60,3,8.6351,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (20,2,433,1,1,490,836,64,4,9.0674,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (21,2,464,1,1,510,872,68,4,9.3169,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (22,2,498,1,1,545,906,72,5,9.7231,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (23,2,533,1,1,581,940,74,5,10.0761,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (24,2,571,1,1,618,975,78,6,10.4619,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (25,2,610,1,1,655,1008,80,6,10.8234,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (26,2,651,1,1,693,1042,84,6,11.185,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (27,2,690,1,1,732,1078,86,7,11.7126,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (28,2,732,1,1,756,1110,90,7,11.9663,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (29,2,773,1,1,811,1145,94,8,12.352,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (30,2,811,1,1,852,1178,94,8,13.0007,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (31,2,850,1006,1,878,1213,98,9,13.2348,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (32,2,888,1,1,935,1248,100,9,13.6924,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (33,2,928,1,1,963,1281,104,10,13.9511,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (34,2,967,1,1,1007,1316,106,10,14.4142,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (35,2,1009,1,1,1067,1349,110,11,14.7365,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (36,2,1050,1,1,1097,1455,112,11,15.1346,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (37,2,1093,1,1,1142,1567,116,11,15.5816,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (38,2,1135,1,1,1189,1683,120,12,15.9286,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (39,2,1180,1,1,1236,1807,124,12,16.4168,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (40,2,1226,1,1,1283,1937,128,13,16.9294,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (41,2,1268,1,1,1332,2072,132,13,17.8592,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (42,2,1321,1,1,1381,2216,142,15,18.8825,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (43,2,1373,1,1,1432,2367,152,14,20.1126,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (44,2,1426,1,1,1483,2527,166,15,21.6981,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (45,2,1478,1,1,1534,2692,172,15,22.9018,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (46,2,1535,1,1,1587,2749,176,16,23.345,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (47,2,1592,1,1,1640,2802,180,16,23.9542,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (48,2,1650,1,1,1695,2855,184,17,24.401,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (49,2,1710,1,1,1750,2910,188,17,24.9975,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (50,2,1772,1,1,1807,2964,194,18,25.5204,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (51,2,1834,1,1,1864,3017,198,19,26.0047,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (52,2,1897,1,1,1923,3072,202,19,26.6877,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (53,2,1962,1,1,1982,3126,206,20,27.1912,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (54,2,2026,1,1,2041,3178,210,20,27.8506,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (55,2,2091,1,1,2117,3232,214,21,28.3834,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (56,2,2159,1,1,2163,3287,220,21,28.9161,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (57,2,2227,1,1,2241,3340,224,22,29.5702,41.2575,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (58,2,2297,3191,1,2289,3394,228,23,30.1469,45.5251,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (59,2,2369,3314,1,2369,3447,234,23,30.7656,49.7927,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (60,2,2442,3984,1,2434,3748,238,24,31.3842,54.0603,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (61,2,2515,4126,1,2486,4044,244,25,31.9807,58.3279,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (62,2,2590,4274,1,2568,4340,246,26,32.5772,62.4676,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (63,2,2665,4422,1,2620,4637,252,26,33.1737,66.121,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (64,2,2740,4572,1,2705,4933,256,27,33.7702,70.2568,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (65,2,2819,4731,1,2790,5228,262,29,34.3667,74.3252,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (66,2,2899,6906,6116,2846,5523,266,29,34.9632,78.472,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (67,2,2982,5060,1,2933,5821,272,31,35.5597,82.7944,110.698,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (68,2,3067,5233,6986,2991,6116,276,31,36.1562,87.2676,114.869,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (69,2,3153,5409,7984,3080,6412,282,32,36.7527,91.8915,119.04,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (70,2,3240,5589,8982,3155,6708,286,33,37.3492,96.7365,123.212,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (71,2,3330,5744,9291,3231,7007,290,37,37.9457,101.004,127.383,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (72,2,3422,5903,9610,3309,7305,296,40,38.5422,105.272,131.092,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (73,2,3519,6070,9940,3387,7604,302,44,39.1387,109.539,134.908,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (74,2,3619,6243,10282,3466,7903,334,48,39.7352,0,138.836,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (75,2,3722,6420,10635,3561,8204,370,53,40.3317,0,142.878,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (76,2,3825,6602,11001,3643,8503,408,57,40.9282,0,147.038,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (77,2,3933,6784,11379,3725,8803,452,62,41.5247,0,151.319,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (78,2,4042,6972,11770,3809,9104,500,68,42.1212,0,155.724,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (79,2,4155,7167,12175,3893,9405,550,74,42.7177,0,160.258,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (80,2,4274,7373,12600,3994,9706,608,80,43.3142,0,164.924,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (81,2,4394,7581,13033,4081,10007,670,86,43.9107,0,169.095,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (82,2,4518,7794,13481,4169,10253,726,91,44.5072,0,173.266,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (83,2,4646,1,13945,4258,10573,783,98,45.1037,0,177.438,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (84,2,1,1,1,4363,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (85,2,1,1,15498,4454,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (86,2,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (87,2,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (88,2,1,1,16515,4735,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (89,2,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (90,2,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (91,2,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (92,2,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (93,2,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (94,2,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (95,2,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (96,2,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (97,2,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (98,2,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (99,2,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (100,2,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (1,4,42,1,1,0,6,24,1,0.25,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (2,4,55,1,1,0,18,26,1,0.54,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (3,4,71,1,1,0,31,28,1,0.74,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (4,4,86,1,1,0,63,30,1,0.9435,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (5,4,102,1,1,0,102,32,1,1.5,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (6,4,120,1,1,0,152,34,1,2.2,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (7,4,137,1,1,0,212,36,1,3,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (8,4,156,1,1,0,286,38,1,4.3597,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (9,4,176,1,1,0,363,40,1,4.6993,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (10,4,198,1,1,0,443,42,1,4.8281,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (11,4,222,1,1,0,488,44,1,5.1609,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (12,4,247,1,1,0,519,46,1,5.6558,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (13,4,273,1,1,0,553,48,1,6.0221,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (14,4,300,1,1,0,577,50,1,6.6101,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (15,4,328,1,1,0,612,54,2,7.1981,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (16,4,356,1,1,0,645,56,2,7.7861,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (17,4,386,1,1,0,676,60,2,8.3741,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (18,4,417,1,1,0,706,64,3,8.9621,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (19,4,449,1,1,0,738,68,3,9.5501,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (20,4,484,1,1,0,769,70,4,10.1381,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (21,4,521,1,1,0,801,74,4,10.7261,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (22,4,562,1,1,0,833,78,4,11.3141,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (23,4,605,1,1,0,863,80,5,11.9021,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (24,4,651,1,1,0,895,84,6,12.4901,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (25,4,699,1,1,0,926,86,6,13.0781,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (26,4,750,1,1,0,957,90,7,13.6661,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (27,4,800,1,1,0,989,92,7,14.2541,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (28,4,853,1,1,0,1020,96,8,14.8421,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (29,4,905,1,1,0,1051,100,8,15.4301,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (30,4,955,1,1,0,1082,102,9,16.0181,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (31,4,1006,1,1,0,1113,106,9,16.6061,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (32,4,1057,1,1,0,1146,108,10,17.1941,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (33,4,1110,1,1,0,1173,112,10,17.7821,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (34,4,1163,1,1,0,1208,114,11,18.3701,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (35,4,1220,1,1,0,1237,118,11,18.9581,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (36,4,1277,1,1,0,1349,120,12,19.5461,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (37,4,1336,1,1,0,1434,124,12,20.1341,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (38,4,1395,1,1,0,1538,128,13,20.7221,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (39,4,1459,1,1,0,1649,132,13,21.3101,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (40,4,1524,1,1,0,1764,136,14,21.8981,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (41,4,1585,1,1,0,1886,142,15,22.4861,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (42,4,1651,1,1,0,2015,152,15,23.0741,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (43,4,1716,1,1,0,2148,162,16,23.6621,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (44,4,1782,1,1,0,2303,174,16,24.2501,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (45,4,1848,1,1,0,2436,184,17,24.8381,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (46,4,1919,1,1,0,2485,188,17,25.4261,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (47,4,1990,1,1,0,2535,192,18,26.0141,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (48,4,2062,1,1,0,2582,196,19,26.6021,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (49,4,2138,1,1,0,2631,200,19,27.1901,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (50,4,2215,1,1,0,2680,206,20,27.7781,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (51,4,2292,1,1,0,2728,210,20,28.3661,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (52,4,2371,1,1,0,2778,214,21,28.9541,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (53,4,2453,1,1,0,2826,218,22,29.5421,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (54,4,2533,1,1,0,2874,224,22,30.1301,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (55,4,2614,1,1,0,2922,228,23,30.7177,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (56,4,2699,1,1,0,2972,234,23,31.3057,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (57,4,2784,1,1,0,3020,238,24,31.8937,42.1353,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (58,4,2871,3989,1,0,3068,242,25,32.4817,46.9207,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (59,4,2961,4142,1,0,3117,248,25,33.0697,51.7061,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (60,4,3052,4979,1,0,3388,252,26,33.6577,56.4915,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (61,4,3144,5158,1,0,3655,258,28,34.2457,61.2769,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (62,4,3237,5341,1,0,3922,262,30,34.8337,66.0623,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (63,4,3331,5527,1,0,4189,268,32,35.4217,70.8477,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (64,4,3427,5715,1,0,4457,272,33,36.0097,75.6331,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (65,4,3524,5914,1,0,4724,278,35,36.5977,80.4185,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (66,4,3624,6116,1,0,5104,282,37,37.1857,85.2039,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (67,4,3728,6326,1,0,5326,288,39,37.7737,89.9893,111.174,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (68,4,3834,6542,6986,0,5527,292,41,38.3617,94.7747,115.224,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (69,4,3942,6761,7984,0,5795,298,43,38.9497,99.5601,119.274,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (70,4,4050,6986,8982,0,6062,304,44,39.5377,104.346,123.324,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (71,4,4163,7181,9291,0,6332,308,48,40.1257,109.131,127.374,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (72,4,4278,7380,9610,0,6602,314,53,40.7137,113.916,131.424,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (73,4,4399,7580,9940,0,6872,320,58,41.3017,118.702,135.474,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (74,4,4524,1,10282,0,7143,354,63,41.8897,0,139.524,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (75,4,4652,1,10635,0,7415,392,68,42.4777,0,143.574,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (76,4,4781,1,11001,0,7686,432,74,43.0657,0,147.624,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (77,4,4916,1,11379,0,7958,478,81,43.6537,0,151.674,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (78,4,5052,1,11770,0,8230,528,88,44.2417,0,155.724,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (79,4,5194,1,12175,0,8503,582,95,44.8297,0,160.258,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (80,4,5342,1,12600,0,8776,642,103,45.4177,0,164.924,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (81,4,5496,1,13033,0,9068,708,112,46.0057,0,168.974,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (82,4,5647,1,13481,0,9348,782,121,46.5937,0,173.024,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (83,4,5808,1,13945,0,9589,805,135,47.1817,0,177.074,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (84,4,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (85,4,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (86,4,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (87,4,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (88,4,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (89,4,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (90,4,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (91,4,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (92,4,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (93,4,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (94,4,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (95,4,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (96,4,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (97,4,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (98,4,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (99,4,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (100,4,1,1,1,0,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (1,8,40,1,1,120,5,1,10,0.4564,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (2,8,52,1,1,147,16,3,10,0.4564,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (3,8,67,1,1,174,28,7,10,0.7334,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (4,8,81,1,1,202,57,8,11,1.1235,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (5,8,95,1,1,230,93,9,11,1.3456,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (6,8,111,1,1,259,139,10,11,1.9557,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (7,8,126,1,1,289,194,13,11,2.7876,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (8,8,143,1,1,319,265,15,11,3.2334,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (9,8,160,1,1,350,339,16,11,3.7654,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (10,8,178,1,1,382,423,17,12,4.2456,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (11,8,199,1,1,459,447,17,12,4.7654,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (12,8,219,1,1,537,475,18,12,5.0345,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (13,8,241,1,1,601,509,19,12,5.199,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (14,8,263,1,1,710,523,21,12,5.7241,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (15,8,285,1,1,790,559,22,13,6.3298,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (16,8,307,1,1,856,589,24,13,6.6051,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (17,8,330,1,1,938,617,26,13,7.0485,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (18,8,354,1,1,1020,643,27,13,7.4083,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (19,8,379,1,1,1118,674,28,13,7.9334,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (20,8,405,1,1,1202,701,30,14,8.3382,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (21,8,432,1,1,1272,729,32,14,8.5517,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (22,8,463,1,1,1357,759,34,14,8.9102,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (23,8,494,1,1,1443,786,35,14,9.228,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (24,8,528,1,1,1545,815,36,15,9.6818,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (25,8,562,1,1,1633,843,37,15,10.1014,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (26,8,598,1,1,1707,871,39,15,10.3246,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (27,8,633,1,1,1812,900,40,15,10.804,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (28,8,669,1,1,1977,928,42,15,11.0214,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (29,8,704,1,1,2068,957,44,16,11.3608,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (30,8,737,1,1,2175,984,44,16,11.9607,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (31,8,770,1,1,2253,1012,46,16,12.16,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (32,8,802,1,1,2362,1042,47,16,12.5746,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (33,8,835,1,1,2457,1065,49,17,12.7966,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (34,8,867,1,1,2553,1098,50,17,13.2162,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (35,8,902,1,1,2680,1124,52,17,13.497,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (36,8,935,1,1,2763,1241,53,18,13.8566,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (37,8,970,1,1,2861,1300,54,18,14.367,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (38,8,1004,1,1,2975,1391,56,18,14.6707,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (39,8,1040,1,1,3075,1489,58,18,15.1049,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (40,8,1077,1,1,3191,1590,60,19,15.5617,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (41,8,1110,1,1,3293,1697,62,19,16.4044,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (42,8,1156,1,1,3471,1811,67,19,17.3076,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (43,8,1201,1,1,3575,1926,71,19,18.5165,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (44,8,1247,1,1,3680,2078,78,20,19.9224,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (45,8,1294,1,1,3801,2177,81,20,21.0097,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (46,8,1343,1,1,3923,2220,83,20,21.4023,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (47,8,1393,1,1,4031,2265,85,21,21.9484,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (48,8,1443,1,1,4140,2307,87,21,22.3444,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (49,8,1497,1,1,4281,2349,89,21,22.8788,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (50,8,1551,1,1,4393,2393,91,22,23.4508,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (51,8,1604,1,1,4506,2437,93,22,23.8815,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (52,8,1660,1,1,4650,2481,95,22,24.4958,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (53,8,1717,1,1,4765,2524,97,23,24.9442,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (54,8,1773,1,1,4896,2567,99,23,25.5368,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (55,8,1830,1,1,5013,2609,101,23,26.079,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (56,8,1889,1,1,5206,2654,104,24,26.4791,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (57,8,1949,1,1,5340,2698,106,24,27.0667,39.5236,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (58,8,2010,2793,1,5461,2740,107,24,27.6972,43.1021,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (59,8,2073,2899,1,5598,2784,110,25,28.1686,46.5379,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (60,8,2136,3484,1,5751,3025,112,25,28.7983,50.045,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (61,8,2201,3611,1,5875,3263,115,25,29.2976,53.4807,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (62,8,2266,3739,1,6015,3500,116,25,29.7969,57.2713,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (63,8,2332,3870,1,6156,3736,119,26,30.2962,60.577,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (64,8,2399,4000,1,6229,3977,121,26,30.7955,64.3364,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (65,8,2467,4731,4731,6443,4214,124,26,31.2948,68.0244,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (66,8,2552,4892,4892,6588,4460,125,27,31.7941,72.0499,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (67,8,2610,5060,1,6749,4710,128,27,32.2934,75.9676,87.7106,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (68,8,2684,4580,5588,6882,4928,130,27,32.7927,79.9198,96.6868,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (69,8,2759,4733,6387,7031,5167,133,28,33.292,83.8005,105.591,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (70,8,2835,4890,7185,7196,5404,135,28,33.7913,87.7526,114.496,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (71,8,2914,5027,7432,7332,5645,137,31,34.2906,91.7048,117.829,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (72,8,2995,5166,7688,7500,5886,140,34,34.7899,95.5855,121.259,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (73,8,3098,5311,7952,7654,6126,143,37,35.2892,99.4662,124.79,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (74,8,3186,1,8225,7809,6368,158,41,35.7885,0,128.423,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (75,8,3256,5617,8508,7981,6610,175,45,36.2878,0,132.162,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (76,8,3367,1,8800,8139,6851,193,49,36.7871,0,136.01,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (77,8,3462,1,9103,8313,7094,214,54,37.2864,0,139.97,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (78,8,3558,1,9416,8459,7335,236,58,37.7857,0,144.045,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (79,8,3658,1,9740,8636,7579,260,64,38.285,0,148.239,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (80,8,3739,1,10080,8814,7822,289,69,38.7843,0,152.412,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (81,8,3870,1,10486,8979,8102,304,74,39.2836,0,157.584,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (82,8,3977,1,10784,9160,8340,326,79,39.7829,0,162.257,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (83,8,4090,1,11156,9328,8505,343,84,40.2822,0,167.286,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (84,8,1,1,1,9512,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (85,8,4299,1,1,9697,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (86,8,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (87,8,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (88,8,1,1,1,10232,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (89,8,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (90,8,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (91,8,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (92,8,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (93,8,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (94,8,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (95,8,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (96,8,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (97,8,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (98,8,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (99,8,1,1,1,1,1,0,0,0,0,0,NULL);
insert  into `creature_classlevelstats`(`level`,`class`,`basehp0`,`basehp1`,`basehp2`,`basemana`,`basearmor`,`attackpower`,`rangedattackpower`,`damage_base`,`damage_exp1`,`damage_exp2`,`comment`) values (100,8,1,1,1,1,1,0,0,0,0,0,NULL);

/* #copy values from TrinityCore DB 
UPDATE world.creature_template sct 
JOIN trinityworld.creature_template 2ct ON 2ct.entry = sct.entry
SET sct.exp = 2ct.exp, 
sct.unit_class = 2ct.unit_class,
sct.HealthModifier = 2ct.HealthModifier, 
sct.ManaModifier = 2ct.ManaModifier, 
sct.ArmorModifier = 2ct.ArmorModifier, 
sct.DamageModifier = 2ct.DamageModifier,
sct.ExperienceModifier = 2ct.ExperienceModifier,
sct.BaseVariance = 2ct.BaseVariance,
sct.RangeVariance = 2ct.RangeVariance; */

#fix some wrong expansions
UPDATE creature_template 
JOIN creature_classlevelstats ON level = minlevel AND class = unit_class AND exp = 1
SET exp = 0 
WHERE (exp = 1 AND basehp1 = 1) OR (exp = 2 and basehp2 = 1);

UPDATE creature_template set exp = 0 where entry = 10184;

/*
##HP DIFF

#check HP differences with old world
SELECT ct.entry, ct.minlevel, ct.exp, ct.name, cls.basehp1, ct.HealthModifier, ROUND(cls.basehp1*ct.HealthModifier) AS result, cto.minhealth
FROM creature_classlevelstats  cls
JOIN creature_template ct ON LEVEL = ct.minlevel AND cls.class = ct.unit_class
JOIN oldworld.creature_template cto ON cto.entry = ct.entry

#adapt
UPDATE creature_template ct
JOIN creature_classlevelstats cls ON level = ct.minlevel AND cls.class = ct.unit_class AND ct.exp = 0
JOIN oldworld.creature_template cto ON cto.entry = ct.entry
SET ct.HealthModifier = cto.minhealth / cls.basehp0;

UPDATE creature_template ct
JOIN creature_classlevelstats cls ON level = ct.minlevel AND cls.class = ct.unit_class AND ct.exp = 1
JOIN oldworld.creature_template cto ON cto.entry = ct.entry
SET ct.HealthModifier = cto.minhealth / cls.basehp1;

UPDATE creature_template ct
JOIN creature_classlevelstats cls ON level = ct.minlevel AND cls.class = ct.unit_class AND ct.exp = 2
JOIN oldworld.creature_template cto ON cto.entry = ct.entry
SET ct.HealthModifier = cto.minhealth / cls.basehp2;

#MANA DIFF

#check
SELECT ct.entry, ct.unit_class, ct.minlevel, ct.name, cls.basemana, ct.ManaModifier, ROUND(cls.basemana*ct.ManaModifier) AS result, cto.minmana
FROM creature_classlevelstats  cls
JOIN creature_template ct ON LEVEL = ct.minlevel AND cls.class = ct.unit_class
JOIN oldworld.creature_template cto ON cto.entry = ct.entry

#update
UPDATE creature_classlevelstats  cls
JOIN creature_template ct ON LEVEL = ct.minlevel AND cls.class = ct.unit_class
JOIN oldworld.creature_template cto ON cto.entry = ct.entry
SET ct.ManaModifier = cto.minmana / cls.basemana;

##DMG DIFF

#check
SELECT ct.entry, ct.minlevel, ct.exp, ct.name, cls.damage_exp1, ct.DamageModifier, ct.BaseVariance, cto.mindmg, cto.maxdmg
FROM creature_classlevelstats  cls
JOIN creature_template ct ON LEVEL = ct.minlevel AND cls.class = ct.unit_class and ct.exp = 1
JOIN oldworld.creature_template cto ON cto.entry = ct.entry

#adapt variance
UPDATE creature_template ct
JOIN creature_classlevelstats cls ON LEVEL = ct.minlevel AND cls.class = ct.unit_class
JOIN oldworld.creature_template cto ON cto.entry = ct.entry
SET ct.BaseVariance = (cto.maxdmg / cto.mindmg) - 1;

#update expansion 0 damage
UPDATE creature_template ct
JOIN creature_classlevelstats cls ON cls.level = ct.minlevel AND cls.class = ct.unit_class AND ct.exp = 0
JOIN oldworld.creature_template cto ON cto.entry = ct.entry
SET ct.DamageModifier = cto.mindmg*4/3 / (cls.damage_base + (cls.attackpower / 14 * ct.BaseAttackTime/1000));

#update expansion 1 damage
UPDATE creature_template ct
JOIN creature_classlevelstats cls ON cls.level = ct.minlevel AND cls.class = ct.unit_class and ct.exp = 1
JOIN oldworld.creature_template cto ON cto.entry = ct.entry
SET ct.DamageModifier = cto.mindmg*4/3 / (cls.damage_exp1 + (cls.attackpower / 14 * ct.BaseAttackTime/1000));

#update expansion 2 damage
UPDATE creature_template ct
JOIN creature_classlevelstats cls ON cls.level = ct.minlevel AND cls.class = ct.unit_class AND ct.exp = 2
JOIN oldworld.creature_template cto ON cto.entry = ct.entry
SET ct.DamageModifier = cto.mindmg*4/3 / (cls.damage_exp2 + (cls.attackpower / 14 * ct.BaseAttackTime/1000));

##ARMOR DIFF

#check
 SELECT ct.entry, ct.exp, ct.name, ct.ArmorModifier, cto.armor, cls.basearmor, ct.ArmorModifier * cls.basearmor AS result
FROM creature_classlevelstats  cls
JOIN creature_template ct ON LEVEL = ct.minlevel AND cls.class = ct.unit_class
JOIN oldworld.creature_template cto ON cto.entry = ct.entry 

#update
UPDATE creature_classlevelstats  cls
JOIN creature_template ct ON LEVEL = ct.minlevel AND cls.class = ct.unit_class
JOIN oldworld.creature_template cto ON cto.entry = ct.entry
SET ct.ArmorModifier = cto.armor / cls.basearmor;

##
*/