scriptName "EVOR_fnc_objQueue";
if (!isServer) exitWith {};

private _nTotal	= 3 max param [0,10,[0]];
private _cAirf	= param [1,0.1,[0]];
private _objectives = [] call (compileFinal preprocessFileLineNumbers "data\list_Objectives.sqf");
private _objectiveQueue = [];
private _obj = [];

private _nNear		= (floor (0.2*_nTotal)) min count (_objectives select 0);
private _nMedium	= (floor (0.3*_nTotal)) min count (_objectives select 1);
private _nFinish	= (ceil (0.1*_nTotal)) min count (_objectives select 3);
private _nFar		= (_nTotal-_nNear-_nMedium-_nFinish-1) min count (_objectives select 2);

private _maxDiff	= count EVOR_list_ObjectiveUnits - 1;

// Near objectives first, difficulty increases linearily 0->1
for "_i" from 1 to _nNear do {
	_obj = (_objectives select 0) deleteAt floor random count (_objectives select 0);
	_obj append [round ((_i-1)/(1 max (_nNear-1))),false];
	_objectiveQueue pushBack _obj;
};

// Then one airfield objective at difficulty 2
if ((_objectives select 4) isEqualTo []) then {
	_obj = (_objectives select 1) deleteAt floor random count (_objectives select 1);
} else {
	_obj = (_objectives select 4) deleteAt floor random count (_objectives select 4);
};
_obj append [1,false];
_objectiveQueue pushBack _obj;

// Medium objectives, difficulty is 1<>max difficulty
for "_i" from 1 to _nMedium do {
	if ((random 1 > _cAirf) or {(_objectives select 4) isEqualTo []}) then {
		_obj = (_objectives select 1) deleteAt floor random count (_objectives select 1);
	} else {
		_obj = (_objectives select 4) deleteAt floor random count (_objectives select 4);
	};
	_obj append [1+floor random _maxDiff,false];
	_objectiveQueue pushBack _obj;
};

// Far objectives, difficulty is 1<>max difficulty
for "_i" from 1 to _nFar do {
	if ((random 1 > _cAirf) or {(_objectives select 4) isEqualTo []}) then {
		_obj = (_objectives select 2) deleteAt floor random count (_objectives select 2);
	} else {
		_obj = (_objectives select 4) deleteAt floor random count (_objectives select 4);
	};
	_obj append [1+floor random _maxDiff,false];
	_objectiveQueue pushBack _obj;
};

// Finishing objectives, difficulty is max difficulty
for "_i" from 1 to _nFinish do {
	_obj = (_objectives select 3) deleteAt floor random count (_objectives select 3);
	_obj append [_maxDiff,false];
	_objectiveQueue pushBack _obj;
};

_objectiveQueue;