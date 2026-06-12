@isTest
public class seeAllData {

    @isTest(seeAllData=false)
    static void seeFalse(){
        List<account> acc = [SELECT Id, name from Account];
        System.debug('Quantidade ' + acc.size());
    }
    
    @isTest(seeAllData=True)
    static void seeTrue(){
        List<account> acc = [SELECT Id, name from Account];
        System.debug('Quantidade ' + acc.size());
    }
}