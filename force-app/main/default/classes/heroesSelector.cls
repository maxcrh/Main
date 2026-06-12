public with sharing class heroesSelector {

    @AuraEnabled(cacheable=true)
    public static List<Character__c> persongens(){

            return [SELECT Id, Name, Descricao__c FROM Character__c];

    }
}