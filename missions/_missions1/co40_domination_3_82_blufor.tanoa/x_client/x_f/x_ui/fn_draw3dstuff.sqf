// by Xeno
//#define __DEBUG__
#define THIS_FILE "fn_draw3dstuff.sqf"
#include "..\..\..\x_setup.sqf"

//__scale3 +5
//__scale4 +1.5
//__scale5 +2.5

private _pos_cam = positionCameraToWorld [0,0,0];

{
	private _obj = _x select 0;
	private _distp = _pos_cam distance2D _obj;
	if (_distp < 200) then {
		private _pos = getPosASL _obj;
		private _scale = 0.033 - (_distp / 9000);
		_pos set [2, (_pos select 2) + (_x select 2) + (_distp * 0.05)];
		private _cwt = _obj getVariable ["d_curreptime" , -1];
		if (_cwt == -1) then {
			drawIcon3D ["#(argb,8,8,3)color(0,0,0,0)", [0, 0, 1, 1 - (_distp / 200)], ASLToAGL _pos, 1, 1, 0, _x select 1, 1, _scale, "RobotoCondensed"];
		} else {
			drawIcon3D ["#(argb,8,8,3)color(0,0,0,0)", [0, 0, 1, _alpha], ASLToAGL _pos, 1, 1, 0, format [d_d3d_locs4a, round (_cwt - time)], 1, _scale, "RobotoCondensed"];
		};
	};
	false
} count d_3draw_ar;

{
	private _box = _x select 0;
	if (!isNull _box) then {
		private _distp = _pos_cam distance _box;
		if (_distp < 80) then {
			//private _pos = getPosATL _box;
			private _pos = getPosASL _box;
			private _scale = 0.033 - (_distp / 9000);
			_pos set [2, (_pos select 2) + 1.5 + (_distp * 0.05)];
			private _col = _x select 1;
			_col set [3, 1 - (_distp / 200)];
			drawIcon3D ["#(argb,8,8,3)color(0,0,0,0)", _col, ASLToAGL _pos, 1, 1, 0, _x select 2, 1, _scale, "RobotoCondensed"];
		};
	};
	false
} count d_all_p_a_boxes;

{
	if (alive _x) then {
		private _distp = _pos_cam distance _x;
		if (_distp < 150) then {
			private _pos = visiblePositionASL _x;
			private _scale = 0.033 - (_distp / 9000);
			_pos set [2, (_pos select 2) + 5 + (_distp * 0.05)];
			drawIcon3D ["#(argb,8,8,3)color(0,0,0,0)", [0, 0, 1, 1 - (_distp / 200)], ASLToAGL _pos, 1, 1, 0, format ["MHQ %1", _x getVariable "d_ma_text"], 1, _scale, "RobotoCondensed"];
		};
	};
	false
} count d_mhq_3ddraw;