public class dragon {
	private String name;
    private integer size;
    
    public dragon(String n, Integer s){
        name=n;
        size=s;
    }
    public void setName(String n){
        name = n;
    }
    
    public void setSize(Integer s){
        size = s;
    }
    
    public void show(){
        System.debug('O nome do meu dragão é: '+name);
        System.debug('O tamanho do meu dragão é: '+size);
    }
}