public class OlderAccountsUtility {
    public static void updateOlderAccounts(){
        
        List<Account> lstOldAccount = [SELECT ID, DESCRIPTION FROM ACCOUNT ORDER BY CREATEDDATE ASC LIMIT 5];
        
        FOR(Account a : lstOldAccount){
            a.Description = 'Heritage Account';
        }
        Update lstOldAccount;
    }

}