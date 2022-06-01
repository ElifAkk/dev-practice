public class CustomerDeleteHandler {
    public static void deletePayment(List<MyCustomer__c> custTriggerNew, List<MyCustomer__c> custTriggerOld, Map<id, MyCustomer__c> custTriggerNewMap, Map<id, MyCustomer__c> custTriggerOldMap){

        Set<ID> activeCustomers = new Set<ID>();
        Set<ID> inActiveCustomers = new Set<ID>();

        for (MyCustomer__c eachCust : custTriggerOld) {
            if (eachCust.active__c == true) {
                activeCustomers.add(eachCust.Id); 
            }else{
                inActiveCustomers.add(eachCust.Id);
            }  
        }
        if (!activeCustomers.isEmpty()) {
            List<Payment__c> payList = [select id from Payment__c where MyCustomer__c in :activeCustomers];
            if (!payList.isEmpty()) {
                delete payList;
            }
        }
        if (!inActiveCustomers.isEmpty()) {
            List<Payment__c> payList = [select id from Payment__c where MyCustomer__c in :inActiveCustomers and mode__c = 'Online'];
            if (!payList.isEmpty()) {
                delete payList;
        }
    }
}
}
   