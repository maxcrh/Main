public class TesteDatabaseMethod {
    public void testeDatabase(){
        APEX_Customer__c newCustomer = new APEX_Customer__c();
        newCustomer.name = 'Teste de DML normal';
        
        insert newCustomer;
        
        List<APEX_Invoice__c> lstInvoice = new List<APEX_Invoice__c>();
        
        APEX_Invoice__c newInvoice = new APEX_Invoice__c();
        newInvoice.APEX_Status__c = 'Pending';
        newInvoice.APEX_Amount_Paid__c = 25000000;
        newInvoice.APEX_Customer__c = newCustomer.Id;
        
        lstInvoice.add(newInvoice);
        
        APEX_Invoice__c newInvoice2 = new APEX_Invoice__c();
        newInvoice2.APEX_Status__c = 'Paid';
        newInvoice2.APEX_Amount_Paid__c = 75000000;
        
        lstInvoice.add(newInvoice2);
        
        List<Database.SaveResult> srList = Database.insert(lstInvoice, false);
        
        for(Database.SaveResult sr: srList){
            if(sr.isSuccess()){
                System.debug('inserido com sucesso o registro: ' + sr.getId());
            }else{
                for(Database.Error objError: sr.getErrors()){
                    System.debug('Um erro ocorreu');
                    System.debug(objError.getStatusCode() + ' ' + objError.getMessage());
                    System.debug('Campos afetados: ' + objError.getFields());
                }
            }
        }
        
        
        
    }
}