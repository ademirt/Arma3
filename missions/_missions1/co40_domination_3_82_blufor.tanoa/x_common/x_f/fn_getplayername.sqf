// by Xeno
//#define __DEBUG__
#define THIS_FILE "fn_getplayername.sqf"
#include "..\..\x_setup.sqf"

private _np = (param [0]) getVariable "d_pl_name_orig";
if (isNil "_np") then {
	_np = (name (param [0])) splitString """'" joinString "";
	if !(_np isEqualTo "Error: No unit") then {
		(param [0]) setVariable ["d_pl_name_orig", _np];
	};
};
_np