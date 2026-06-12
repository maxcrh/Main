public class listas {
    public static void listas(){
        List<Integer> myList = new List<Integer> {5,10,15,20};
        
            for(Integer j=0;j<=myList.size()-1;j++){
                System.debug(myList[j]);
                System.debug(myList.get(j));
            }
    }
}