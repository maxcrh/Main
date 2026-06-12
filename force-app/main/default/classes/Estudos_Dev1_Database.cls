public class Estudos_Dev1_Database {
    
    //Classe para aplicação e testes de operações DML, SOQL e SOSL
    public void InsereContas(){
	
        //Inserindo conta sem método DATABASE
        Account acct1 = new Account();
        acct1.Name = 'Estudos_Dev1.';
        insert acct1;
        System.debug('A conta '+acct1.Name+' foi inserida com sucesso');
        
        //Inserindo com database
        List<Account> lstInsereConta = new List<Account>();
        integer i;
        for(i=0; i<5; i++){
            Account acct = new Account();
            acct.Name = 'Estudos_Dev1_Database.'+i;
            lstInsereConta.add(acct);
        }
        Database.SaveResult[] sr = Database.insert(lstInsereConta, false);
        List<String> pesquisaId = new List<String>();
        for(database.SaveResult srFor: sr){
            if(srFor.isSuccess()){
                System.debug('A conta '+ srFor.getId() +' foi inserida');
                pesquisaId.add(srFor.getId());
            }
        }
        List<Account> lstAccount = [SELECT NAME FROM ACCOUNT WHERE ID = :pesquisaId];
        System.debug(lstAccount);
    }

}