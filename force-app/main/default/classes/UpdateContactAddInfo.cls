global class UpdateContactAddInfo implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select id, BillingStreet, BillingCity, BillingState,'+
                                       'BillingPostalCode,(Select id, MailingStreet, MailingCity,'+
                                        'MailingState, MailingPostalCode from Contacts) from Account'+
                                       'where BillingState=\'TX\'');
    }
    
    global void execute(Database.BatchableContext bc, List<Account> scope){
        List<Contact> contacts=new List<Contact>();
        for(Account acct:scope){
            for(Contact contact:acct.contacts){
                contact.MailingStreet = acct.BillingStreet;
                contact.MailingCity=acct.BillingCity;
                contact.MailingState=acct.BillingState;
                contact.MailingPostalCode=acct.BillingPostalCode;                    
                
                contacts.add(contact);
            }
        }
        update contacts;
    }
    
    global void finish(Database.BatchableContext bc){
        
    }
}