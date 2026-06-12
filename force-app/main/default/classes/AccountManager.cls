@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing  class AccountManager{
    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        // grab the account from the end of the URL
        String accountId = request.requestURI.substringBetween('Accounts/','/contacts');
        Account result = [SELECT ID, Name, (SELECT ID, NAME FROM CONTACTS)
                        FROM Account
                        WHERE Id = :accountId LIMIT 1];
        return result;
    }
}