trigger CaseTrigger on Case (before insert, before update, after insert, after update ) {

    // Show the message as 'Case origin is changed for [Case Number]' whenever case origin field value is changed.

    if (trigger.isBefore && trigger.isUpdate) {
        for (case myCase : trigger.new) {
            if (myCase.Origin != trigger.oldMap.get(myCase.Id).Origin) {
                System.debug('Case origin is changed for ' + myCase.CaseNumber);
            }       
        }    
    }
    if (trigger.isBefore && trigger.isInsert) {
        CaseTriggerHandler.updateCase(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    if (trigger.isBefore && trigger.isInsert) {
        opportunityTriggerHandler.opportunityDemo5(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
    }


    /*System.debug('We are in the triggers');
    if (trigger.isBefore) {
        System.debug('We are in the before triggers');
        if (trigger.isInsert) {
            System.debug('We are in the before-Insert triggers'); 
        }
        if (trigger.isUpdate) {
            System.debug('We are in the before-Update triggers');
        }  
    }
    if (trigger.isAfter) {
        System.debug('We are in the after triggers');
        if (trigger.isInsert) {
            System.debug('We are in the after-Insert triggers'); 
        }
        if (trigger.isUpdate) {
            System.debug('We are in the after-Update triggers');
        } 
    }*/

}


// 1. Create a trigger on Case object named as “CaseTrigger”. Show the debug messages as follows:
// a. Triggers - "We are in the triggers"
// b. after triggers - "We are in the after triggers"
// c. before triggers - "We are in the before triggers"
// d. before Update - "We are in the before-Update triggers"
// e. before Insert - "We are in the before-Insert triggers"
// f. after update - "We are in the after-Update triggers"
// g. after Insert - "We are in the after-Insert triggers".