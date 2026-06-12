({
	createHero : function(component, hero) {
        //Cria a ação vinculada a classe apex que vai fazer a inserção, no get vai ser informado o método utilizado
		let action = component.get("c.saveHero");
        //Seta os parametros conforme enviado
        action.setParams({
            "hero" : hero
        }),
        //Aguarda assincronadamente o retorno para processar os valores
        action.setCallback(this, function(response){
            let state = response.getState();
            console.log('retorno: ' + state);
            if (state === "SUCCESS") {
				console.log('Inserido registro'); 
            }else if (state === "ERROR") {
                console.log('retornou erro: ', response.getError());
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        // log the error passed in to AuraHandledException
                        console.log("Error message: " + 
                                 errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);
	},
})