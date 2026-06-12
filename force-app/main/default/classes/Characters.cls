public with sharing class Characters {

    public static Characters instance;

    public static Characters getInstance(){
        if(instance == null)
            instance = new Characters();
        return instance;
    }

    public String createNewCharacter(List<Character__c> chars){
        CharacterHelper charHelp = CharacterHelper.getInstance();
        Map<Integer, String> retornoHelper = charHelp.createNewCharacter(chars);

        String retorno;

        if(retornoHelper.get(0) != '0'){
            retorno = 'Personagens criados: ' + retornoHelper.get(0);
        } else {
            retorno = 'Não foi possível criar o(s) personagem(ns)!';
            //lançar exception
        }
        System.debug('Retorno' + retorno);
        return retorno;
    }

    /*public static Character__c updtCharacter(List<Character__c> character){

    }

    public static Character__c delCharacter(List<Character__c> character){

    }

    public static Character__c createNewCompletedCharacter(List<Character__c> char){

    }

    public static Character__c updtCompletedCharacter(List<Character__c> char){

    }*/

    public Characters() {

    }
}