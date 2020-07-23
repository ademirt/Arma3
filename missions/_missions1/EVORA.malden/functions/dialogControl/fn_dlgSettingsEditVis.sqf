disableSerialization;

scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _ctrlEdit = param [0,controlNull,[controlNull]];
private _charEdit = param [1,0,[0,configNull]];
private _display = ctrlParent _ctrlEdit;

if (isNull _display) exitWith {};

private _dlgSettings		= "EVOR_dlg_settings";
private _cfgSettings		= missionConfigFile >> _dlgSettings;
private _cfgSettingsCtrls	= _cfgSettings >> "controls";
private _ctrlEditOverall	= _display displayCtrl getNumber (_cfgSettingsCtrls >> "editOverall" >> "idc");
private _ctrlEditObject		= _display displayCtrl getNumber (_cfgSettingsCtrls >> "editObject" >> "idc");
private _ctrlEditShadow		= _display displayCtrl getNumber (_cfgSettingsCtrls >> "editShadow" >> "idc");

if (_charEdit isEqualType 0) then {	// Character entered
	private _allowedStrings = toArray "0123456789";
	private _string = (toArray ctrlText _ctrlEdit) + [_charEdit];

	if (_string findIf {!(_x in _allowedStrings)} < 0) then {
		private _value = parseNumber toString _string;
		switch _ctrlEdit do {
			case _ctrlEditOverall: {
				private _slider = _display displayCtrl getNumber (_cfgSettingsCtrls >> "sliderOverall" >> "idc");
				private _range = sliderRange _slider;
				_value = (_value min (_range select 1)) max (_range select 0);
				setViewDistance _value;
				_slider sliderSetPosition _value;
			};
			case _ctrlEditObject: {
				private _slider = _display displayCtrl getNumber (_cfgSettingsCtrls >> "sliderObject" >> "idc");
				private _range = sliderRange _slider;
				_value = (_value min (_range select 1)) max (_range select 0);
				setObjectViewDistance _value;
				_slider sliderSetPosition _value;
			};
			case _ctrlEditShadow: {
				private _slider = _display displayCtrl getNumber (_cfgSettingsCtrls >> "sliderShadow" >> "idc");
				private _range = sliderRange _slider;
				_value = (_value min (_range select 1)) max (_range select 0);
				setObjectViewDistance [getObjectViewDistance select 0,_value];
				_slider sliderSetPosition _value;
			};
		};
	} else {
		_ctrlEdit ctrlSetText "";
	};
} else {	// Init
	private _distance = switch _ctrlEdit do {
		case _ctrlEditOverall:	{viewDistance};
		case _ctrlEditObject:	{getObjectViewDistance select 0};
		case _ctrlEditShadow:	{getObjectViewDistance select 1};
		default {0};
	};
	_ctrlEdit ctrlSetText str round _distance;
};