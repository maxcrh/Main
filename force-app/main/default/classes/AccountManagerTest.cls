@isTest
private class AccountManagerTest {
 @isTest static void testGetAccountById() {
        Id recordId = createTestAccountRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://maxms-dev-ed.lightning.force.com/services/apexrest/Accounts/'
            + recordId +'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test Account Web', thisAccount.Name);
    }
    
    static Id createTestAccountRecord(){
		Account AcctTeste = New Account(Name = 'Test Account Web');
        insert AcctTeste;
        
        Contact ctTeste = New Contact(AccountId = AcctTeste.Id, LastName = 'Test record web');
        insert ctTeste;
        
        return AcctTeste.Id;
    }
}