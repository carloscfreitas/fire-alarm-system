/* Fire_Alarm_System
 * Authors: Álvaro Costa, Carlos Freitas, Paulo Silva
 * Creation date: 18/05/19
 */
 
// Define sets and variables for output devices (sirens, bells, emergency lights, door holder relays)
MACHINE
    Fire_Alarm_System
SETS
    SYSTEM_STATES = {STATE_OFF, STATE_NORMAL, STATE_DEFECT, STATE_PREALARM, STATE_ALARM};
    POWER_SUPPLIES = {AC_POWER, DC_POWER};
    PERSONS = {PERSON_1, PERSON_2, PERSON_3};
    ACTION = {ACTION_TURN_ON_SYS, ACTION_TURN_OFF_SYS, ACTION_TURN_ON_CMP, ACTION_TURN_OFF_CMP, ACTION_FIX_COMPONENT};
    COMPONENT_STATUSES = {STATUS_ON, STATUS_OFF, STATUS_DEFECT, STATUS_PREALARM, STATUS_ALARM};
    COMPONENTS = {
        // Smoke Detectors
        CMP_SD_1, CMP_SD_2, CMP_SD_3, CMP_SD_4, CMP_SD_5,
        // Manual Call Points
        CMP_MCP_1, CMP_MCP_2, CMP_MCP_3, CMP_MCP_4, CMP_MCP_5,
        // Sprinklers
        CMP_SPKR_1, CMP_SPKR_2, CMP_SPKR_3, CMP_SPKR_4, CMP_SPKR_5
    };
    ROOMS = {ROOM_1, ROOM_2, ROOM_3, ROOM_4, ROOM_5};
    ROOM_STATES = {SECURE, ALERT, DANGER}
CONSTANTS
    SMOKE_DETECTORS, SPRINKLERS, MANUAL_CALL_POINTS, ROOMS_COMPONENTS
PROPERTIES
    SMOKE_DETECTORS : POW(COMPONENTS) &
    SMOKE_DETECTORS = {CMP_SD_1, CMP_SD_2, CMP_SD_3, CMP_SD_4, CMP_SD_5} &
    SPRINKLERS : POW(COMPONENTS) &
    SPRINKLERS = {CMP_SPKR_1, CMP_SPKR_2, CMP_SPKR_3, CMP_SPKR_4, CMP_SPKR_5} &
    MANUAL_CALL_POINTS : POW(COMPONENTS) &
    MANUAL_CALL_POINTS = {CMP_MCP_1, CMP_MCP_2, CMP_MCP_3, CMP_MCP_4, CMP_MCP_5} &
    ROOMS_COMPONENTS : ROOMS >-> POW(COMPONENTS) &
    ROOMS_COMPONENTS = {
        ROOM_1 |-> {CMP_SD_1, CMP_MCP_1, CMP_SPKR_1},
        ROOM_2 |-> {CMP_SD_2, CMP_MCP_2, CMP_SPKR_2},
        ROOM_3 |-> {CMP_SD_3, CMP_MCP_3, CMP_SPKR_3},
        ROOM_4 |-> {CMP_SD_4, CMP_MCP_4, CMP_SPKR_4},
        ROOM_5 |-> {CMP_SD_5, CMP_MCP_5, CMP_SPKR_5}
    }
VARIABLES
    system_state, power_supply, panel_events_log, components, has_electricity, rooms
INVARIANT
    system_state : SYSTEM_STATES &
    power_supply : POWER_SUPPLIES &
    panel_events_log : seq(PERSONS*ACTION) &
    components : COMPONENTS --> COMPONENT_STATUSES &
    has_electricity : BOOL &
    rooms : ROOMS --> ROOM_STATES &
    (system_state /= STATE_OFF & has_electricity = TRUE => power_supply = AC_POWER) &
    (system_state /= STATE_OFF & has_electricity = FALSE => power_supply = DC_POWER) &
    (system_state = STATE_OFF => card(components |>> {STATUS_OFF, STATUS_DEFECT}) = 0) &
    (system_state = STATE_DEFECT => card(components |> {STATUS_PREALARM, STATUS_ALARM}) = 0 & card(components |> {STATUS_DEFECT}) > 0) &
    (system_state = STATE_NORMAL => card(components |> {STATUS_DEFECT, STATUS_PREALARM, STATUS_ALARM}) = 0 & components |> {STATUS_OFF, STATUS_ON} = components) &
    (! rr . (rr : ROOMS & rr : dom(rooms |> {SECURE}) => components[ROOMS_COMPONENTS(rr)] /\ {STATUS_PREALARM, STATUS_ALARM} = {}))
