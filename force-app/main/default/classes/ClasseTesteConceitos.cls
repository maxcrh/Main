public class ClasseTesteConceitos {
    
    public List<Account> getAccount(){
		return [SELECT ID, NAME FROM ACCOUNT];        
    }
    
    public static String retornaFrase(){
        System.debug('Nova Frase');
        return 'Frase';
    }

}