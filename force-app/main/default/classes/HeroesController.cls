public with sharing	 class HeroesController {
	
    @AuraEnabled
    public static Character__c saveHero(Character__c hero){
        upsert hero;
        return hero;
    }
}