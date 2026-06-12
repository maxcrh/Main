public class StringArrayTest {
    public static List<String> generateStringArray(Integer Num){
        
        List<String> Lista = new List<String>();
        
        for (Integer i=0;i<Num;i++){
			Lista.add('Test ' + i);
        }

		return Lista;        
    }
}