public class NewAndExistingController {

    public Account account {get; private set;}
    
    public NewAndExistingController(){
        Id id = ApexPages.currentPage().getParameters().get('Id');
        account = (id==null)?new Account():[select Id, Name, Phone, Industry from Account where Id =: id];
        
    }
    
    public PageReference saveTudo(){
        try{
            upsert(account);
        }catch(System.DmlException e){
            ApexPages.addMessages(e);
            return null;
        }
        PageReference redirectSuccess=new ApexPages.StandardController(Account).view();
        return redirectSuccess;
    }
}