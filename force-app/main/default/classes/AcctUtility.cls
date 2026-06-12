public class AcctUtility {
    public static void mainProcessing(){
        try{
        	insertAccount();    
        }catch(AcctException ae){
            System.debug('Mensagem: '+ae.getMessage());
            System.debug('Causa: '+ae.getCause());
            System.debug('Erro na linha: '+ae.getLineNumber());
        }
        
    }
    
    public static void insertAccount(){
        try{
        	Account a=new Account();
	        insert a;
        }catch(DmlException e){
             throw new AcctException('Conta não pode ser criada pq faltam campos requeridos', e);
        }
    }
}