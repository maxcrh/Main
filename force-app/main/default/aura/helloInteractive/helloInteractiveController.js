({
    handleClick : function(component, event, helper) {
        var btnClicked = event.getSource();
        var mensagem = btnClicked.get("v.label");
        component.set("v.message", mensagem);
    }
})