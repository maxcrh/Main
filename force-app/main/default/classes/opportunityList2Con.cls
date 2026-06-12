public class opportunityList2Con {
    // ApexPages.StandardSetController must be instantiated
    // for standard list controllers
    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                
                List<testeController> nList = new List<TesteController>();
               	
                for(Integer i = 0; i<50 ;i++){
                    testeController lista = new testeController();
                    lista.Nome = 'Max ' + i;
                    lista.MeuTime = 'SPFC ' +i;
                }
                
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT Name, CloseDate FROM Opportunity]));
            }
            return setCon;
        }
        set;
    }
 
    // Initialize setCon and return a list of records
    public List<Opportunity> getOpportunities() {
        return (List<Opportunity>) setCon.getRecords();
    }
    
    public class testeController{
        Public String Nome {get;set;}
        Public String MeuTime {get;set;}
    }
}