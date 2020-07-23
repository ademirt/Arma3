_unit = _this select 0;
_debug = _this select 1;

private ["_grid_size"];
disableserialization;

openMap [true, false];
WaitUntil {visibleMap};

_Map_display = findDisplay 12;
_map_cntrl = _Map_display displayCtrl 51;
// Temporarily zoom out as much as possible and measure the screen.
_map_cntrl ctrlMapAnimAdd [0, 1000, [9999999999, 9999999999]];
ctrlMapAnimCommit _map_cntrl;
waitUntil {ctrlMapAnimDone _map_cntrl};
_zoom_max = ctrlMapScale _map_cntrl;
_limit = _map_cntrl ctrlMapScreenToWorld [0.5, 0.5];
_x_max = _limit select 0;
_y_max = _limit select 1;

_top_right = [_x_max,_y_max,0];
_top_left = [0,_y_max,1];
_btm_left = [0,0,0];
_btm_right = [_x_max,0,0];

_map_center = [0.5*(_limit select 0),0.5*(_limit select 1)];

_cfg=configFile>>"CfgWorlds">>worldName>>"Grid";
_grid_size_y =getNumber(_cfg>>"Zoom1">>"stepX");
_grid_size_x =getNumber(_cfg>>"Zoom1">>"stepY");


_grid_size = abs(_grid_size_y);
if (_grid_size_y < 100) then {
_grid_size = abs(_grid_size_y*_grid_size_x);
}else{_grid_size = abs(_grid_size_y)};

_w = _top_right distance _top_left;
_h = _top_right distance _btm_right;

_map_width = _limit select 0;
_map_height = _limit select 1;

_Map_Area_Grids = (_map_width/_grid_size)*(_map_height/_grid_size);
_Map_Area_km = (_map_width/1000)*(_map_height/1000);


if (_debug) then {
_m = createmarker ["MapSize",_map_center];
_m setmarkerShape "RECTANGLE";
_m setmarkerSize [_map_width /2,_map_height/2];
_m setmarkerAlpha 0.15;
_m setmarkercolor "ColorRed";

_m = createmarker ["MapWNote",[-150,(_map_center select 0)]];
_m setmarkerText format["Delta X: %1 km",(_x_max/1000)];
_m setmarkersize [0,0];
_m setmarkerType "Dot";
_m setmarkercolor "Colorblack";

_m = createmarker ["MapLNote",[(_map_center select 1),-150]];
_m setmarkerText format ["Delta Y: %1 km",(_y_max/1000)];
_m setmarkersize [0,0];
_m setmarkerType "Dot";
_m setmarkercolor "Colorblack";

_m = createmarker ["MapSizeNote",_map_center];
_m setmarkerText format ["(Map Size: %1 sq km)",_Map_Area_km];
_m setmarkersize [0,0];
_m setmarkerType "Dot";
_m setmarkercolor "Colorblack";
};

_mapsize = _Map_Area_km;

WaitUntil {!isNil "_mapsize"};

_Size_stndrd = 235.93;
_zoom_stndrd = 0.05;

private ["_zoom","_mltplr"];

_add = true;
_percnt = (_mapsize/_Size_stndrd);
if (_percnt > 1) then {_percnt = _percnt mod 1;_add = false};
_percntof = 1 - (_percnt);
_zoom_dif = _percntof*_zoom_stndrd;
if !(_add) then {
_zoom = _zoom_stndrd - _zoom_dif;
}else{
_zoom = _zoom_dif + _zoom_stndrd;
};

if (_zoom > 0.095) then {
_zoom = 0.25
}else{
if (_zoom == 0) then {
_zoom = _zoom + _zoom_stndrd
}else{
if (_zoom < 0) then {_zoom = 0};
};
};
JTK_HALO_Min_GPS_Zoom = _zoom;
JTK_MapCenter = _map_center;

//openMap [false, false]; 