@isTest
public with sharing class PaymentTriggerHandlerTest {
    @TestSetup
    static void makeData(){
       List<MyCustomer__c> myCustList = new List<MyCustomer__c>();
        for (integer i=0; i<200; i++) {
    
            MyCustomer__c cust = new MyCustomer__c();
            myCustList.add(cust);
        }
        insert myCustList;

        List<Payment__c> myPayList = new List<Payment__c>();
        for (MyCustomer__c eachCust : myCustList) {
             for (Integer i = 0; i < 10; i++) {
                 Payment__c p = new Payment__c();
                 p.MyCustomer__c = eachCust.id; 
                 if (i< 5 ) {
                     p.Mode__c = 'Online';     
                 } else{
                     p.Mode__c = 'Cash';
                 }
                myPayList.add(p);
             }     
        }
    }
    
        

        test.startTest();
        insert myPayList;
        test.stopTest();

        List<MyCustomer__c> customerList = [SELECT id, Number_of_Online_Payments__c FROM MyCustomer__c Limit 5];
        system.assertEquals(5, customerList[0].Number_of_Online_Payments__c);
}
    