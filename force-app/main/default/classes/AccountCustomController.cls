public class AccountCustomController {
    
    public PageReference savetheRecord(){
        update account;
        return null;
    }
    
    private final Account account;
    
    public AccountCustomController(){
        account=[select id, Name, Site from Account where Id =: ApexPages.currentPage().getParameters().get('Id')];
    }
    
    public Account getAccont(){
        return account;
    }
}