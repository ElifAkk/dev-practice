trigger LeadTrigger on Lead (before insert) {
   /* Whenever a new Lead record is created then show "[LeadName] is created successfully".*/

   if (trigger.isBefore && trigger.isInsert) {
       for (Lead Ld : trigger.new) {
           System.debug(Ld.LastName + ' is created successfully'); 
       }
   }

/*3. Whenever Lead is created with LeadSource as Web then show "Rating should be Cold" message 
otherwise show "Rating should be hot".*/

    if (trigger.isBefore && trigger.isInsert) {
        for (Lead eachLd : trigger.new) {
            if (eachLd.LeadSource == 'Web') {
                System.debug('Rating should be Cold');    
            } else {
                System.debug('Rating should be hot');
            }
        }   
    }
}