INITIALISATION
    system_state := STATE_OFF ||
    power_supply := AC_POWER ||
    panel_events_log := [] ||
    components := {cc, ss | cc : COMPONENTS & ss : COMPONENT_STATUSES & ss = STATUS_OFF} ||
    has_electricity := TRUE ||
    rooms := {rr, ss | rr : ROOMS & ss : ROOM_STATES & ss = SECURE}
OPERATIONS
    info <-- control_panel_info =
    PRE
        info : SYSTEM_STATES*(POWER_SUPPLIES*POW(COMPONENTS*COMPONENT_STATUSES))
    THEN
        info := (system_state |-> (power_supply |-> components))
    END;
    
    turn_on_system(person) =
    PRE
        system_state = STATE_OFF &
        person : PERSONS
    THEN
        components := components <+ {cc, ss | cc : COMPONENTS & ss : COMPONENT_STATUSES & components(cc) /= STATUS_DEFECT &
            (! rr . (rr : ROOMS & cc : ROOMS_COMPONENTS(rr) &
                    (rr : dom(rooms |> {SECURE}) or
                    (rr : dom(rooms |> {ALERT}) & cc : SPRINKLERS \/ MANUAL_CALL_POINTS) or
                    (rr : dom(rooms |> {DANGER}) & cc : MANUAL_CALL_POINTS)) => ss = STATUS_ON)) &
            (! rr . (rr : ROOMS & cc : ROOMS_COMPONENTS(rr) /\ SMOKE_DETECTORS & rr : dom(rooms |> {ALERT}) => ss = STATUS_PREALARM)) &
            (! rr . (rr : ROOMS & cc : ROOMS_COMPONENTS(rr) /\ (SMOKE_DETECTORS \/ SPRINKLERS) & rr : dom(rooms |> {DANGER}) => ss = STATUS_ALARM))
        } ||
        IF (# (rr, cc) . (rr : ROOMS & rr : dom(rooms |> {DANGER}) & cc : ROOMS_COMPONENTS(rr) - MANUAL_CALL_POINTS & components(cc) /= STATUS_DEFECT))
        THEN system_state := STATE_ALARM
        ELSE
            IF (# (rr, cc) . (rr : ROOMS & rr : dom(rooms |> {ALERT}) & cc : ROOMS_COMPONENTS(rr) - MANUAL_CALL_POINTS & components(cc) /= STATUS_DEFECT))
            THEN system_state := STATE_PREALARM
            ELSE
                IF card(components |> {STATUS_DEFECT}) > 0
                THEN system_state := STATE_DEFECT
                ELSE system_state := STATE_NORMAL
                END                        
            END
        END ||
        IF has_electricity = TRUE
        THEN power_supply := AC_POWER
        ELSE power_supply := DC_POWER
        END ||
        panel_events_log := (person |-> ACTION_TURN_ON_SYS) -> panel_events_log
    END;
    
    turn_off_system(person) =
    PRE
        system_state /= STATE_OFF &
        person : PERSONS
    THEN
        components := {cc, ss | cc : COMPONENTS & ss : COMPONENT_STATUSES & (components(cc) : {STATUS_DEFECT, STATUS_OFF} => ss = components(cc)) & (components(cc) /: {STATUS_DEFECT, STATUS_OFF} => ss = STATUS_OFF)} ||
        system_state := STATE_OFF ||
        panel_events_log := (person |-> ACTION_TURN_OFF_SYS) -> panel_events_log
    END;
    
    turn_on_component(person, component) =
    PRE
        person : PERSONS &
        component : COMPONENTS &
        components(component) = STATUS_OFF &
        system_state /= STATE_OFF
    THEN
        IF (# rr . (rr : ROOMS & rr : dom(rooms |> {DANGER}) & component : ROOMS_COMPONENTS(rr) - MANUAL_CALL_POINTS))
        THEN
            components := components <+ {component |-> STATUS_ALARM} ||
            system_state := STATE_ALARM
        ELSE
            IF (# rr . (rr : ROOMS & rr : dom(rooms |> {ALERT}) & component : ROOMS_COMPONENTS(rr) /\ SMOKE_DETECTORS))
            THEN
                components := components <+ {component |-> STATUS_PREALARM} ||
                system_state := STATE_PREALARM
            ELSE
                components := components <+ {component |-> STATUS_ON} ||
                IF dom(components |> {STATUS_DEFECT}) = {component} & card(components |> {STATUS_PREALARM, STATUS_ALARM}) = 0
                THEN system_state := STATE_NORMAL
                END
            END
        END ||
        panel_events_log := (person |-> ACTION_TURN_ON_CMP) -> panel_events_log
    END;
    
    turn_off_component(person, component) =
    PRE
        person : PERSONS &
        component : COMPONENTS &
        components(component) /: {STATUS_OFF, STATUS_DEFECT} &
        system_state /= STATE_OFF
    THEN
        components := components <+ {component |-> STATUS_OFF} ||
        panel_events_log := (person |-> ACTION_TURN_OFF_CMP) -> panel_events_log
    END;
    
    fix_component(person, component) =
    PRE
        person : PERSONS &
        component : COMPONENTS &
        components(component) = STATUS_DEFECT
    THEN
        IF system_state /= STATE_OFF
        THEN
            IF (# rr . (rr : ROOMS & rr : dom(rooms |> {DANGER}) & component : ROOMS_COMPONENTS(rr) - MANUAL_CALL_POINTS))
            THEN
                components := components <+ {component |-> STATUS_ALARM} ||
                system_state := STATE_ALARM
            ELSE
                IF (# rr . (rr : ROOMS & rr : dom(rooms |> {ALERT}) & component : ROOMS_COMPONENTS(rr) /\ SMOKE_DETECTORS))
                THEN
                    components := components <+ {component |-> STATUS_PREALARM} ||
                    system_state := STATE_PREALARM
                ELSE
                    components := components <+ {component |-> STATUS_ON} ||
                    IF dom(components |> {STATUS_DEFECT}) = {component} & card(components |> {STATUS_PREALARM, STATUS_ALARM}) = 0
                    THEN system_state := STATE_NORMAL
                    END
                END
            END
        ELSE
            components := components <+ {component |-> STATUS_OFF}
        END ||
        panel_events_log := (person |-> ACTION_FIX_COMPONENT) -> panel_events_log        
    END;
    
    activate_call_point(room) =
    PRE
        room : ROOMS &
        system_state /= STATE_OFF &
        components[ROOMS_COMPONENTS(room) /\ MANUAL_CALL_POINTS] = {STATUS_ON}
    THEN
        IF system_state : {STATE_NORMAL, STATE_DEFECT, STATE_PREALARM, STATE_ALARM}
        THEN
            system_state := STATE_ALARM ||
            components := components <+ {cc, ss | cc : ROOMS_COMPONENTS(room) /\ (SPRINKLERS \/ SMOKE_DETECTORS) & ss : COMPONENT_STATUSES & ss = STATUS_ALARM}
        END ||
        rooms(room) := DANGER
    END;

   /**
    * External operations (controls the environment state).
    */

    env_component_malfunction(component) =
    PRE
        system_state /= STATE_OFF &
        component : COMPONENTS &
        components(component) /= STATUS_DEFECT
    THEN
        components := components <+ {component |-> STATUS_DEFECT} ||
        IF system_state = STATE_NORMAL
        THEN system_state := STATE_DEFECT
        END
    END;
    
    env_start_blackout =
    PRE
        has_electricity = TRUE
    THEN
        has_electricity := FALSE ||
        IF system_state /= STATE_OFF
        THEN power_supply := DC_POWER
        END
    END;
    
    env_stop_blackout =
    PRE
        has_electricity = FALSE
    THEN
        has_electricity := TRUE ||
        IF system_state /= STATE_OFF
        THEN power_supply := AC_POWER
        END
    END;

    env_put_smoke(room) =
    PRE
        room : ROOMS &
        rooms(room) = SECURE
    THEN
        IF system_state /= STATE_OFF
        THEN
            IF STATUS_ON : components[ROOMS_COMPONENTS(room) /\ SMOKE_DETECTORS]
            THEN
                components := components <+ {cc, ss | cc : ROOMS_COMPONENTS(room) /\ SMOKE_DETECTORS & ss : COMPONENT_STATUSES & ss = STATUS_PREALARM} ||
                IF system_state : {STATE_NORMAL, STATE_DEFECT}
                THEN
                    system_state := STATE_PREALARM
                END
            END
        END ||
        rooms(room) := ALERT
    END;

    env_clear_smoke(room) =
    PRE
        room : ROOMS &
        rooms(room) = ALERT
    THEN
        IF system_state /= STATE_OFF
        THEN
            IF STATUS_PREALARM : components[ROOMS_COMPONENTS(room) /\ SMOKE_DETECTORS]
            THEN
                components := components <+ {cc, ss | cc : ROOMS_COMPONENTS(room) /\ SMOKE_DETECTORS & ss : COMPONENT_STATUSES & ss = STATUS_ON}
            END ||
            IF dom(components |> {STATUS_PREALARM}) = {cc | cc : ROOMS_COMPONENTS(room) /\ SMOKE_DETECTORS} & card(components |> {STATUS_ALARM}) = 0
            THEN
                IF card(components |> {STATUS_DEFECT}) > 0
                THEN system_state := STATE_DEFECT
                ELSE system_state := STATE_NORMAL
                END
            END
        END ||
        rooms(room) := SECURE
    END;
    
    env_set_on_fire(room) =
    PRE
        room : ROOMS &
        rooms(room) /= DANGER
    THEN
        IF system_state /= STATE_OFF
        THEN
            IF components[ROOMS_COMPONENTS(room) /\ (SMOKE_DETECTORS \/ SPRINKLERS)] /\ {STATUS_ON, STATUS_PREALARM} /= {}
            THEN
                components := components <+ {cc, ss | cc : ROOMS_COMPONENTS(room) /\ (SMOKE_DETECTORS \/ SPRINKLERS) & ss : COMPONENT_STATUSES & (components(cc) : {STATUS_ON, STATUS_PREALARM} => ss = STATUS_ALARM) & (components(cc) /: {STATUS_ON, STATUS_PREALARM} => ss = components(cc))} ||
                IF system_state : {STATE_NORMAL, STATE_DEFECT, STATE_PREALARM}
                THEN
                    system_state := STATE_ALARM
                END
            END
        END ||
        rooms(room) := DANGER
    END;

    env_put_out_fire(room) =
    PRE
        room : ROOMS &
        rooms(room) = DANGER
    THEN
        IF system_state /= STATE_OFF
        THEN
            IF STATUS_ALARM : components[ROOMS_COMPONENTS(room) /\ (SMOKE_DETECTORS \/ SPRINKLERS)]
            THEN
                components := components <+ {cc, ss | cc : ROOMS_COMPONENTS(room) /\ (SMOKE_DETECTORS \/ SPRINKLERS) & ss : COMPONENT_STATUSES & (components(cc) = STATUS_ALARM => ss = STATUS_ON) & (components(cc) /= STATUS_ALARM => ss = components(cc))}
            END ||
            IF dom(components |> {STATUS_ALARM}) = {cc | cc : ROOMS_COMPONENTS(room) /\ (SMOKE_DETECTORS \/ SPRINKLERS) & components(cc) = STATUS_ALARM}
            THEN
                IF card(components |> {STATUS_PREALARM}) = 0
                THEN            
                    IF card(components |> {STATUS_DEFECT}) > 0
                    THEN system_state := STATE_DEFECT
                    ELSE system_state := STATE_NORMAL
                    END
                ELSE system_state := STATE_PREALARM
                END
            END
        END ||
        rooms(room) := SECURE
    END
END
