public class AccountUtils{
    public static List<Account> accountsByState (string ST) {
        List<Account> AccountList = [Select ID, name from Account where BillingState = :ST];
        return AccountList;
    }
}