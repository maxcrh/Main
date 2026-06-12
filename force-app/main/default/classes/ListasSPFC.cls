public class ListasSPFC {
    public static void ListaSP(){
        List<String> L = new List<String>();
        L.add('Lucas');
        L.add('LF9');
        L.add('Aloisio Chulapa');
        System.debug(L);
        L.add(0,'Ceni');
        L.add(1,'Rai');
        System.debug(L);
        L.remove(2);
        System.debug('Lista de ídolos aposentados: '+L);
    }
}