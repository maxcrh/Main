public class testeJson {
    
    public static void a(){
        String input = '[{"01u9000000Ag0bbAAB":"203","01u9000000Ag0bZAAR":"23","resultado":[{"Id":"1","casa":"2","livro":"O senhor dos anéis"}],"Id":"00k0w000003HeFhAAK"}]';
    	
        List<Object> result = (List<Object>)JSON.deserializeUntyped(input); 
        
        Map<String,Object> map1;
        
    	System.debug(result);
        
        Object novo;
        for(Object obj : result) {
            map1 = (Map<String,Object>)obj; 
    	}
         system.debug(map1.get('resultado'));
        
        String novoJson = map1.get('resultado').toString();
        
        System.debug(novoJson);
        
        //List<Object> result2 = (List<Object>)JSON.deserializeUntyped(novoJson);
        //System.debug(result2);
        //for(Object obj2 : novo) {
          //  Map<String,Object> map2 = (Map<String,Object>)obj2;
        //}
    }
}