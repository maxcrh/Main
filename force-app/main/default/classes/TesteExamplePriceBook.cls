@isTest 
public class TesteExamplePriceBook {
    
    @testSetup
    static void addPriceBook(){
	 Id pid = Test.getStandardPricebookId();
        
     System.debug(pid);
    }

}