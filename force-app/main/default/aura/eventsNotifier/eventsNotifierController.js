({
	fireComponentEvent : function(component, event, helper) {
		var parentName = component.get("v.parentName");
        
        var compEvents = component.getEvent("componentEventFired");
        compEvents.setParam({"context":parentName});
        compEvents.fire();
	},
    
    fireApplicationEvent : function(component, event, helper) {
		var parentName = component.get("v.parentName");
        
        var appEvents = $A.get("e.c:appEvent");
        appEvents.setParam({"context":parentName});
        appEvents.fire();
	},
})