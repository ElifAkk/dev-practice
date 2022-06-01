public class DeleteClosedLostOppBatchSchedulable implements Schedulable{
    public void execute(SchedulableContext sc){
        database.executeBatch(new DeleteClosedLostOppBatch());
    }  
}
