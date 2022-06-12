trigger PaymentTrigger on Payment__c (before insert,after insert, after update, before delete,after delete, after undelete) {

    if(trigger.isAfter && trigger.isInsert ){
       PaymentTriggerHandler.paymentAdded(trigger.new, trigger.newMap);
    }
    if(trigger.isAfter && trigger.isUpdate ){
        PaymentTriggerHandler.numberOfUpdate(trigger.new, trigger.oldMap);
    }
    if(trigger.isAfter && trigger.isDelete ){
        PaymentTriggerHandler.paymentDeleted(trigger.old);
    }
    if(trigger.isAfter && trigger.isUndelete ){
        PaymentTriggerHandler.paymentUnDeleted(trigger.new);
    }
    
    
}
    


    

