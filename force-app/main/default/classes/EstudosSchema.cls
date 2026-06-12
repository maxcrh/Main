public class EstudosSchema {
    
    public static void estudos(){
        
        //pega todos os objetos com seus tokens
        Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
		System.debug(gd);
        
        //Relaciona todos os campos e propriedades de um sObject ou de um array de objetos
        Schema.DescribeSObjectResult[] Results = Schema.describeSObjects(new String[]{'Account','opportunity'});
        System.debug(Results);

        
        //descreve todos os aplicativos para o usuário corrente
        Schema.DescribeTabSetResult[] tabInfo = Schema.describeTabs();
        System.debug(tabInfo);
    }

}