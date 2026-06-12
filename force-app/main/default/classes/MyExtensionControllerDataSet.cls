public class MyExtensionControllerDataSet {

    public MyExtensionControllerDataSet(ApexPages.StandardController controller)
    {
       	List<String> novo = new List<String>();
        
        for(integer i=0; i<50; i++){
            novo.add('NOVO ELEMENTO ' + i);
        }
    }
}