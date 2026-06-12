public class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> ListAccount){
       for (Account a : ListAccount) {
               a.ShippingState = a.BillingState;
       }    
    }
}