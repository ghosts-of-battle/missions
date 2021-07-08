params ["_obj","_radius","_healPerSleep","_sleepTime", "_damage"];

    while {alive _obj} do
    {
        {
            if (alive _x) then
            {
                _damage = damage _x;
                _damage = _damage - _healPerSleep;
                if (_damage < 0) then
                {
                    _damage = 0;
                };
                _x setDamage _damage;
            };
        }
        forEach ((getPos _obj) nearEntities [["Man"], _radius]);
        sleep _sleepTime;
    };