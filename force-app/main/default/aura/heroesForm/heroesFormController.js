({
	clickCreate : function(component, event,  helper) {
        //Pega os valores do componente, registro único e passa para helper 
    	let newHero = component.get("v.newHero");
 		//Chama a helper e passa o componente e o novo valor
        helper.createHero(component, newHero);	
	},
})