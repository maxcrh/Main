({
    //Metodo chamado para recuperar os valores disparados pelo evento do formulário
	handleCreateHero : function(component, event, helper) {
        //Busca os dados do evento baseado no nome do evento
        let createHero = event.getParam("hero");
        // Chama a helper passando o retorno do evento e o componente
        helper.createHero(component, createHero);
	},
})