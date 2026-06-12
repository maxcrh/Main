public with sharing class CarExpensesController {
	 @AuraEnabled
    public static List<ExpenseCar__c> getExpenses() {
        return [SELECT Name, Despesa__c, Valor__c, Data__c,
                       CreatedDate
                FROM ExpenseCar__c];
    }
    @AuraEnabled
    public static ExpenseCar__c saveCar(ExpenseCar__c expense){
        upsert expense;
        return expense;
    }
}