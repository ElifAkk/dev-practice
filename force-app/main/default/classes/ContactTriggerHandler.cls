public class ContactTriggerHandler {

    // When a new contact is created for an existing account then set contact other phone as account phone.

    public static void updateNewContact(List<contact> CntTriggerNew,
                                        List<contact> CntTriggerOld,
                                        Map<id, contact> CntTriggerNewMap,
                                        Map<id, contact> CntTriggerOldMap) {

    Set<id> setCnt = new Set<id>();
    for (contact eachCnt : CntTriggerNew) {
        setCnt.add(eachCnt.AccountId);  
    }

    List<account> accList = [select id, name, phone from account where id in :setCnt ];

    if (!accList.isEmpty()) {
        Map<id, phone> mapAcc = new Map<id, phone>();

        for (contact eachCnt : CntTriggerNew) {
            
            eachCnt.OtherPhone = CntTriggerNewMap.get(eachCnt.AccountId).Phone
            
        }
        
    }
    
    }
}