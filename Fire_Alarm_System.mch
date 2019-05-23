/* Fire_Alarm_System
 * Authors: Álvaro Costa, Carlos Freitas, Paulo Silva
 * Creation date: 18/05/19
 */
 
// TODO Define sets and variables for input (smoke and heat detectors, manual call points, sprinklers) and output devices (sirens, bells, emergency lights, door holder relays)
MACHINE
    Fire_Alarm_System
SETS
    SYSTEM_STATES = {STATE_ON, STATE_OFF, STATE_DEFECT};
    SYSTEM_STATUSES = {STATUS_NORMAL, STATUS_PREALARM, STATUS_ALARM};
    POWER_SUPPLIES = {AC_POWER, DC_POWER};
    PERSON;
    ACTION = {ACTION_TURN_ON, ACTION_TURN_OFF}
    SENSOR = {SENSOR_ON, SENSOR_OFF}
VARIABLES
    system_state, system_status, power_supply, on_fire, panel_events_log,sensors
INVARIANT
    system_state : SYSTEM_STATES &
    system_status : SYSTEM_STATUSES &
    power_supply : POWER_SUPPLIES &
    on_fire : BOOL &
    panel_events_log : seq(PERSON*ACTION) &
    sensors : SENSOR
INITIALISATION
    system_state := STATE_OFF ||
    system_status := STATUS_ALARM ||
    power_supply := AC_POWER ||
    on_fire := FALSE ||
    panel_events_log := []
OPERATIONS
    ans <-- control_panel_info =
    PRE
        ans : SYSTEM_STATES*(SYSTEM_STATUSES*POWER_SUPPLIES)
    THEN
        ans := (system_state |-> (system_status |-> power_supply))
    END;
    
    turn_on_system(person) =
    PRE
        system_state = STATE_OFF &
        person : PERSON
    THEN
        // TODO Check for components failures or danger on start.
        system_state := STATE_ON ||
        system_status := STATUS_NORMAL ||
        panel_events_log := (person |-> ACTION_TURN_ON) -> panel_events_log
    END;
    
    turn_off_system(person) =
    PRE
        system_state = STATE_ON &
        person : PERSON
    THEN
        // TODO Reset whole system to default state.
        system_state := STATE_OFF ||
        system_status := STATUS_ALARM ||
        power_supply := AC_POWER ||
        panel_events_log := (person |-> ACTION_TURN_OFF) -> panel_events_log
    END
    
    system_statuses_normal(sensor) = 
    PRE
       system_state = STATE_ON &
       sensor : SENSOR &
       on_fire : FALSE
    THEN
        //Eu coloquei um sensor so, porque eu nao tinha certeza de quantos iriam ser.
        IF sensor = SENSOR_ON THEN
        BEGIN    
        system_status := STATUS_NORMAL
        END;
    END;
    
END
