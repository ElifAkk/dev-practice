public class AccountTriggerHandler {

    // 1. When the Annual revenue field value is reduced from the previous value then show the following message:
    // ‘Annual Revenue for an account cannot be reduced’. And do not allow the user to save the record.

    /*public static void ValidationAccount(List<opportunity> oppTriggerNew, 
                                        List<opportunity> oppTriggerOld, 
                                        Map<id, opportunity> oppTriggerNewMap, 
                                        Map<id, opportunity> oppTriggerOldMap) {
        
        for (account acc : oppTriggerNew) {
            if (acc.AnnualRevenue < oppTriggerOldMap.get(acc.id).AnnualRevenue) {
                acc.addError('Annual Revenue for an account cannot be reduced');
            }         
        }                                                    
    }*/
//     Whenever New Account Record is created then needs to create associated Contact Record 
// automatically.
// account name as contact last name
// account phone as contact phone

//WEEK 7 ASSIGNMENT//
    /*1. Whenever New Account Record is created then needs to create associated Contact Record automatically.
    account name as contact last name
    account phone as contact phone*/

    public static void CreateAssociatedCnt(List<Account> AccTriggerNew,
                                           List<Account> AccTriggerOld,
                                           Map<id, Account> AccTriggerNewMap,
                                           Map<id, Account> AccTriggerOldMap) {
        List<Contact> cntList = new List<Contact>();
        for (Account eachAcc : AccTriggerNew) {
            Contact cnt = new Contact();
            cnt.LastName = eachAcc.Name;
            cnt.Phone = eachAcc.Phone;
            cnt.AccountId = eachAcc.id;
            cntList.add(cnt);
        }                                    
        insert cntList;
    }

        // List<Contact> cntList = new List<Contact>();
        // for (account eachAcc : Acc) {
            
        // }


    }
    //     Write a trigger on the Account when the Account is updated check all opportunities related to 
// the account. Update all Opportunities Stage to close lost if stage name not already set to close 
// won.

    public static void updateOpportunityCloseLost(List<account> accTriggerNew, 
                                            List<account> accTriggerOld, 
                                            Map<id, account> accTriggerNewMap, 
                                            Map<id, account> accTriggerOldMap) {

        Set<id> accSetId = new Set<id>();
        for (account acc : accTriggerNew) {
            accSetId.add(acc.Id);        
        }

        List<opportunity> oppList = [select id, name, stageName from Opportunity where accountId in :accSetId and stageName != 'Closed Won'];
        
        if (!oppList.isEmpty()) {
            for (opportunity eachOpp : oppList) {
                eachOpp.StageName = 'Closed Lost'; 
            }
            update oppList;    
        }
    }

   /* When Account Phone field is updated then make sure its related contacts should get updated as 
    below:
    ➔ Old phone from account to otherPhone in contact
    ➔ new phone from account to mobilePhone in contact.*/

    public static void accPhoneUpdate(List<Account> AccTriggerNew,
                                    List<Account> AccTriggerOld,
                                    Map<id, Account> AccTriggerNewMap,
                                    Map<id, Account> AccTriggerOldMap){
      
        Set<id> accSetId = new Set<id>();
        for (account acc : accTriggerNew) {
            Account oldAcc = AccTriggerOldMap.get(acc.id);
            if (acc.Phone != oldAcc.Phone) {
            accSetId.add(acc.Id);        
            }
        }

    List<Contact> cntList = [select otherPhone,mobilePhone, accountId from contact where accountId in :accSetId];

    if (!cntList.isEmpty()) {
        for (Contact eachCon : cntList) {
        eachCon.otherPhone =  AccTriggerOldMap.get(eachCon.AccountId).phone;
        eachCon.mobilePhone = AccTriggerNewMap.get(eachCon.AccountId).phone;
        }
    update cntList;
    }
}
