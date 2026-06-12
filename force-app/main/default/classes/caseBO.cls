public class caseBO {
    public static void atualiaCaso(List<Case> triggerNew){
        List<Case> casesss = new List<Case>();
        
        for(Case newCase : triggerNew){
            casesss.add(newCase);
        }
        
        for(Case a : triggerNew){
            for(Case idTeste: casesss){
            	a.Description = 'Teste Max Trigger Handler mmmmaxxxxxxx!!!!!!';    
        }
    }
}
}