disableSerialization;

scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _ctrlSlider = param [0,controlNull,[controlNull]];
private _posSlider = param [1,0,[0,configNull]];
private _display = ctrlParent _ctrlSlider;

if (isNull _display) exitWith {};

private _dlgSettings		= "EVOR_dlg_settings";
private _cfgSettings		= missionConfigFile >> _dlgSettings;
private _cfgSettingsCtrls	= _cfgSettings >> "controls";
private _ctrlSliderOverall	= _display displayCtrl getNumber (_cfgSettingsCtrls >> "sliderOverall" >> "idc");
private _ctrlSliderObject	= _display displayCtrl getNumber (_cfgSettingsCtrls >> "sliderObject" >> "idc");
private _ctrlSliderShadow	= _display displayCtrl getNumber (_cfgSettingsCtrls >> "sliderShadow" >> "idc");

if (_posSlider isEqualType 0) then {	// Pos changed
	switch  _ctrlSlider do {
		case _ctrlSliderOverall: {
			private _edit = _display displayCtrl getNumber (_cfgSettingsCtrls >> "editOverall" >> "idc");
			setViewDistance _posSlider;
			_edit ctrlSetText str round _posSlider;
		};
		case _ctrlSliderObject: {
			private _edit = _display displayCtrl getNumber (_cfgSettingsCtrls >> "editObject" >> "idc");
			setObjectViewDistance _posSlider;
			_edit ctrlSetText str round _posSlider;
		};
		case _ctrlSliderShadow: {
			private _edit = _display displayCtrl getNumber (_cfgSettingsCtrls >> "editShadow" >> "idc");
			setObjectViewDistance [getObjectViewDistance select 0,_posSlider];
			_edit ctrlSetText str round _posSlider;
		};
	};
} else {	// Init
	switch _ctrlSlider do {
		case _ctrlSliderOverall: {
			_ctrlSlider sliderSetRange [500,10000];
			_ctrlSlider sliderSetPosition (viewDistance);
		};
		case _ctrlSliderObject: {
			_ctrlSlider sliderSetRange [500,5000];
			_ctrlSlider sliderSetPosition (getObjectViewDistance select 0);
		};
		case _ctrlSliderShadow: {
			_ctrlSlider sliderSetRange [0,200];
			_ctrlSlider sliderSetPosition (getObjectViewDistance select 1);
		};
	};
};