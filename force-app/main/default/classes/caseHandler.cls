public class caseHandler {
    public List<Case> triggerNew;
    
    public caseHandler(List<Case> cDados){
		this.triggerNew = cDados;
    }
    
    public void runBeforeInsert(){
        caseBO.atualiaCaso(triggerNew);
    }
}