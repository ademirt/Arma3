/*
Author: SENSEI

Start date: May 2014

Last modified: 10/3/2015

Description: Dynamic Combat Generator

To Do:
	add fob specific tasks
	add water tasks

Known Issues:
	ACE_server.pbo overwrites ACE variables set by DCG. Recommend not to use ACE_server.pbo
	ACE interaction menu may not initialize at mission start, ACE3 Github issue #1171

License:
	Copyright 2015 Nicholas Clark (SENSEI). All rights reserved.
	This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/.
__________________________________________________________________*/
enableSaving [false, false];
enableSentences false;
enableRadio false;

[] execVM "bon_recruit_units\init.sqf";
execVM "scripts\SEN_arsenal.sqf";