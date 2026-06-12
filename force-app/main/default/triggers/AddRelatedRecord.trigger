trigger AddRelatedRecord on Account (after insert, after update) {
    
    List<Opportunity> AddOpp = new List<Opportunity>();
    
	for( Account a : [SELECT Id, Name FROM Account WHERE Id IN :Trigger.New AND
                                             Id NOT IN (SELECT AccountId FROM Opportunity)])
    {
        AddOpp.add(new Opportunity(Name=a.Name + ' Opportunity',
                                   StageName='Prospecting',
                                   CloseDate=System.today().addMonths(1),
                                   AccountId=a.Id));
    }
    
    if(AddOpp.size()>0){
    	insert AddOpp;    
    }    
}