trigger CustomerTrigger on MyCustomer__c (before delete) {
    if (trigger.isBefore && trigger.isDelete) {
        CustomerDeleteHandler.deletePayment(trigger.new, trigger.old, trigger.newMap, trigger.oldMap); 
    }

}