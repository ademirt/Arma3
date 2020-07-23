/*waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)displayRemoveEventHandler["KeyUp",zkpOn];systemChat"zkpOn EH removed";

waitUntil{(!isNull(findDisplay 312))};
zkpOff=(findDisplay 46)displayAddEventHandler["KeyDown",{systemChat"Curator interface has closed";
}];

//Zeus keyDowns/Ups
zblockVON=(findDisplay 312)displayAddEventHandler["KeyDown",{_this call noVON}];
zkpCin=(findDisplay 312)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkCommand"">0))then{call C_In;};"];
zkpGin=(findDisplay 312)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkGroup"">0))then{call G_In;};"];
zkpVin=(findDisplay 312)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkVehicle"">0))then{call V_In;};"];
zkpDin=(findDisplay 312)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkDirect"">0))then{call D_In;};"];
zkpSin=(findDisplay 312)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkSide"">0))then{call S_In;};"];

zkpCout=(findDisplay 312)displayAddEventHandler["KeyUp","if(inputAction""CopyVersion"">2)then{};"];
zkpGout=(findDisplay 312)displayAddEventHandler["KeyUp","if(inputAction""CopyVersion"">2)then{};"];
zkpVout=(findDisplay 312)displayAddEventHandler["KeyUp","if(inputAction""CopyVersion"">2)then{};"];
zkpDout=(findDisplay 312)displayAddEventHandler["KeyUp","if(inputAction""CopyVersion"">2)then{};"];
zkpSout=(findDisplay 312)displayAddEventHandler["KeyUp","if(inputAction""CopyVersion"">2)then{};"];

//