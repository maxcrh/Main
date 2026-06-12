public class customListController {
	//Do jeito que foi mostrado no curso
    public ApexPages.StandardSetController opps{
        get{
            if(opps == null){
                opps=new ApexPages.StandardSetController(Database.getQueryLocator([select Name, CloseDate from Opportunity]));
            }
            return opps;
        }
        set;
    }
    
    public List<Opportunity> getOppt(){
        return (List<Opportunity>)opps.getRecords();
    }
    /* Como eu fiz do meu jeito, só esse método e funcionou, traz todos os registros
     * public List<Opportunity> getOppt(){
        List<Opportunity> lstOppt = [select Id, Name, CloseDate from Opportunity];
        
        return lstOppt;
    }*/
}