public class accountListController {
	
    public ApexPages.StandardSetController acct{
        get{
            if(acct == null){
                acct = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT NAME, ACCOUNTNUMBER FROM ACCOUNT]));
            }
         	return acct;
        }
        set;
    }
    
    public List<Account> getAccounts(){
        return (List<Account>)acct.getRecords();
    }
}