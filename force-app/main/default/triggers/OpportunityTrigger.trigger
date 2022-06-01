trigger OpportunityTrigger on Opportunity (before insert, before update, after insert, after update) {
    // if (trigger.isUpdate && trigger.isBefore) {
    //     for (opportunity Opp : trigger.new) {
    //             System.debug('This is old name: ' + trigger.oldMap.get(opp.id).Name + '- this is new name: ' + opp.Name);

    //             System.debug('This is old amount: ' + trigger.oldMap.get(opp.id).Amount + '- this is new amount: ' + opp.Amount);
    //     }       
    // }

    if (trigger.isBefore && trigger.isInsert) {
        OpportunityTriggerHandler.OpportunityDemo1(Trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
        
    }
    if (trigger.isBefore && trigger.isUpdate) {
        OpportunityTriggerHandler.oppotunityDemo2(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    if (trigger.isBefore && trigger.isUpdate) {
        OpportunityTriggerHandler.OpportunityDemo3(Trigger.new, trigger.old, trigger.newMap, trigger.oldMap); 
        OpportunityTriggerHandler.opportunityDemo4(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }
}                                        
