@isTest
private class LeadProcessorTest {
    @testSetup 
    static void setup() {
        List<Lead> lstLead = new List<Lead>();

        // insert 200 Leads
        for (Integer i=0;i<200;i++) {
            lstLead.add(new Lead(LastName='LeadTest '+i, 
                Company='Company Max', MobilePhone='+5511963700000'));
        }
        insert lstLead;
    }
    
    static testmethod void test() {        
        Test.startTest();
        	LeadProcessor lp = new LeadProcessor();
        	Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from Lead where LeadSource = 'Dreamforce']);
    }
    
}