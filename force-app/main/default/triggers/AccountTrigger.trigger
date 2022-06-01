trigger AccountTrigger on Account (before insert, after insert, before update, after update) {

    if (trigger.isAfter && trigger.isInsert){
        AccountTriggerHandler.CreateAssociatedCnt(trigger.New, trigger.Old, trigger.NewMap, trigger.OldMap);
    }

    if (trigger.isAfter && trigger.isUpdate) {
        AccountTriggerHandler.updateOpportunityCloseLost(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);  
    }

    if (trigger.isAfter && trigger.isUpdate) {
        AccountTriggerHandler.accPhoneUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);  
    }
    // if (trigger.isBefore && trigger.isUpdate) {
    //     AccountTriggerHandler.ValidationAccount(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
        
    // }



}