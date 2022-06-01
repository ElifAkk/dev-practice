// Write a logic to Create tasks for all the opportunities other than the closed won or closed lost 
// and on which there was no activity since last 7 days.


public class TaskOppBatch implements Database.Batchable<SObject>, Database.stateful{
    public integer count = 0;
    public Database.QueryLocator start(database.BatchableContext bc){
        database.QueryLocator q1 = database.getQueryLocator([select id, stageName, OwnerId, CloseDate from Opportunity where stageName NOT IN ('Closed Lost' , 'Closed Won') and LastModifiedDate < LAST_N_DAYS :7]);
        system.debug(q1);
        return q1;
    }
    public void execute(Database.BatchableContext bc, List<Opportunity> oppList){
    List<task> taskList = new List<task>();
    for (Opportunity eachOpp: oppList) {
        task tsk = new Task();
        tsk.Subject = system.label.subject;
        tsk.Description = system.label.description;
        tsk.WhatId = eachOpp.Id;
        tsk.OwnerId = eachOpp.OwnerId;
        tsk.Status = 'In Progress';
        //Today if Opportunity close date is already passed otherwise
        //Opportunity Close Date – 2 days.
        if (eachOpp.CloseDate < date.today()) {
        tsk.ActivityDate = date.today();        
        } else {
            tsk.ActivityDate = eachOpp.CloseDate.addDays(-2);
        }
        taskList.add(tsk);
        count++;
    }
    if (!tasklist.isEmpty()) {
        insert taskList;
    }
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Number of task created= ' + count);
    }
}
