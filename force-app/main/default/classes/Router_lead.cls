public class Router_lead {
    
    @InvocableMethod(label='Route leads' description='update leads in company name when the check box router' category='Lead')
    public static void route_leads(){
       List<Lead> lLead = [SELECT ID, Company FROM LEAD WHERE route_lead__c = true] ;
       List<Lead> newLead = new List<Lead>();      
        
        for(Lead l1 : lLead){
            Lead updLead = new Lead();
            updLead.Id = l1.Id;
     		updLead.Company = l1.Company + ' show';
            
            newLead.add(updLead);
        }
        update newLead;
    }
}