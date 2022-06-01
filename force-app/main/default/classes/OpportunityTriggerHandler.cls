public class OpportunityTriggerHandler {
    public static void OpportunityDemo1(List<opportunity> oppTriggerNew, 
                                        List<opportunity> oppTriggerOld, 
                                        Map<id, opportunity> oppTriggerNewMap, 
                                        Map<id, opportunity> oppTriggerOldMap) {

        for (opportunity  eachOpp : oppTriggerNew) {
            System.debug(eachOpp.Name + ' - ' + eachOpp.CloseDate + ' - ' + eachOpp.Amount);
        }
        System.debug('Number of opportunities created : ' + oppTriggerNew.size());

    }
        /*Print the Old and New Amount field values in one line. Old and New Close Date field values in 
    another line for opportunity when opportunities are updated.*/

    public static void oppotunityDemo2(List<Opportunity> OppTriggerNew,
                                       List<Opportunity> OppTriggerOld,
                                       Map<id, Opportunity> OppTriggerNewMap,
                                       Map<id, Opportunity> OppTriggerOldMap){
        for (Opportunity eachOpp : OppTriggerNew) {
           
            Decimal oppNewValue = eachOpp.Amount;
            Decimal oppOldValue = OppTriggerOldMap.get(eachOpp.Id).Amount;
            System.debug('New Amount => ' + oppNewValue + ' Old Amount => ' + oppOldValue);

            Datetime oppNewCloseDate = eachOpp.CloseDate;
            Datetime oppOldCloseDate = OppTriggerOldMap.get(eachOpp.id).CloseDate;
            System.debug('New Close Date => ' + oppNewCloseDate + ' Old Close Date => ' + oppOldCloseDate);
        }
    }

    // When the StageName of an opportunity is updated, then print the value of description field and opportunity name.
    public static void OpportunityDemo3(List<opportunity> oppTriggerNew, 
                                        List<opportunity> oppTriggerOld, 
                                        Map<id, opportunity> oppTriggerNewMap, 
                                        Map<id, opportunity> oppTriggerOldMap) {
        for (opportunity eachopp : oppTriggerNew) {
            if (eachopp.StageName != oppTriggerOldMap.get(eachopp.Id).StageName) {
                System.debug('New description value: ' + eachopp.Description + ' , new opportuity name: '  + eachopp.name);
            }          
        }
    }
    
    public static void opportunityDemo4(List<Opportunity> OppTriggerNew,
                                        List<Opportunity> OppTriggerOld,
                                        Map<Id, Opportunity> OppTriggerNewMap,
                                        Map<Id, Opportunity> OppTriggerOldMap) {
     
            for (Opportunity eachOpp : OppTriggerOld) {
                if (eachOpp.StageName == 'Closed Won' || eachOpp.StageName == 'Closed Lost') {
                    
                    if (eachOpp.StageName != OppTriggerNewMap.get(eachOpp.id).StageName) { 
                        OppTriggerNewMap.get(eachOpp.id).stageName.addError('If the stage is Closed Won or Closed Lost you cannot update the status.');     
                    }
                }    
            }                                    
    }
    public static void opportunityDemo5(List<opportunity> OppTriggerNew, 
                                        List<opportunity>  OppTriggerOld,
                                        Map<ID, Opportunity> OppTriggerNewMap,
                                        Map<ID, Opportunity> OppTriggerOldMap){
        for (Opportunity eachOpp : OppTriggerNew) {
            if (eachOpp.StageName == 'Closed Won' || eachOpp.StageName == 'Closed Lost') {
            eachOpp.CloseDate = date.today();  
            }else{
            eachOpp.CloseDate = date.today().addDays(15);
            }
        }

    }
}
