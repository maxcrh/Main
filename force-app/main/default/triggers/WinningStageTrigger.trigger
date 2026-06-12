trigger WinningStageTrigger on Opportunity (before update) {
    for(Opportunity a : trigger.new){
       	Opportunity oldOpp=Trigger.OldMap.get(a.Id);
      	Boolean OldOppCheck = oldOpp.StageName.equals('Closed Won'); 
        Boolean NewOppCheck = a.StageName.equals('Closed Won'); 
        
        if(!OldOppCheck && NewOppCheck){
            a.Is_Value_Correct__c=true;
        }
        
    }
}