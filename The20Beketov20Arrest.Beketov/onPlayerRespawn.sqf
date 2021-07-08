_unit = _this select 0;
waitUntil {_unit == player};

if (alive TRUCK1) then {
  _unit moveInCargo (TRUCK1);
};

if (alive TRUCK2) then {
  _unit moveInCargo (TRUCK2);
};

if (alive TRUCK3) then {
  _unit moveInCargo (TRUCK3);
};

if (alive TRUCK4) then {
  _unit moveInCargo (TRUCK4);
};

if (alive CAR1) then {
  _unit moveInCargo (CAR1);
};

if (alive CAR2) then {
  _unit moveInCargo (CAR2);
};

if (alive CAR3) then {
  _unit moveInCargo (CAR3);
};