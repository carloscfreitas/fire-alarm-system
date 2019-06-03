Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Fire_Alarm_System))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Fire_Alarm_System))==(Machine(Fire_Alarm_System));
  Level(Machine(Fire_Alarm_System))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Fire_Alarm_System)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Fire_Alarm_System))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Fire_Alarm_System))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Fire_Alarm_System))==(?);
  List_Includes(Machine(Fire_Alarm_System))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Fire_Alarm_System))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Fire_Alarm_System))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Fire_Alarm_System))==(?);
  Context_List_Variables(Machine(Fire_Alarm_System))==(?);
  Abstract_List_Variables(Machine(Fire_Alarm_System))==(?);
  Local_List_Variables(Machine(Fire_Alarm_System))==(emergency_lights,rooms,has_electricity,components,panel_events_log,power_supply,system_state);
  List_Variables(Machine(Fire_Alarm_System))==(emergency_lights,rooms,has_electricity,components,panel_events_log,power_supply,system_state);
  External_List_Variables(Machine(Fire_Alarm_System))==(emergency_lights,rooms,has_electricity,components,panel_events_log,power_supply,system_state)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Fire_Alarm_System))==(?);
  Abstract_List_VisibleVariables(Machine(Fire_Alarm_System))==(?);
  External_List_VisibleVariables(Machine(Fire_Alarm_System))==(?);
  Expanded_List_VisibleVariables(Machine(Fire_Alarm_System))==(?);
  List_VisibleVariables(Machine(Fire_Alarm_System))==(?);
  Internal_List_VisibleVariables(Machine(Fire_Alarm_System))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Fire_Alarm_System))==(btrue);
  Gluing_List_Invariant(Machine(Fire_Alarm_System))==(btrue);
  Expanded_List_Invariant(Machine(Fire_Alarm_System))==(btrue);
  Abstract_List_Invariant(Machine(Fire_Alarm_System))==(btrue);
  Context_List_Invariant(Machine(Fire_Alarm_System))==(btrue);
  List_Invariant(Machine(Fire_Alarm_System))==(system_state: SYSTEM_STATES & power_supply: POWER_SUPPLIES & panel_events_log: seq(PERSONS*ACTION) & components: COMPONENTS --> COMPONENT_STATUSES & has_electricity: BOOL & rooms: ROOMS --> ROOM_STATES & emergency_lights: EMERGENCY_LIGHTS_STATES & (system_state/=STATE_OFF & has_electricity = TRUE => power_supply = AC_POWER) & (system_state/=STATE_OFF & has_electricity = FALSE => power_supply = DC_POWER) & (system_state = STATE_OFF => card(components|>>{STATUS_OFF,STATUS_DEFECT}) = 0) & (system_state = STATE_DEFECT => card(components|>{STATUS_PREALARM,STATUS_ALARM}) = 0 & card(components|>{STATUS_DEFECT})>0) & (system_state = STATE_NORMAL => card(components|>{STATUS_DEFECT,STATUS_PREALARM,STATUS_ALARM}) = 0 & components|>{STATUS_OFF,STATUS_ON} = components) & !rr.(rr: ROOMS & rr: dom(rooms|>{SECURE}) => components[ROOMS_COMPONENTS(rr)]/\{STATUS_PREALARM,STATUS_ALARM} = {}))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Fire_Alarm_System))==(btrue);
  Abstract_List_Assertions(Machine(Fire_Alarm_System))==(btrue);
  Context_List_Assertions(Machine(Fire_Alarm_System))==(btrue);
  List_Assertions(Machine(Fire_Alarm_System))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Fire_Alarm_System))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Fire_Alarm_System))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Fire_Alarm_System))==(system_state,power_supply,panel_events_log,components,has_electricity,rooms,emergency_lights:=STATE_OFF,AC_POWER,<>,{cc,ss | cc: COMPONENTS & ss: COMPONENT_STATUSES & ss = STATUS_OFF},TRUE,{rr,ss | rr: ROOMS & ss: ROOM_STATES & ss = SECURE},LIGHTS_OFF);
  Context_List_Initialisation(Machine(Fire_Alarm_System))==(skip);
  List_Initialisation(Machine(Fire_Alarm_System))==(system_state:=STATE_OFF || power_supply:=AC_POWER || panel_events_log:=<> || components:={cc,ss | cc: COMPONENTS & ss: COMPONENT_STATUSES & ss = STATUS_OFF} || has_electricity:=TRUE || rooms:={rr,ss | rr: ROOMS & ss: ROOM_STATES & ss = SECURE} || emergency_lights:=LIGHTS_OFF)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Fire_Alarm_System))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Fire_Alarm_System))==(btrue);
  List_Constraints(Machine(Fire_Alarm_System))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Fire_Alarm_System))==(control_panel_info,turn_on_system,turn_off_system,turn_on_component,turn_off_component,fix_component,activate_call_point,env_component_malfunction,env_start_blackout,env_stop_blackout,env_put_smoke,env_clear_smoke,env_set_on_fire,env_put_out_fire);
  List_Operations(Machine(Fire_Alarm_System))==(control_panel_info,turn_on_system,turn_off_system,turn_on_component,turn_off_component,fix_component,activate_call_point,env_component_malfunction,env_start_blackout,env_stop_blackout,env_put_smoke,env_clear_smoke,env_set_on_fire,env_put_out_fire)
