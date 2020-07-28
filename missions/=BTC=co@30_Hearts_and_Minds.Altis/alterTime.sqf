_setDaySpeedFnc =
{
	setTimeMultiplier 7;
	waitUntil
	{
		_hour = (date select 3);
		sleep 5;
		if (_hour == _sunSetHour) exitWith {true; call _setNightSpeedFnc;};
		false;				
	};
};

_setNightSpeedFnc =
{
	setTimeMultiplier 18;
	waitUntil
	{
		_hour = (date select 3);
		sleep 5;
		if (_hour == _sunRiseHour) exitWith {true; call _setDaySpeedFnc;};
		false;		
	};
};

_sunRiseSet = date call BIS_fnc_sunriseSunsetTime;
_sunRiseHour = round (_sunRiseSet select 0);
_sunSetHour = round (_sunRiseSet select 1);

call _setDaySpeedFnc;