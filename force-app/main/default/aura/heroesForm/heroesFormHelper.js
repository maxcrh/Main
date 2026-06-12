({
	createHero : function(component, newHero) {
        //Pega o evento criado no componente para criar um registro novo
        var createEvent = component.getEvent("createHero");
        //Seta os valores no formato JSON
        createEvent.setParams({ "hero": newHero });
        //Dispara o evento
        createEvent.fire();    
	},
})