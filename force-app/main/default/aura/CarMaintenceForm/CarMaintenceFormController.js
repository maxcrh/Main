({
	clickCreate : function(component, event, helper) {
        let lValidExpense = component.find("expenseform").reduce(function(validado, itemAtual){
          itemAtual.showHelpMessageIfInvalid();
          return validado && itemAtual.get('v.validity').valid;
        }, true);
        
        if(lValidExpense){
            let newExpense = component.get("v.newExpenseCar");
            console.log("Create expense: " + JSON.stringify(newExpense));
            helper.createExpense(component, newExpense);
        }
	}
})