public class DeleteClosedLostOppBatch Implements Database.Batchable<SObject>, database.stateful{
    integer count = 0;
    public Database.QueryLocator start(database.BatchableContext bc){
        database.QueryLocator q1 = database.getQueryLocator([select id, stageName from Opportunity where stageName = 'Closed Lost']);
        system.debug(q1);
        return q1;
    }
    public void execute(Database.BatchableContext bc, List<Opportunity> scope){
        if(!scope.isEmpty()){
            count += scope.size();
            delete scope;
        }   
    }
    public void finish(Database.BatchableContext bc){
        system.debug('Opportunity List is deleted successfully!!');
        System.debug('The number of Deleted Closed Lost Opportunities= ' + count);
    }   
}
