({
    CliqueAqui : function(component, event, helper) {
        let textoEntrada = component.get("v.textoEntrada");
        console.log('Texto de entrada: ', textoEntrada);
        component.set("v.testeCampo", textoEntrada);

    }
})