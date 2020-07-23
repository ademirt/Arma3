/*	VERSION: 0.8
	AUTHOR: Phronk
	CONTRIBUTIONS:
		1. BadBenson helped with private variables
		2. DirtySanchez reorganized AFAR and improved security
		3. Larrow helped improve radio keybind detection (inputAction)

	TESTERS:
		1. BadBenson
		2. Blachheart_Six
		3. BruceAlmightyy
		4. KingCarter
		5. Limey
		6. Sjakal
		7. Statsbacktozero
		8. PRYMSUSPEC
		
TIP: To assign a unit as an RTO (Has access to Support channel), add this to their init:  this setUnitTrait["RTO",true,true];

*///CONFIGURATIONS:
//CHANNEL PERMISSIONS
r_sCH=[FALSE,TRUE];//Support Channel Allow Chat/Voice  				>> Default: [FALSE,TRUE]
r_cCH=[TRUE,TRUE];//Command Channel Allow Chat/Voice  				>> Default: [TRUE,TRUE]
r_grCH=[FALSE,TRUE];//Group Channel Allow Chat/Voice  				>> Default: [FALSE,TRUE]
r_vCH=[TRUE,TRUE];//Vehicle Channel Allow Chat/Voice  				>> Default: [TRUE,TRUE]
r_dCH=[FALSE,TRUE];//Direct Channel Allow Chat/Voice  				>> Default: [FALSE,TRUE]

//MAX RADIO RANGES
r_SRmax=2000;//Maximum radio range for SHORT RANGE radio			>> Default: 2000
r_LRmax=6000;//Maximum radio range for LONG RANGE radio				>> Default: 6000

//COSMETICS
r_3DR=TRUE;//3D radio pop-up when talking	  |FALSE=Off ~ TRUE=On	>> Default: TRUE
r_Anm=FALSE;//Animation when talking		  |FALSE=Off ~ TRUE=On	>> Default: FALSE

//ALERT NEARBY AI WHEN TALKING
r_alertOn=TRUE;//Talking alerts nearby enemies|FALSE=Off ~ TRUE=On	>> Default: TRUE

r_CH=[0,1,2,3,4,6,7,8];//<------Don't edit this!