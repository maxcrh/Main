public class myControllerExtension {
	
    private final Account acct;
    public myControllerExtension(ApexPages.StandardController controller){
        this.acct = (Account)controller.getRecord();
    }
    
    public String getGretting(){
	 return 'Oi ' + acct.name + ' (' + acct.id + ')';
    }
}