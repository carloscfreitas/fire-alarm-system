/* Fire_Alarm_System
 * Authors: Álvaro Costa, Carlos Freitas, Paulo Silva
 * Creation date: 18/05/19
 */
 
// Define sets and variables for output devices (sirens, bells, emergency lights, door holder relays)
MACHINE
    Fire_Alarm_System
SETS
    SYSTEMS = {ALARM_SYSTEM};
    SYSTEM_STATES = {STATE_OFF, STATE_NORMAL, STATE_DEFECT, STATE_PREALARM, STATE_ALARM};
    POWER_SUPPLIES = {AC_POWER, DC_POWER};
    PERSON;
    ACTION = {ACTION_TURN_ON_SYS, ACTION_TURN_OFF_SYS, ACTION_TURN_ON_CMP, ACTION_TURN_OFF_CMP};
    // Add states for when danger has been detected.
    COMPONENT_STATUSES = {STATUS_ON, STATUS_OFF, STATUS_DEFECT};
    COMPONENTS = {
        // Smoke Detectors
        CMP_SD_1, CMP_SD_2, CMP_SD_3, CMP_SD_4, CMP_SD_5,
        // Manual Call Points
        CMP_MCP_1, CMP_MCP_2, CMP_MCP_3, CMP_MCP_4, CMP_MCP_5,
        // Sprinklers
        CMP_SPKR_1, CMP_SPKR_2, CMP_SPKR_3, CMP_SPKR_4, CMP_SPKR_5
    }
VARIABLES
    system_state, power_supply, panel_events_log, components
INVARIANT
    system_state : SYSTEM_STATES &
    power_supply : POWER_SUPPLIES &
    panel_events_log : seq(PERSON*ACTION) &
    components : COMPONENTS --> COMPONENT_STATUSES
INITIALISATION
    system_state := STATE_OFF ||
    power_supply := AC_POWER ||
    panel_events_log := [] ||
    components := {cc, ss | cc : COMPONENTS & ss : COMPONENT_STATUSES & ss = STATUS_OFF}
OPERATIONS
    // Create operations to simulate external inputs (set a room on fire, blackouts, damage and fix components).
    
    info <-- control_panel_info =
    PRE
        info :  SYSTEM_STATES*(POWER_SUPPLIES*POW(COMPONENTS*COMPONENT_STATUSES))
    THEN
        info := (system_state |-> (power_supply |-> components))
    END;
    
    turn_on_system(person) =
    PRE
        system_state = STATE_OFF &
        person : PERSON
    THEN
        // Check for danger on start.
        components := {cc, ss | cc : COMPONENTS & ss : COMPONENT_STATUSES & (components(cc) : {STATUS_DEFECT, STATUS_ON} => ss = components(cc)) & (components(cc) = STATUS_OFF => ss = STATUS_ON)} ||
        IF card(components |> {STATUS_DEFECT}) > 0
        THEN system_state := STATE_DEFECT
        ELSE system_state := STATE_NORMAL
        END ||
        panel_events_log := (person |-> ACTION_TURN_ON_SYS) -> panel_events_log
    END;
    
    turn_off_system(person) =
    PRE
        system_state /: {STATE_OFF, STATE_DEFECT} &
        person : PERSON
    THEN
        // Reset whole system to default state.
        components := {cc, ss | cc : COMPONENTS & ss : COMPONENT_STATUSES & (components(cc) : {STATUS_DEFECT, STATUS_OFF} => ss = components(cc)) & (components(cc) = STATUS_ON => ss = STATUS_OFF)} ||
        system_state := STATE_OFF ||
        power_supply := AC_POWER ||
        panel_events_log := (person |-> ACTION_TURN_OFF_SYS) -> panel_events_log
    END;
    
    activate_component(person, component) =
    PRE
        person : PERSON &
        component : COMPONENTS &
        components(component) = STATUS_OFF &
        system_state /= STATE_OFF
    THEN
        components := components <+ {component |-> STATUS_ON} ||
        panel_events_log := (person |-> ACTION_TURN_ON_CMP) -> panel_events_log
    END;
    
    inactivate_component(person, component) =
    PRE
        person : PERSON &
        component : COMPONENTS &
        components(component) = STATUS_ON &
        system_state /= STATE_OFF
    THEN
        components := components <+ {component |-> STATUS_OFF} ||
        panel_events_log := (person |-> ACTION_TURN_OFF_CMP) -> panel_events_log
    END
    
END
