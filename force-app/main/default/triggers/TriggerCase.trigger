trigger TriggerCase on Case (before insert) {
	if (Trigger.isInsert) {
        if (Trigger.isBefore) {          	            
            caseHandler handler = new caseHandler(Trigger.new);
            
            handler.runBeforeInsert();
        }        	
    }
}