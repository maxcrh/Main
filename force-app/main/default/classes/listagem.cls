public class listagem {
    public static void listagem(){
        List<String> minhaLista = new List<String>{'Murillo','Talita','Max'};
            
            for(String j:MinhaLista){
                if(j.startsWith('T')){
                    continue;
                }
                System.debug(j);
            }
    }
}