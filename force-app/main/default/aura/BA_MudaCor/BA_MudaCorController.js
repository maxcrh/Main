({
   
 getResponse: function(component, base) {
        // create a server side action.       
        var action = component.get("c.getCalloutResponseContents");
        // set the url parameter for getCalloutResponseContents method (to use as endPoint) 
        action.setParams({
            CaseId : component.get("v.recordId"),
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                 
                // set the response(return Map<String,object>) to response attribute.      
                component.set("v.response", response.getReturnValue());
                console.log(response.getReturnValue());
                console.log(component.get("v.recordId"));
                 console.log("Retorna",response.getReturnValue());
 
                // get the all rates from map by using key              
                var getAllCor = component.get("v.response")['cor_cadastro'];
                var getAllCorlimite = component.get("v.response")['cor_limite'];
                var getAllCorkyc = component.get("v.response")['cor_know_your_costumer'];  
                var getAllCorrestricao = component.get("v.response")['cor_restricao_total'];
                var getAllCorcontrato = component.get("v.response")['cor_contrato'];
                var getAllCorReceita = component.get("v.response")['cor_receita'];
                var getAllCorAdesao = component.get("v.response")['cor_adesao'];
                var getAllCorListaPositiva = component.get("v.response")['cor_lista_positiva'];
                        
          
                
                if(getAllCorListaPositiva == 'Inexistente'){
                    component.set("v.Detalhamento", true);
                }
       
                                
                component.set("v.ListCor", getAllCor);
                component.set("v.ListCor2", getAllCorlimite);
                component.set("v.ListCor3", getAllCorkyc);
                component.set("v.ListCor4", getAllCorcontrato);
                component.set("v.ListCor5", getAllCorReceita);
                component.set("v.ListCor6", getAllCorrestricao);  
                component.set("v.ListCor7", getAllCorAdesao);
                component.set("v.ListCor8", getAllCorListaPositiva);
             
				component.set("v.loaded", true);
                $A.get('e.force:refreshView').fire();
            }
        });
 
        $A.enqueueAction(action);
    },
  getResponselimite: function(component, base) {
        // create a server side action.       
        var action = component.get("c.getCalloutResponseContents");
        // set the url parameter for getCalloutResponseContents method (to use as endPoint) 
        action.setParams({
            CaseId : component.get("v.recordId"),
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                // set the response(return Map<String,object>) to response attribute.      
                component.set("v.response", response.getReturnValue());
                console.log(response.getReturnValue());
                console.log(component.get("v.recordId"));
 
                // get the all rates from map by using key              
                var getAllCorlimite = component.get("v.response")['cor_limite'];
               
                var list = [];
                // play a loop on rates object 
             
                // set the CurrencyList to ListOfCurrency attribute on component.           
                component.set("v.ListCor2", getAllCorlimite);
            }
        });
 
        $A.enqueueAction(action);
    },
      getResponseKYC: function(component, base) {
        // create a server side action.       
        var action = component.get("c.getCalloutResponseContents");
        // set the url parameter for getCalloutResponseContents method (to use as endPoint) 
        action.setParams({
            CaseId : component.get("v.recordId"),
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                // set the response(return Map<String,object>) to response attribute.      
                component.set("v.response", response.getReturnValue());
                console.log(response.getReturnValue());
                console.log(component.get("v.recordId"));
 
                // get the all rates from map by using key              
                var getAllCorkyc = component.get("v.response")['cor_know_your_costumer'];
               
                var list = [];
                // play a loop on rates object 
             
                // set the CurrencyList to ListOfCurrency attribute on component.           
                component.set("v.ListCor3", getAllCorkyc);
            }
        });
 
        $A.enqueueAction(action);
    },
         getResponseRestricao: function(component, base) {
        // create a server side action.       
        var action = component.get("c.getCalloutResponseContents");
        // set the url parameter for getCalloutResponseContents method (to use as endPoint) 
        action.setParams({
            CaseId : component.get("v.recordId"),
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                // set the response(return Map<String,object>) to response attribute.      
                component.set("v.response", response.getReturnValue());
                console.log(response.getReturnValue());
                console.log(component.get("v.recordId"));
 
                // get the all rates from map by using key              
                var getAllCorrestricao = component.get("v.response")['cor_restricao_total'];
               
                var list = [];
                // play a loop on rates object 
             
                // set the CurrencyList to ListOfCurrency attribute on component.           
                component.set("v.ListCor4", getAllCorrestricao);
            }
        });
 
        $A.enqueueAction(action);
    },
     getResponseContrato: function(component, base) {
        // create a server side action.       
        var action = component.get("c.getCalloutResponseContents");
        // set the url parameter for getCalloutResponseContents method (to use as endPoint) 
        action.setParams({
            CaseId : component.get("v.recordId"),
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                // set the response(return Map<String,object>) to response attribute.      
                component.set("v.response", response.getReturnValue());
                console.log(response.getReturnValue());
                console.log(component.get("v.recordId"));
 
                // get the all rates from map by using key              
                var getAllCorcontrato = component.get("v.response")['cor_contrato'];
               
                var list = [];
                // play a loop on rates object 
             
                // set the CurrencyList to ListOfCurrency attribute on component.           
                component.set("v.ListCor5", getAllCorcontrato);
            }
        });
 
        $A.enqueueAction(action);
    },
    getResponseReceita: function(component, base) {
        // create a server side action.       
        var action = component.get("c.getCalloutResponseContents");
        // set the url parameter for getCalloutResponseContents method (to use as endPoint) 
        action.setParams({
            CaseId : component.get("v.recordId"),
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                // set the response(return Map<String,object>) to response attribute.      
                component.set("v.response", response.getReturnValue());
                console.log(response.getReturnValue());
                console.log(component.get("v.recordId"));
 
                // get the all rates from map by using key              
                var getAllCorReceita = component.get("v.response")['cor_receita'];
               
                var list = [];
                // play a loop on rates object 
             
                // set the CurrencyList to ListOfCurrency attribute on component.           
                component.set("v.ListCor6", getAllCorReceita);
            }
        });
 
        $A.enqueueAction(action);
    },
    getResponseListaPositiva: function(component, base) {
        // create a server side action.       
        var action = component.get("c.getCalloutResponseContents");
        // set the url parameter for getCalloutResponseContents method (to use as endPoint) 
        action.setParams({
            CaseId : component.get("v.recordId"),
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                // set the response(return Map<String,object>) to response attribute.      
                component.set("v.response", response.getReturnValue());
                console.log(response.getReturnValue());
                console.log(component.get("v.recordId"));
 
                if(response.getReturnValue() == '{"relatorio_detalhado": []}'){
                    component.set("v.Detalhamento", 'Vazio');
                }
                console.log('Passei aqui');
                // get the all rates from map by using key              
                var getAllCorListaPositiva = component.get("v.response")['cor_lista_positiva']; //mudar o nome do ultimo parametro
              
                
                var list = [];
                // play a loop on rates object 
             
                // set the CurrencyList to ListOfCurrency attribute on component.           
                component.set("v.ListCor8", getAllCorListaPositiva);
                
            
        }
        });
 
        $A.enqueueAction(action);
    }, 
})