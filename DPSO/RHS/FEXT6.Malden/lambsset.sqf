if ((side _this == CIVILIAN) and (!isPlayer _this)) then {
  setVariable["dangerAIEnabled",FALSE,TRUE]}}forEach allUnits;
};