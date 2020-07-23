#include "\A3XAI\globaldefines.hpp"

if (isNull _this) exitWith {};

_this addEventHandler ["Killed","_this call A3XAI_handleDeathEvent;"];
_this addEventHandler ["HandleDamage","_this call A3XAI_handleDamageUnit;"];
//_this addEventHandler ["Hit","(_this select 1) addRating -10000;"];//teste
_this addEventHandler ["Hit", {Null = _this spawn xAI_hit;}];

true