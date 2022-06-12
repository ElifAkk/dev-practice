public with sharing class PaymentTriggerHandler {
     //  Create a number custom field on Customer__c object and name it as 'Number of Online Payments'. Now write a trigger to achieve the following functionality: Number of Online Payments – It should show the number of related online payments made for a particular customer. This value should update as soon as any of the following event occurs:
    
    //A new online payment is added.
    public static void paymentAdded(List<Payment__c> TriggerNew, Map<Id,Payment__c> TriggerNewMap) {

        Set<Id> paySetId = new Set<Id>();
        for (Payment__c eachPayment : TriggerNew) {
            if (eachPayment.Mode__c == 'Online') {
                //MyCustomer__c relationship adi oldugu icin direk ID ye ulasabiliyoruz.
                paySetId.add(eachPayment.MyCustomer__c);
            }     
        }
        if (!paySetId.isEmpty()) {
            numberOfPaymentsField(paySetId);
        }
    }
    //common method for all
    public static void numberOfPaymentsField(Set<Id> customerIdSet) {
        List<MyCustomer__c> listCustomer = [SELECT id, Number_of_Online_Payments__c,
                                            (SELECT Id FROM Payments__r WHERE Mode__c = 'Online')
                                            FROM MyCustomer__c
                                            WHERE id =: customerIdSet];
            List<MyCustomer__c> updatedCustomerList = new List<MyCustomer__c>();                                
            for (MyCustomer__c eachCustomer : listCustomer) {
                eachCustomer.Number_of_Online_Payments__c = eachCustomer.Payments__r.size();
                updatedCustomerList.add(eachCustomer);
            } 
            if(!updatedCustomerList.isEmpty()){
                update updatedCustomerList;
            }                               
    }
    public static void numberOfUpdate(List<Payment__c> triggerNew, Map<id, Payment__c> triggerOldMap) {
        Set<Id> setIds = new set<id>();
        for (Payment__c eachPayment : triggerNew) {
            payment__c oldPayment= triggerOldMap.get(eachPayment.Id);
            if (eachPayment.Mode__c != oldPayment.Mode__c) {
                setIds.add(eachPayment.MyCustomer__c);
            }
            //Reparenting scenario
            if (eachPayment.MyCustomer__c != oldPayment.MyCustomer__c) {
                setIds.add(eachPayment.MyCustomer__c);//New CustomerID added
                setIds.add(oldPayment.MyCustomer__c);//Old CustomerId added
            }
        }
        if (!setIds.isEmpty()) {
            numberOfPaymentsField(setIds);
        }
    }
    //An online payment is deleted.
    public static void paymentDeleted(List<Payment__c> Triggerold) {
        Set<Id> setIds = new set<id>();
        for (Payment__c  eachPayment : triggerOld) {
            
            if (eachPayment.Mode__c == 'Online') {
                setIds.add(eachPayment.MyCustomer__c);
            }
        }
        if (!setIds.isEmpty()) {
            numberOfPaymentsField(setIds);
        }

    }
    public static void paymentUnDeleted(List<Payment__c> TriggerNew) {

        Set<Id> paySetId = new Set<Id>();
        for (Payment__c eachPayment : TriggerNew) {
            if (eachPayment.Mode__c == 'Online') {
            
                paySetId.add(eachPayment.MyCustomer__c);
            }     
        }
        if (!paySetId.isEmpty()) {
            numberOfPaymentsField(paySetId);
        }
    }

}