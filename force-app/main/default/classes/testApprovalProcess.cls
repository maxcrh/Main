@isTest
private class testApprovalProcess {
    
    static testMethod void testApproval() {
   
        Opportunity opp = new Opportunity( Name = 'Test', CloseDate = System.Today().addDays( 3 ) );
        opp.StageName = 'Prospecting';
        opp.OwnerId = '00536000000gOHsAAM';
        opp.Discount_Percent__c = 50;
        insert opp;       
        
        Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
        req1.setComments( 'Submitting request for approval' );
        req1.setObjectId( opp.Id );
        req1.setNextApproverIds(new Id[] {opp.OwnerId});
        Approval.ProcessResult result = Approval.process( req1 );
                
        //Approval.ProcessResult result = ApprovalProcessController.submitForApproval( opp.Id, opp.OwnerId );
        System.assert( result.isSuccess() );       
        System.assertEquals( 'Pending', result.getInstanceStatus() ); 
        
        List<Id> lstId = new List<Id>();
        lstId.add(opp.Id);
        
        ApprovalProcessController.recallApproval( lstId );
       // result = ApprovalProcessController.recallApproval( lstId );
        //System.assert( result.isSuccess() );       
        //System.assertEquals( 'Removed', result.getInstanceStatus() );       
    }
    
}