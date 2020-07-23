private _PLR=_this;private _nAI=_PLR nearEntities["Man",9];
if(count _nAI>0)then{
{if((!isPlayer _x)&&(side _x!=side _PLR)&&(side _x!=CIVILIAN)&&(isNull objectParent _x))then{
if(_x knowsAbout _PLR<=1.5)then{[_x,[_PLR,1.5]]remoteExec["reveal",2];};};}forEach _nAI;};