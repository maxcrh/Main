global class AccountProcessor {
	@future
   	public static void countContacts(List<Id> recordIds)
    {    
        List<Account> accounts = [Select Id, Number_of_Contacts__c, (SELECT Id from Contacts) from Account Where Id IN :recordIds];   
        for(Account acct :accounts){
            List<Contact> cont = acct.contacts;
            acct.Number_of_Contacts__c = cont.size();
        }
        update accounts;
    }
}