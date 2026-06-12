@RestResource(urlMapping='/getCharacter__c/*')
global with sharing class HeroesData {
    // para chamar o objeto customizado no workbench  ---           /services/apexrest/getCharacter__c?Tipo=Todos&Id=a0G1R00000lwj9NUAQ
    @HttpGet
    global static List<Character__c> getHeroes(){
        RestRequest req =  RestContext.request;
        
        List<Character__c> Heroes = new List<Character__c>();

        String param = req.params.get('Tipo');

        if(param == 'Todos'){
            Heroes = [SELECT Hero_name__c, Name FROM Character__c ORDER BY Hero_name__c ASC LIMIT 200];       
        } else if (param == 'Unico'){
            String id = req.params.get('Id');
            Heroes = [SELECT Hero_name__c, Name FROM Character__c WHERE Id = :id];
        }
        return Heroes;
    }

    @HttpPost
    global static Id createHero(String realname, String heroname, String team, Decimal hp, Decimal power){
        Character__c newHero = new Character__c();

        newHero.name = realname;
        newHero.Hero_name__c = heroname;
        newHero.Team_Heroes__c = team;
        newHero.HP__c = hp;
        newHero.Power__c = power;

        insert newHero;

        return newHero.Id;
    }

    @HttpPatch
    global static id updHero(){
        RestRequest req = RestContext.request;

        String heroId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);

        Character__c updHero = [SELECT Id FROM Character__c WHERE Id = :heroId];

        // Deserialize the JSON string into name-value pairs
        Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(req.requestbody.tostring());
        // Iterate through each parameter field and value
        for(String fieldName : params.keySet()) {
            // Set the field and value on the Case sObject
            updHero.put(fieldName, params.get(fieldName));
        }
        update updHero;

        return updHero.Id;
    }

    @HttpDelete
    global static void delHero(){
        RestRequest req = RestContext.request;

        String heroId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);

        Character__c updHero = [SELECT Id FROM Character__c WHERE Id = :heroId];

        delete updHero;
    }

    // Método abaixo funciona para retornar dados em um conjunto que tenha mais informações que os dados do objeto.
    // @HttpGet 
    // global static Map<String,  Map<String,String>> getHeroes(){
    //     RestRequest req =  RestContext.request;
        
    //     List<Character__c> Heroes = new List<Character__c>();
        
    //     Map<String, Map<String,String>> novo = new Map <String, Map<String,String>>();

    //     String param = req.params.get('Tipo');

    //     if(param == 'Todos'){
    //         Heroes = [SELECT Hero_name__c, Name FROM Character__c ORDER BY Hero_name__c ASC LIMIT 1];
    //         Map<String, String> pers = new Map<String, String>();

    //         pers.put('Nome de Herói: ', Heroes[0].Hero_name__c);
    //         pers.put('Nome real: ',  Heroes[0].Name);
    //         pers.put('Boladão: ', 'Sim');

    //         novo.put(Heroes[0].Name, pers);

    //     return novo;
    // }
}