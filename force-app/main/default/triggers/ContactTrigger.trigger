trigger ContactTrigger on Contact (before insert, before Update, after Update) {
    if (trigger.isBefore && trigger.isUpdate) {
        System.debug('“Contacts records are being updated and you are getting this message from a debug in contactTrigger');  
    }
}