@isTest
public class CustomerDeleteHandlerTest {
    @TestSetup
    static void makeData(){ 
        MyCustomer__c cust = new MyCustomer__c();
        cust.active__c = true;
        
        MyCustomer__c cust2 = new MyCustomer__c();
        cust2.active__c = false;

        MyCustomer__c cust3 = new MyCustomer__c();
        cust.active__c = true;

        MyCustomer__c cust4 = new MyCustomer__c();
        cust2.active__c = false;

        List<MyCustomer__c> listCust = new List<MyCustomer__c>{cust, cust2, cust3, cust4};
        insert listCust;

        List<Payment__c> payList = new List<Payment__c>();
        for (MyCustomer__c c : listCust) {
            for (Integer i = 0; i < 200; i++) {
                Payment__c p = new Payment__c();
                if (i < 50) {
                    p.MyCustomer__c = cust.id; 
                    p.Mode__c = 'Cash';
                }else if (i < 100) {
                    p.MyCustomer__c = cust2.id;
                    p.Mode__c = 'Cash';
                }else if (i < 150) {
                    p.MyCustomer__c = cust3.id;
                    p.Mode__c = 'Online';
                }else {
                    p.MyCustomer__c = cust4.id;
                    p.Mode__c = 'Online';
                }
                payList.add(p);
            }    
        }
        insert payList;
    }
    @isTest
    private static void deletePayments() {
        test.startTest();
        CustomerDeleteHandler.deletePayment(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
        test.stopTest();

        List<Payment__c> pList = [select id, name from Payment__c];
        Boolean bs = pList.isEmpty();
        system.assertEquals(true, bs);

    }
}