END
&
THEORY ListInputX IS
  List_Input(Machine(Fire_Alarm_System),control_panel_info)==(?);
  List_Input(Machine(Fire_Alarm_System),turn_on_system)==(person);
  List_Input(Machine(Fire_Alarm_System),turn_off_system)==(person);
  List_Input(Machine(Fire_Alarm_System),turn_on_component)==(person,component);
  List_Input(Machine(Fire_Alarm_System),turn_off_component)==(person,component);
  List_Input(Machine(Fire_Alarm_System),fix_component)==(person,component);
  List_Input(Machine(Fire_Alarm_System),activate_call_point)==(room);
  List_Input(Machine(Fire_Alarm_System),env_component_malfunction)==(component);
  List_Input(Machine(Fire_Alarm_System),env_start_blackout)==(?);
  List_Input(Machine(Fire_Alarm_System),env_stop_blackout)==(?);
  List_Input(Machine(Fire_Alarm_System),env_put_smoke)==(room);
  List_Input(Machine(Fire_Alarm_System),env_clear_smoke)==(room);
  List_Input(Machine(Fire_Alarm_System),env_set_on_fire)==(room);
  List_Input(Machine(Fire_Alarm_System),env_put_out_fire)==(room)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Fire_Alarm_System),control_panel_info)==(info);
  List_Output(Machine(Fire_Alarm_System),turn_on_system)==(?);
  List_Output(Machine(Fire_Alarm_System),turn_off_system)==(?);
  List_Output(Machine(Fire_Alarm_System),turn_on_component)==(?);
  List_Output(Machine(Fire_Alarm_System),turn_off_component)==(?);
  List_Output(Machine(Fire_Alarm_System),fix_component)==(?);
  List_Output(Machine(Fire_Alarm_System),activate_call_point)==(?);
  List_Output(Machine(Fire_Alarm_System),env_component_malfunction)==(?);
  List_Output(Machine(Fire_Alarm_System),env_start_blackout)==(?);
  List_Output(Machine(Fire_Alarm_System),env_stop_blackout)==(?);
  List_Output(Machine(Fire_Alarm_System),env_put_smoke)==(?);
  List_Output(Machine(Fire_Alarm_System),env_clear_smoke)==(?);
  List_Output(Machine(Fire_Alarm_System),env_set_on_fire)==(?);
  List_Output(Machine(Fire_Alarm_System),env_put_out_fire)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Fire_Alarm_System),control_panel_info)==(info <-- control_panel_info);
  List_Header(Machine(Fire_Alarm_System),turn_on_system)==(turn_on_system(person));
  List_Header(Machine(Fire_Alarm_System),turn_off_system)==(turn_off_system(person));
  List_Header(Machine(Fire_Alarm_System),turn_on_component)==(turn_on_component(person,component));
  List_Header(Machine(Fire_Alarm_System),turn_off_component)==(turn_off_component(person,component));
  List_Header(Machine(Fire_Alarm_System),fix_component)==(fix_component(person,component));
  List_Header(Machine(Fire_Alarm_System),activate_call_point)==(activate_call_point(room));
  List_Header(Machine(Fire_Alarm_System),env_component_malfunction)==(env_component_malfunction(component));
  List_Header(Machine(Fire_Alarm_System),env_start_blackout)==(env_start_blackout);
  List_Header(Machine(Fire_Alarm_System),env_stop_blackout)==(env_stop_blackout);
  List_Header(Machine(Fire_Alarm_System),env_put_smoke)==(env_put_smoke(room));
  List_Header(Machine(Fire_Alarm_System),env_clear_smoke)==(env_clear_smoke(room));
  List_Header(Machine(Fire_Alarm_System),env_set_on_fire)==(env_set_on_fire(room));
  List_Header(Machine(Fire_Alarm_System),env_put_out_fire)==(env_put_out_fire(room))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Fire_Alarm_System),control_panel_info)==(info: SYSTEM_STATES*(EMERGENCY_LIGHTS_STATES*(POWER_SUPPLIES*POW(COMPONENTS*COMPONENT_STATUSES))));
  List_Precondition(Machine(Fire_Alarm_System),turn_on_system)==(system_state = STATE_OFF & person: PERSONS);
  List_Precondition(Machine(Fire_Alarm_System),turn_off_system)==(system_state/=STATE_OFF & person: PERSONS);
  List_Precondition(Machine(Fire_Alarm_System),turn_on_component)==(person: PERSONS & component: COMPONENTS & components(component) = STATUS_OFF & system_state/=STATE_OFF);
  List_Precondition(Machine(Fire_Alarm_System),turn_off_component)==(person: PERSONS & component: COMPONENTS & components(component)/:{STATUS_OFF,STATUS_DEFECT} & system_state/=STATE_OFF);
  List_Precondition(Machine(Fire_Alarm_System),fix_component)==(person: PERSONS & component: COMPONENTS & components(component) = STATUS_DEFECT);
  List_Precondition(Machine(Fire_Alarm_System),activate_call_point)==(room: ROOMS & system_state/=STATE_OFF & components[ROOMS_COMPONENTS(room)/\MANUAL_CALL_POINTS] = {STATUS_ON});
  List_Precondition(Machine(Fire_Alarm_System),env_component_malfunction)==(system_state/=STATE_OFF & component: COMPONENTS & components(component)/=STATUS_DEFECT);
  List_Precondition(Machine(Fire_Alarm_System),env_start_blackout)==(has_electricity = TRUE);
  List_Precondition(Machine(Fire_Alarm_System),env_stop_blackout)==(has_electricity = FALSE);
  List_Precondition(Machine(Fire_Alarm_System),env_put_smoke)==(room: ROOMS & rooms(room) = SECURE);
  List_Precondition(Machine(Fire_Alarm_System),env_clear_smoke)==(room: ROOMS & rooms(room) = ALERT);
  List_Precondition(Machine(Fire_Alarm_System),env_set_on_fire)==(room: ROOMS & rooms(room)/=DANGER);
  List_Precondition(Machine(Fire_Alarm_System),env_put_out_fire)==(room: ROOMS & rooms(room) = DANGER)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Fire_Alarm_System),env_put_out_fire)==(room: ROOMS & rooms(room) = DANGER | system_state/=STATE_OFF ==> (STATUS_ALARM: components[ROOMS_COMPONENTS(room)/\(SMOKE_DETECTORS\/SPRINKLERS)] ==> components:=components<+{cc,ss | cc: ROOMS_COMPONENTS(room)/\(SMOKE_DETECTORS\/SPRINKLERS) & ss: COMPONENT_STATUSES & (components(cc) = STATUS_ALARM => ss = STATUS_ON) & (components(cc)/=STATUS_ALARM => ss = components(cc))} [] not(STATUS_ALARM: components[ROOMS_COMPONENTS(room)/\(SMOKE_DETECTORS\/SPRINKLERS)]) ==> skip || (dom(components|>{STATUS_ALARM}) = {cc | cc: ROOMS_COMPONENTS(room)/\(SMOKE_DETECTORS\/SPRINKLERS) & components(cc) = STATUS_ALARM} ==> (card(components|>{STATUS_PREALARM}) = 0 ==> (card(components|>{STATUS_DEFECT})>0 ==> system_state:=STATE_DEFECT [] not(card(components|>{STATUS_DEFECT})>0) ==> system_state:=STATE_NORMAL || emergency_lights:=LIGHTS_OFF) [] not(card(components|>{STATUS_PREALARM}) = 0) ==> system_state,emergency_lights:=STATE_PREALARM,BLINK_YELLOW) [] not(dom(components|>{STATUS_ALARM}) = {cc | cc: ROOMS_COMPONENTS(room)/\(SMOKE_DETECTORS\/SPRINKLERS) & components(cc) = STATUS_ALARM}) ==> skip)) [] not(system_state/=STATE_OFF) ==> skip || rooms:=rooms<+{room|->SECURE});
  Expanded_List_Substitution(Machine(Fire_Alarm_System),env_set_on_fire)==(room: ROOMS & rooms(room)/=DANGER | system_state/=STATE_OFF ==> (components[ROOMS_COMPONENTS(room)/\(SMOKE_DETECTORS\/SPRINKLERS)]/\{STATUS_ON,STATUS_PREALARM}/={} ==> (components:=components<+{cc,ss | cc: ROOMS_COMPONENTS(room)/\(SMOKE_DETECTORS\/SPRINKLERS) & ss: COMPONENT_STATUSES & (components(cc): {STATUS_ON,STATUS_PREALARM} => ss = STATUS_ALARM) & (components(cc)/:{STATUS_ON,STATUS_PREALARM} => ss = components(cc))} || (system_state: {STATE_NORMAL,STATE_DEFECT,STATE_PREALARM} ==> system_state,emergency_lights:=STATE_ALARM,BLINK_RED [] not(system_state: {STATE_NORMAL,STATE_DEFECT,STATE_PREALARM}) ==> skip)) [] not(components[ROOMS_COMPONENTS(room)/\(SMOKE_DETECTORS\/SPRINKLERS)]/\{STATUS_ON,STATUS_PREALARM}/={}) ==> skip) [] not(system_state/=STATE_OFF) ==> skip || rooms:=rooms<+{room|->DANGER});
  Expanded_List_Substitution(Machine(Fire_Alarm_System),env_clear_smoke)==(room: ROOMS & rooms(room) = ALERT | system_state/=STATE_OFF ==> (STATUS_PREALARM: components[ROOMS_COMPONENTS(room)/\SMOKE_DETECTORS] ==> components:=components<+{cc,ss | cc: ROOMS_COMPONENTS(room)/\SMOKE_DETECTORS & ss: COMPONENT_STATUSES & ss = STATUS_ON} [] not(STATUS_PREALARM: components[ROOMS_COMPONENTS(room)/\SMOKE_DETECTORS]) ==> skip || (dom(components|>{STATUS_PREALARM}) = {cc | cc: ROOMS_COMPONENTS(room)/\SMOKE_DETECTORS} & card(components|>{STATUS_ALARM}) = 0 ==> (card(components|>{STATUS_DEFECT})>0 ==> system_state:=STATE_DEFECT [] not(card(components|>{STATUS_DEFECT})>0) ==> system_state:=STATE_NORMAL || emergency_lights:=LIGHTS_OFF) [] not(dom(components|>{STATUS_PREALARM}) = {cc | cc: ROOMS_COMPONENTS(room)/\SMOKE_DETECTORS} & card(components|>{STATUS_ALARM}) = 0) ==> skip)) [] not(system_state/=STATE_OFF) ==> skip || rooms:=rooms<+{room|->SECURE});
  Expanded_List_Substitution(Machine(Fire_Alarm_System),env_put_smoke)==(room: ROOMS & rooms(room) = SECURE | system_state/=STATE_OFF ==> (STATUS_ON: components[ROOMS_COMPONENTS(room)/\SMOKE_DETECTORS] ==> (components:=components<+{cc,ss | cc: ROOMS_COMPONENTS(room)/\SMOKE_DETECTORS & ss: COMPONENT_STATUSES & ss = STATUS_PREALARM} || (system_state: {STATE_NORMAL,STATE_DEFECT} ==> system_state,emergency_lights:=STATE_PREALARM,BLINK_YELLOW [] not(system_state: {STATE_NORMAL,STATE_DEFECT}) ==> skip)) [] not(STATUS_ON: components[ROOMS_COMPONENTS(room)/\SMOKE_DETECTORS]) ==> skip) [] not(system_state/=STATE_OFF) ==> skip || rooms:=rooms<+{room|->ALERT});
  Expanded_List_Substitution(Machine(Fire_Alarm_System),env_stop_blackout)==(has_electricity = FALSE | has_electricity:=TRUE || (system_state/=STATE_OFF ==> power_supply:=AC_POWER [] not(system_state/=STATE_OFF) ==> skip));
  Expanded_List_Substitution(Machine(Fire_Alarm_System),env_start_blackout)==(has_electricity = TRUE | has_electricity:=FALSE || (system_state/=STATE_OFF ==> power_supply:=DC_POWER [] not(system_state/=STATE_OFF) ==> skip));
  Expanded_List_Substitution(Machine(Fire_Alarm_System),env_component_malfunction)==(system_state/=STATE_OFF & component: COMPONENTS & components(component)/=STATUS_DEFECT | components:=components<+{component|->STATUS_DEFECT} || (system_state = STATE_NORMAL ==> system_state:=STATE_DEFECT [] not(system_state = STATE_NORMAL) ==> skip));
  Expanded_List_Substitution(Machine(Fire_Alarm_System),activate_call_point)==(room: ROOMS & system_state/=STATE_OFF & components[ROOMS_COMPONENTS(room)/\MANUAL_CALL_POINTS] = {STATUS_ON} | system_state: {STATE_NORMAL,STATE_DEFECT,STATE_PREALARM,STATE_ALARM} ==> system_state,components:=STATE_ALARM,components<+{cc,ss | cc: ROOMS_COMPONENTS(room)/\(SPRINKLERS\/SMOKE_DETECTORS) & ss: COMPONENT_STATUSES & ss = STATUS_ALARM} [] not(system_state: {STATE_NORMAL,STATE_DEFECT,STATE_PREALARM,STATE_ALARM}) ==> skip || rooms:=rooms<+{room|->DANGER});
  Expanded_List_Substitution(Machine(Fire_Alarm_System),fix_component)==(person: PERSONS & component: COMPONENTS & components(component) = STATUS_DEFECT | system_state/=STATE_OFF ==> (#rr.(rr: ROOMS & rr: dom(rooms|>{DANGER}) & component: ROOMS_COMPONENTS(rr)-MANUAL_CALL_POINTS) ==> components,system_state:=components<+{component|->STATUS_ALARM},STATE_ALARM [] not(#rr.(rr: ROOMS & rr: dom(rooms|>{DANGER}) & component: ROOMS_COMPONENTS(rr)-MANUAL_CALL_POINTS)) ==> (#rr.(rr: ROOMS & rr: dom(rooms|>{ALERT}) & component: ROOMS_COMPONENTS(rr)/\SMOKE_DETECTORS) ==> components,system_state:=components<+{component|->STATUS_PREALARM},STATE_PREALARM [] not(#rr.(rr: ROOMS & rr: dom(rooms|>{ALERT}) & component: ROOMS_COMPONENTS(rr)/\SMOKE_DETECTORS)) ==> (components:=components<+{component|->STATUS_ON} || (dom(components|>{STATUS_DEFECT}) = {component} & card(components|>{STATUS_PREALARM,STATUS_ALARM}) = 0 ==> system_state:=STATE_NORMAL [] not(dom(components|>{STATUS_DEFECT}) = {component} & card(components|>{STATUS_PREALARM,STATUS_ALARM}) = 0) ==> skip)))) [] not(system_state/=STATE_OFF) ==> components:=components<+{component|->STATUS_OFF} || panel_events_log:=person|->ACTION_FIX_COMPONENT->panel_events_log);
  Expanded_List_Substitution(Machine(Fire_Alarm_System),turn_off_component)==(person: PERSONS & component: COMPONENTS & components(component)/:{STATUS_OFF,STATUS_DEFECT} & system_state/=STATE_OFF | components,panel_events_log:=components<+{component|->STATUS_OFF},person|->ACTION_TURN_OFF_CMP->panel_events_log);
  Expanded_List_Substitution(Machine(Fire_Alarm_System),turn_on_component)==(person: PERSONS & component: COMPONENTS & components(component) = STATUS_OFF & system_state/=STATE_OFF | #rr.(rr: ROOMS & rr: dom(rooms|>{DANGER}) & component: ROOMS_COMPONENTS(rr)-MANUAL_CALL_POINTS) ==> components,system_state,emergency_lights:=components<+{component|->STATUS_ALARM},STATE_ALARM,BLINK_RED [] not(#rr.(rr: ROOMS & rr: dom(rooms|>{DANGER}) & component: ROOMS_COMPONENTS(rr)-MANUAL_CALL_POINTS)) ==> (#rr.(rr: ROOMS & rr: dom(rooms|>{ALERT}) & component: ROOMS_COMPONENTS(rr)/\SMOKE_DETECTORS) ==> components,system_state,emergency_lights:=components<+{component|->STATUS_PREALARM},STATE_PREALARM,BLINK_YELLOW [] not(#rr.(rr: ROOMS & rr: dom(rooms|>{ALERT}) & component: ROOMS_COMPONENTS(rr)/\SMOKE_DETECTORS)) ==> (components:=components<+{component|->STATUS_ON} || (card(components|>{STATUS_DEFECT,STATUS_PREALARM,STATUS_ALARM}) = 0 ==> system_state:=STATE_NORMAL [] not(card(components|>{STATUS_DEFECT,STATUS_PREALARM,STATUS_ALARM}) = 0) ==> skip))) || panel_events_log:=person|->ACTION_TURN_ON_CMP->panel_events_log);
  Expanded_List_Substitution(Machine(Fire_Alarm_System),turn_off_system)==(system_state/=STATE_OFF & person: PERSONS | components,system_state,emergency_lights,panel_events_log:={cc,ss | cc: COMPONENTS & ss: COMPONENT_STATUSES & (components(cc): {STATUS_DEFECT,STATUS_OFF} => ss = components(cc)) & (components(cc)/:{STATUS_DEFECT,STATUS_OFF} => ss = STATUS_OFF)},STATE_OFF,LIGHTS_OFF,person|->ACTION_TURN_OFF_SYS->panel_events_log);
  Expanded_List_Substitution(Machine(Fire_Alarm_System),turn_on_system)==(system_state = STATE_OFF & person: PERSONS | components:=components<+{cc,ss | cc: COMPONENTS & ss: COMPONENT_STATUSES & components(cc)/=STATUS_DEFECT & !rr.(rr: ROOMS & cc: ROOMS_COMPONENTS(rr) & (rr: dom(rooms|>{SECURE}) or (rr: dom(rooms|>{ALERT}) & cc: SPRINKLERS\/MANUAL_CALL_POINTS) or (rr: dom(rooms|>{DANGER}) & cc: MANUAL_CALL_POINTS)) => ss = STATUS_ON) & !rr.(rr: ROOMS & cc: ROOMS_COMPONENTS(rr)/\SMOKE_DETECTORS & rr: dom(rooms|>{ALERT}) => ss = STATUS_PREALARM) & !rr.(rr: ROOMS & cc: ROOMS_COMPONENTS(rr)/\(SMOKE_DETECTORS\/SPRINKLERS) & rr: dom(rooms|>{DANGER}) => ss = STATUS_ALARM)} || (#(rr,cc).(rr: ROOMS & rr: dom(rooms|>{DANGER}) & cc: ROOMS_COMPONENTS(rr)-MANUAL_CALL_POINTS & components(cc)/=STATUS_DEFECT) ==> system_state,emergency_lights:=STATE_ALARM,BLINK_RED [] not(#(rr,cc).(rr: ROOMS & rr: dom(rooms|>{DANGER}) & cc: ROOMS_COMPONENTS(rr)-MANUAL_CALL_POINTS & components(cc)/=STATUS_DEFECT)) ==> (#(rr,cc).(rr: ROOMS & rr: dom(rooms|>{ALERT}) & cc: ROOMS_COMPONENTS(rr)-MANUAL_CALL_POINTS & components(cc)/=STATUS_DEFECT) ==> system_state,emergency_lights:=STATE_PREALARM,BLINK_YELLOW [] not(#(rr,cc).(rr: ROOMS & rr: dom(rooms|>{ALERT}) & cc: ROOMS_COMPONENTS(rr)-MANUAL_CALL_POINTS & components(cc)/=STATUS_DEFECT)) ==> (card(components|>{STATUS_DEFECT})>0 ==> system_state:=STATE_DEFECT [] not(card(components|>{STATUS_DEFECT})>0) ==> system_state:=STATE_NORMAL || emergency_lights:=LIGHTS_OFF))) || (has_electricity = TRUE ==> power_supply:=AC_POWER [] not(has_electricity = TRUE) ==> power_supply:=DC_POWER) || panel_events_log:=person|->ACTION_TURN_ON_SYS->panel_events_log);
  Expanded_List_Substitution(Machine(Fire_Alarm_System),control_panel_info)==(info: SYSTEM_STATES*(EMERGENCY_LIGHTS_STATES*(POWER_SUPPLIES*POW(COMPONENTS*COMPONENT_STATUSES))) | info:=system_state|->(emergency_lights|->(power_supply|->components)));
  List_Substitution(Machine(Fire_Alarm_System),control_panel_info)==(info:=system_state|->(emergency_lights|->(power_supply|->components)));
  List_Substitution(Machine(Fire_Alarm_System),turn_on_system)==(components:=components<+{cc,ss | cc: COMPONENTS & ss: COMPONENT_STATUSES & components(cc)/=STATUS_DEFECT & !rr.(rr: ROOMS & cc: ROOMS_COMPONENTS(rr) & (rr: dom(rooms|>{SECURE}) or (rr: dom(rooms|>{ALERT}) & cc: SPRINKLERS\/MANUAL_CALL_POINTS) or (rr: dom(rooms|>{DANGER}) & cc: MANUAL_CALL_POINTS)) => ss = STATUS_ON) & !rr.(rr: ROOMS & cc: ROOMS_COMPONENTS(rr)/\SMOKE_DETECTORS & rr: dom(rooms|>{ALERT}) => ss = STATUS_PREALARM) & !rr.(rr: ROOMS & cc: ROOMS_COMPONENTS(rr)/\(SMOKE_DETECTORS\/SPRINKLERS) & rr: dom(rooms|>{DANGER}) => ss = STATUS_ALARM)} || IF #(rr,cc).(rr: ROOMS & rr: dom(rooms|>{DANGER}) & cc: ROOMS_COMPONENTS(rr)-MANUAL_CALL_POINTS & components(cc)/=STATUS_DEFECT) THEN system_state:=STATE_ALARM || emergency_lights:=BLINK_RED ELSE IF #(rr,cc).(rr: ROOMS & rr: dom(rooms|>{ALERT}) & cc: ROOMS_COMPONENTS(rr)-MANUAL_CALL_POINTS & components(cc)/=STATUS_DEFECT) THEN system_state:=STATE_PREALARM || emergency_lights:=BLINK_YELLOW ELSE IF card(components|>{STATUS_DEFECT})>0 THEN system_state:=STATE_DEFECT ELSE system_state:=STATE_NORMAL END || emergency_lights:=LIGHTS_OFF END END || IF has_electricity = TRUE THEN power_supply:=AC_POWER ELSE power_supply:=DC_POWER END || panel_events_log:=person|->ACTION_TURN_ON_SYS->panel_events_log);
  List_Substitution(Machine(Fire_Alarm_System),turn_off_system)==(components:={cc,ss | cc: COMPONENTS & ss: COMPONENT_STATUSES & (components(cc): {STATUS_DEFECT,STATUS_OFF} => ss = components(cc)) & (components(cc)/:{STATUS_DEFECT,STATUS_OFF} => ss = STATUS_OFF)} || system_state:=STATE_OFF || emergency_lights:=LIGHTS_OFF || panel_events_log:=person|->ACTION_TURN_OFF_SYS->panel_events_log);
  List_Substitution(Machine(Fire_Alarm_System),turn_on_component)==(IF #rr.(rr: ROOMS & rr: dom(rooms|>{DANGER}) & component: ROOMS_COMPONENTS(rr)-MANUAL_CALL_POINTS) THEN components:=components<+{component|->STATUS_ALARM} || system_state:=STATE_ALARM || emergency_lights:=BLINK_RED ELSE IF #rr.(rr: ROOMS & rr: dom(rooms|>{ALERT}) & component: ROOMS_COMPONENTS(rr)/\SMOKE_DETECTORS) THEN components:=components<+{component|->STATUS_PREALARM} || system_state:=STATE_PREALARM || emergency_lights:=BLINK_YELLOW ELSE components:=components<+{component|->STATUS_ON} || IF card(components|>{STATUS_DEFECT,STATUS_PREALARM,STATUS_ALARM}) = 0 THEN system_state:=STATE_NORMAL END END END || panel_events_log:=person|->ACTION_TURN_ON_CMP->panel_events_log);
  List_Substitution(Machine(Fire_Alarm_System),turn_off_component)==(components:=components<+{component|->STATUS_OFF} || panel_events_log:=person|->ACTION_TURN_OFF_CMP->panel_events_log);
  List_Substitution(Machine(Fire_Alarm_System),fix_component)==(IF system_state/=STATE_OFF THEN IF #rr.(rr: ROOMS & rr: dom(rooms|>{DANGER}) & component: ROOMS_COMPONENTS(rr)-MANUAL_CALL_POINTS) THEN components:=components<+{component|->STATUS_ALARM} || system_state:=STATE_ALARM ELSE IF #rr.(rr: ROOMS & rr: dom(rooms|>{ALERT}) & component: ROOMS_COMPONENTS(rr)/\SMOKE_DETECTORS) THEN components:=components<+{component|->STATUS_PREALARM} || system_state:=STATE_PREALARM ELSE components:=components<+{component|->STATUS_ON} || IF dom(components|>{STATUS_DEFECT}) = {component} & card(components|>{STATUS_PREALARM,STATUS_ALARM}) = 0 THEN system_state:=STATE_NORMAL END END END ELSE components:=components<+{component|->STATUS_OFF} END || panel_events_log:=person|->ACTION_FIX_COMPONENT->panel_events_log);
  List_Substitution(Machine(Fire_Alarm_System),activate_call_point)==(IF system_state: {STATE_NORMAL,STATE_DEFECT,STATE_PREALARM,STATE_ALARM} THEN system_state:=STATE_ALARM || components:=components<+{cc,ss | cc: ROOMS_COMPONENTS(room)/\(SPRINKLERS\/SMOKE_DETECTORS) & ss: COMPONENT_STATUSES & ss = STATUS_ALARM} END || rooms(room):=DANGER);
  List_Substitution(Machine(Fire_Alarm_System),env_component_malfunction)==(components:=components<+{component|->STATUS_DEFECT} || IF system_state = STATE_NORMAL THEN system_state:=STATE_DEFECT END);
  List_Substitution(Machine(Fire_Alarm_System),env_start_blackout)==(has_electricity:=FALSE || IF system_state/=STATE_OFF THEN power_supply:=DC_POWER END);
  List_Substitution(Machine(Fire_Alarm_System),env_stop_blackout)==(has_electricity:=TRUE || IF system_state/=STATE_OFF THEN power_supply:=AC_POWER END);
  List_Substitution(Machine(Fire_Alarm_System),env_put_smoke)==(IF system_state/=STATE_OFF THEN IF STATUS_ON: components[ROOMS_COMPONENTS(room)/\SMOKE_DETECTORS] THEN components:=components<+{cc,ss | cc: ROOMS_COMPONENTS(room)/\SMOKE_DETECTORS & ss: COMPONENT_STATUSES & ss = STATUS_PREALARM} || IF system_state: {STATE_NORMAL,STATE_DEFECT} THEN system_state:=STATE_PREALARM || emergency_lights:=BLINK_YELLOW END END END || rooms(room):=ALERT);
  List_Substitution(Machine(Fire_Alarm_System),env_clear_smoke)==(IF system_state/=STATE_OFF THEN IF STATUS_PREALARM: components[ROOMS_COMPONENTS(room)/\SMOKE_DETECTORS] THEN components:=components<+{cc,ss | cc: ROOMS_COMPONENTS(room)/\SMOKE_DETECTORS & ss: COMPONENT_STATUSES & ss = STATUS_ON} END || IF dom(components|>{STATUS_PREALARM}) = {cc | cc: ROOMS_COMPONENTS(room)/\SMOKE_DETECTORS} & card(components|>{STATUS_ALARM}) = 0 THEN IF card(components|>{STATUS_DEFECT})>0 THEN system_state:=STATE_DEFECT ELSE system_state:=STATE_NORMAL END || emergency_lights:=LIGHTS_OFF END END || rooms(room):=SECURE);
  List_Substitution(Machine(Fire_Alarm_System),env_set_on_fire)==(IF system_state/=STATE_OFF THEN IF components[ROOMS_COMPONENTS(room)/\(SMOKE_DETECTORS\/SPRINKLERS)]/\{STATUS_ON,STATUS_PREALARM}/={} THEN components:=components<+{cc,ss | cc: ROOMS_COMPONENTS(room)/\(SMOKE_DETECTORS\/SPRINKLERS) & ss: COMPONENT_STATUSES & (components(cc): {STATUS_ON,STATUS_PREALARM} => ss = STATUS_ALARM) & (components(cc)/:{STATUS_ON,STATUS_PREALARM} => ss = components(cc))} || IF system_state: {STATE_NORMAL,STATE_DEFECT,STATE_PREALARM} THEN system_state:=STATE_ALARM || emergency_lights:=BLINK_RED END END END || rooms(room):=DANGER);
  List_Substitution(Machine(Fire_Alarm_System),env_put_out_fire)==(IF system_state/=STATE_OFF THEN IF STATUS_ALARM: components[ROOMS_COMPONENTS(room)/\(SMOKE_DETECTORS\/SPRINKLERS)] THEN components:=components<+{cc,ss | cc: ROOMS_COMPONENTS(room)/\(SMOKE_DETECTORS\/SPRINKLERS) & ss: COMPONENT_STATUSES & (components(cc) = STATUS_ALARM => ss = STATUS_ON) & (components(cc)/=STATUS_ALARM => ss = components(cc))} END || IF dom(components|>{STATUS_ALARM}) = {cc | cc: ROOMS_COMPONENTS(room)/\(SMOKE_DETECTORS\/SPRINKLERS) & components(cc) = STATUS_ALARM} THEN IF card(components|>{STATUS_PREALARM}) = 0 THEN IF card(components|>{STATUS_DEFECT})>0 THEN system_state:=STATE_DEFECT ELSE system_state:=STATE_NORMAL END || emergency_lights:=LIGHTS_OFF ELSE system_state:=STATE_PREALARM || emergency_lights:=BLINK_YELLOW END END END || rooms(room):=SECURE)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Fire_Alarm_System))==(SMOKE_DETECTORS,SPRINKLERS,MANUAL_CALL_POINTS,ROOMS_COMPONENTS);
  Inherited_List_Constants(Machine(Fire_Alarm_System))==(?);
  List_Constants(Machine(Fire_Alarm_System))==(SMOKE_DETECTORS,SPRINKLERS,MANUAL_CALL_POINTS,ROOMS_COMPONENTS)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Fire_Alarm_System),SYSTEM_STATES)==({STATE_OFF,STATE_NORMAL,STATE_DEFECT,STATE_PREALARM,STATE_ALARM});
  Context_List_Enumerated(Machine(Fire_Alarm_System))==(?);
  Context_List_Defered(Machine(Fire_Alarm_System))==(?);
  Context_List_Sets(Machine(Fire_Alarm_System))==(?);
  List_Valuable_Sets(Machine(Fire_Alarm_System))==(?);
  Inherited_List_Enumerated(Machine(Fire_Alarm_System))==(?);
  Inherited_List_Defered(Machine(Fire_Alarm_System))==(?);
  Inherited_List_Sets(Machine(Fire_Alarm_System))==(?);
  List_Enumerated(Machine(Fire_Alarm_System))==(SYSTEM_STATES,POWER_SUPPLIES,PERSONS,ACTION,COMPONENT_STATUSES,COMPONENTS,ROOMS,ROOM_STATES,EMERGENCY_LIGHTS_STATES);
  List_Defered(Machine(Fire_Alarm_System))==(?);
  List_Sets(Machine(Fire_Alarm_System))==(SYSTEM_STATES,POWER_SUPPLIES,PERSONS,ACTION,COMPONENT_STATUSES,COMPONENTS,ROOMS,ROOM_STATES,EMERGENCY_LIGHTS_STATES);
  Set_Definition(Machine(Fire_Alarm_System),POWER_SUPPLIES)==({AC_POWER,DC_POWER});
  Set_Definition(Machine(Fire_Alarm_System),PERSONS)==({PERSON_1,PERSON_2,PERSON_3});
  Set_Definition(Machine(Fire_Alarm_System),ACTION)==({ACTION_TURN_ON_SYS,ACTION_TURN_OFF_SYS,ACTION_TURN_ON_CMP,ACTION_TURN_OFF_CMP,ACTION_FIX_COMPONENT});
  Set_Definition(Machine(Fire_Alarm_System),COMPONENT_STATUSES)==({STATUS_ON,STATUS_OFF,STATUS_DEFECT,STATUS_PREALARM,STATUS_ALARM});
  Set_Definition(Machine(Fire_Alarm_System),COMPONENTS)==({CMP_SD_1,CMP_SD_2,CMP_SD_3,CMP_SD_4,CMP_SD_5,CMP_MCP_1,CMP_MCP_2,CMP_MCP_3,CMP_MCP_4,CMP_MCP_5,CMP_SPKR_1,CMP_SPKR_2,CMP_SPKR_3,CMP_SPKR_4,CMP_SPKR_5});
  Set_Definition(Machine(Fire_Alarm_System),ROOMS)==({ROOM_1,ROOM_2,ROOM_3,ROOM_4,ROOM_5});
  Set_Definition(Machine(Fire_Alarm_System),ROOM_STATES)==({SECURE,ALERT,DANGER});
  Set_Definition(Machine(Fire_Alarm_System),EMERGENCY_LIGHTS_STATES)==({LIGHTS_OFF,BLINK_YELLOW,BLINK_RED})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Fire_Alarm_System))==(?);
  Expanded_List_HiddenConstants(Machine(Fire_Alarm_System))==(?);
  List_HiddenConstants(Machine(Fire_Alarm_System))==(?);
  External_List_HiddenConstants(Machine(Fire_Alarm_System))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Fire_Alarm_System))==(btrue);
  Context_List_Properties(Machine(Fire_Alarm_System))==(btrue);
  Inherited_List_Properties(Machine(Fire_Alarm_System))==(btrue);
  List_Properties(Machine(Fire_Alarm_System))==(SMOKE_DETECTORS: POW(COMPONENTS) & SMOKE_DETECTORS = {CMP_SD_1,CMP_SD_2,CMP_SD_3,CMP_SD_4,CMP_SD_5} & SPRINKLERS: POW(COMPONENTS) & SPRINKLERS = {CMP_SPKR_1,CMP_SPKR_2,CMP_SPKR_3,CMP_SPKR_4,CMP_SPKR_5} & MANUAL_CALL_POINTS: POW(COMPONENTS) & MANUAL_CALL_POINTS = {CMP_MCP_1,CMP_MCP_2,CMP_MCP_3,CMP_MCP_4,CMP_MCP_5} & ROOMS_COMPONENTS: ROOMS >-> POW(COMPONENTS) & ROOMS_COMPONENTS = {ROOM_1|->{CMP_SD_1,CMP_MCP_1,CMP_SPKR_1},ROOM_2|->{CMP_SD_2,CMP_MCP_2,CMP_SPKR_2},ROOM_3|->{CMP_SD_3,CMP_MCP_3,CMP_SPKR_3},ROOM_4|->{CMP_SD_4,CMP_MCP_4,CMP_SPKR_4},ROOM_5|->{CMP_SD_5,CMP_MCP_5,CMP_SPKR_5}} & SYSTEM_STATES: FIN(INTEGER) & not(SYSTEM_STATES = {}) & POWER_SUPPLIES: FIN(INTEGER) & not(POWER_SUPPLIES = {}) & PERSONS: FIN(INTEGER) & not(PERSONS = {}) & ACTION: FIN(INTEGER) & not(ACTION = {}) & COMPONENT_STATUSES: FIN(INTEGER) & not(COMPONENT_STATUSES = {}) & COMPONENTS: FIN(INTEGER) & not(COMPONENTS = {}) & ROOMS: FIN(INTEGER) & not(ROOMS = {}) & ROOM_STATES: FIN(INTEGER) & not(ROOM_STATES = {}) & EMERGENCY_LIGHTS_STATES: FIN(INTEGER) & not(EMERGENCY_LIGHTS_STATES = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Fire_Alarm_System),control_panel_info)==(?);
  List_ANY_Var(Machine(Fire_Alarm_System),turn_on_system)==(?);
  List_ANY_Var(Machine(Fire_Alarm_System),turn_off_system)==(?);
  List_ANY_Var(Machine(Fire_Alarm_System),turn_on_component)==(?);
  List_ANY_Var(Machine(Fire_Alarm_System),turn_off_component)==(?);
  List_ANY_Var(Machine(Fire_Alarm_System),fix_component)==(?);
  List_ANY_Var(Machine(Fire_Alarm_System),activate_call_point)==(?);
  List_ANY_Var(Machine(Fire_Alarm_System),env_component_malfunction)==(?);
  List_ANY_Var(Machine(Fire_Alarm_System),env_start_blackout)==(?);
  List_ANY_Var(Machine(Fire_Alarm_System),env_stop_blackout)==(?);
  List_ANY_Var(Machine(Fire_Alarm_System),env_put_smoke)==(?);
  List_ANY_Var(Machine(Fire_Alarm_System),env_clear_smoke)==(?);
  List_ANY_Var(Machine(Fire_Alarm_System),env_set_on_fire)==(?);
  List_ANY_Var(Machine(Fire_Alarm_System),env_put_out_fire)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Fire_Alarm_System)) == (SMOKE_DETECTORS,SPRINKLERS,MANUAL_CALL_POINTS,ROOMS_COMPONENTS,SYSTEM_STATES,POWER_SUPPLIES,PERSONS,ACTION,COMPONENT_STATUSES,COMPONENTS,ROOMS,ROOM_STATES,EMERGENCY_LIGHTS_STATES,STATE_OFF,STATE_NORMAL,STATE_DEFECT,STATE_PREALARM,STATE_ALARM,AC_POWER,DC_POWER,PERSON_1,PERSON_2,PERSON_3,ACTION_TURN_ON_SYS,ACTION_TURN_OFF_SYS,ACTION_TURN_ON_CMP,ACTION_TURN_OFF_CMP,ACTION_FIX_COMPONENT,STATUS_ON,STATUS_OFF,STATUS_DEFECT,STATUS_PREALARM,STATUS_ALARM,CMP_SD_1,CMP_SD_2,CMP_SD_3,CMP_SD_4,CMP_SD_5,CMP_MCP_1,CMP_MCP_2,CMP_MCP_3,CMP_MCP_4,CMP_MCP_5,CMP_SPKR_1,CMP_SPKR_2,CMP_SPKR_3,CMP_SPKR_4,CMP_SPKR_5,ROOM_1,ROOM_2,ROOM_3,ROOM_4,ROOM_5,SECURE,ALERT,DANGER,LIGHTS_OFF,BLINK_YELLOW,BLINK_RED | ? | emergency_lights,rooms,has_electricity,components,panel_events_log,power_supply,system_state | ? | control_panel_info,turn_on_system,turn_off_system,turn_on_component,turn_off_component,fix_component,activate_call_point,env_component_malfunction,env_start_blackout,env_stop_blackout,env_put_smoke,env_clear_smoke,env_set_on_fire,env_put_out_fire | ? | ? | ? | Fire_Alarm_System);
  List_Of_HiddenCst_Ids(Machine(Fire_Alarm_System)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Fire_Alarm_System)) == (SMOKE_DETECTORS,SPRINKLERS,MANUAL_CALL_POINTS,ROOMS_COMPONENTS);
  List_Of_VisibleVar_Ids(Machine(Fire_Alarm_System)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Fire_Alarm_System)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Fire_Alarm_System)) == (Type(SYSTEM_STATES) == Cst(SetOf(etype(SYSTEM_STATES,0,4)));Type(POWER_SUPPLIES) == Cst(SetOf(etype(POWER_SUPPLIES,0,1)));Type(PERSONS) == Cst(SetOf(etype(PERSONS,0,2)));Type(ACTION) == Cst(SetOf(etype(ACTION,0,4)));Type(COMPONENT_STATUSES) == Cst(SetOf(etype(COMPONENT_STATUSES,0,4)));Type(COMPONENTS) == Cst(SetOf(etype(COMPONENTS,0,14)));Type(ROOMS) == Cst(SetOf(etype(ROOMS,0,4)));Type(ROOM_STATES) == Cst(SetOf(etype(ROOM_STATES,0,2)));Type(EMERGENCY_LIGHTS_STATES) == Cst(SetOf(etype(EMERGENCY_LIGHTS_STATES,0,2))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Fire_Alarm_System)) == (Type(STATE_OFF) == Cst(etype(SYSTEM_STATES,0,4));Type(STATE_NORMAL) == Cst(etype(SYSTEM_STATES,0,4));Type(STATE_DEFECT) == Cst(etype(SYSTEM_STATES,0,4));Type(STATE_PREALARM) == Cst(etype(SYSTEM_STATES,0,4));Type(STATE_ALARM) == Cst(etype(SYSTEM_STATES,0,4));Type(AC_POWER) == Cst(etype(POWER_SUPPLIES,0,1));Type(DC_POWER) == Cst(etype(POWER_SUPPLIES,0,1));Type(PERSON_1) == Cst(etype(PERSONS,0,2));Type(PERSON_2) == Cst(etype(PERSONS,0,2));Type(PERSON_3) == Cst(etype(PERSONS,0,2));Type(ACTION_TURN_ON_SYS) == Cst(etype(ACTION,0,4));Type(ACTION_TURN_OFF_SYS) == Cst(etype(ACTION,0,4));Type(ACTION_TURN_ON_CMP) == Cst(etype(ACTION,0,4));Type(ACTION_TURN_OFF_CMP) == Cst(etype(ACTION,0,4));Type(ACTION_FIX_COMPONENT) == Cst(etype(ACTION,0,4));Type(STATUS_ON) == Cst(etype(COMPONENT_STATUSES,0,4));Type(STATUS_OFF) == Cst(etype(COMPONENT_STATUSES,0,4));Type(STATUS_DEFECT) == Cst(etype(COMPONENT_STATUSES,0,4));Type(STATUS_PREALARM) == Cst(etype(COMPONENT_STATUSES,0,4));Type(STATUS_ALARM) == Cst(etype(COMPONENT_STATUSES,0,4));Type(CMP_SD_1) == Cst(etype(COMPONENTS,0,14));Type(CMP_SD_2) == Cst(etype(COMPONENTS,0,14));Type(CMP_SD_3) == Cst(etype(COMPONENTS,0,14));Type(CMP_SD_4) == Cst(etype(COMPONENTS,0,14));Type(CMP_SD_5) == Cst(etype(COMPONENTS,0,14));Type(CMP_MCP_1) == Cst(etype(COMPONENTS,0,14));Type(CMP_MCP_2) == Cst(etype(COMPONENTS,0,14));Type(CMP_MCP_3) == Cst(etype(COMPONENTS,0,14));Type(CMP_MCP_4) == Cst(etype(COMPONENTS,0,14));Type(CMP_MCP_5) == Cst(etype(COMPONENTS,0,14));Type(CMP_SPKR_1) == Cst(etype(COMPONENTS,0,14));Type(CMP_SPKR_2) == Cst(etype(COMPONENTS,0,14));Type(CMP_SPKR_3) == Cst(etype(COMPONENTS,0,14));Type(CMP_SPKR_4) == Cst(etype(COMPONENTS,0,14));Type(CMP_SPKR_5) == Cst(etype(COMPONENTS,0,14));Type(ROOM_1) == Cst(etype(ROOMS,0,4));Type(ROOM_2) == Cst(etype(ROOMS,0,4));Type(ROOM_3) == Cst(etype(ROOMS,0,4));Type(ROOM_4) == Cst(etype(ROOMS,0,4));Type(ROOM_5) == Cst(etype(ROOMS,0,4));Type(SECURE) == Cst(etype(ROOM_STATES,0,2));Type(ALERT) == Cst(etype(ROOM_STATES,0,2));Type(DANGER) == Cst(etype(ROOM_STATES,0,2));Type(LIGHTS_OFF) == Cst(etype(EMERGENCY_LIGHTS_STATES,0,2));Type(BLINK_YELLOW) == Cst(etype(EMERGENCY_LIGHTS_STATES,0,2));Type(BLINK_RED) == Cst(etype(EMERGENCY_LIGHTS_STATES,0,2));Type(SMOKE_DETECTORS) == Cst(SetOf(etype(COMPONENTS,"[SMOKE_DETECTORS","]SMOKE_DETECTORS")));Type(SPRINKLERS) == Cst(SetOf(etype(COMPONENTS,"[SPRINKLERS","]SPRINKLERS")));Type(MANUAL_CALL_POINTS) == Cst(SetOf(etype(COMPONENTS,"[MANUAL_CALL_POINTS","]MANUAL_CALL_POINTS")));Type(ROOMS_COMPONENTS) == Cst(SetOf(etype(ROOMS,0,4)*SetOf(etype(COMPONENTS,0,14)))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Fire_Alarm_System)) == (Type(emergency_lights) == Mvl(etype(EMERGENCY_LIGHTS_STATES,?,?));Type(rooms) == Mvl(SetOf(etype(ROOMS,0,4)*etype(ROOM_STATES,0,2)));Type(has_electricity) == Mvl(btype(BOOL,?,?));Type(components) == Mvl(SetOf(etype(COMPONENTS,0,14)*etype(COMPONENT_STATUSES,0,4)));Type(panel_events_log) == Mvl(SetOf(btype(INTEGER,?,?)*(etype(PERSONS,?,?)*etype(ACTION,?,?))));Type(power_supply) == Mvl(etype(POWER_SUPPLIES,?,?));Type(system_state) == Mvl(etype(SYSTEM_STATES,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Fire_Alarm_System)) == (Type(env_put_out_fire) == Cst(No_type,etype(ROOMS,?,?));Type(env_set_on_fire) == Cst(No_type,etype(ROOMS,?,?));Type(env_clear_smoke) == Cst(No_type,etype(ROOMS,?,?));Type(env_put_smoke) == Cst(No_type,etype(ROOMS,?,?));Type(env_stop_blackout) == Cst(No_type,No_type);Type(env_start_blackout) == Cst(No_type,No_type);Type(env_component_malfunction) == Cst(No_type,etype(COMPONENTS,?,?));Type(activate_call_point) == Cst(No_type,etype(ROOMS,?,?));Type(fix_component) == Cst(No_type,etype(PERSONS,?,?)*etype(COMPONENTS,?,?));Type(turn_off_component) == Cst(No_type,etype(PERSONS,?,?)*etype(COMPONENTS,?,?));Type(turn_on_component) == Cst(No_type,etype(PERSONS,?,?)*etype(COMPONENTS,?,?));Type(turn_off_system) == Cst(No_type,etype(PERSONS,?,?));Type(turn_on_system) == Cst(No_type,etype(PERSONS,?,?));Type(control_panel_info) == Cst(etype(SYSTEM_STATES,?,?)*(etype(EMERGENCY_LIGHTS_STATES,?,?)*(etype(POWER_SUPPLIES,?,?)*SetOf(etype(COMPONENTS,?,?)*etype(COMPONENT_STATUSES,?,?)))),No_type));
  Observers(Machine(Fire_Alarm_System)) == (Type(control_panel_info) == Cst(etype(SYSTEM_STATES,?,?)*(etype(EMERGENCY_LIGHTS_STATES,?,?)*(etype(POWER_SUPPLIES,?,?)*SetOf(etype(COMPONENTS,?,?)*etype(COMPONENT_STATUSES,?,?)))),No_type))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
