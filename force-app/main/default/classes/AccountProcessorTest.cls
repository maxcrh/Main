@IsTest
private class AccountProcessorTest {
  @IsTest
  private static void AccountTest() {
    Account NewAcct = New Account(Name = 'Teste Assinc Name');
    insert NewAcct;
      
    Contact NewCt = New Contact(LastName = 'Teste Assinc Contato', AccountId = NewAcct.Id);
    insert NewCt;
      
    List<Id> lstId = new List<Id>();
    lstId.add(NewAcct.Id);
           
    Test.startTest();
      AccountProcessor.countContacts(lstId);
    Test.stopTest();
  }
}