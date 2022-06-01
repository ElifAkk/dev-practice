public  class CaseTriggerHandler {
    public static void updateCase(List<Case> csTriggerNew, 
                                    List<Case> csTriggerOld, 
                                    Map<ID, Case> csTriggerNewMap, 
                                    Map< ID, case> csTriggerOldMap) {
       for (Case eachCase : csTriggerNew) {
           if (eachCase.Origin== 'Email') {
               eachCase.Priority = 'Medium';
               eachCase.Status = 'New';
           }
       } 
    }
}