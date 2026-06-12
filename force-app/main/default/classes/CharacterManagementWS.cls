@RestResource(urlMapping='/character/*')
global with sharing class CharacterManagementWS {

    global CharacterManagementWS() {

    }

    public static CharacterManagementWS instance;

    public static CharacterManagementWS getInstance(){
        if(instance == null)
            instance = new CharacterManagementWS();
        return instance;
    }

    @HttpPost
    global static CharacterManagementTO.response createCharacter(){
        boolean success = false;
        String message = '';

        if(RestContext.request != null){
            String requestBody = RestContext.request.requestBody.toString();

            if(String.isNotBlank(requestBody)){
                try{
                    List<CharacterManagementTO.character> lstCharacterTO = (List<CharacterManagementTO.character>)System.JSON.deserialize(requestBody, List<CharacterManagementTO.character>.class);

                    List<Character__c> newCharacters = createCharacterRecords(lstCharacterTO);

                    if(newCharacters.size() > 0){
                        insert newCharacters;

                        success = true;
                        message = 'Personagens inseridos.';
                    }else{
                        success = false;
                        message = 'Registros não inseridos';
                    }
                }catch(Exception e){
                    success = false;
                    message = 'Registros não inseridos' + e.getMessage();
                }
            }
        }
        CharacterManagementTO.response response = new CharacterManagementTO.response();
        response.success = success;
        response.message = message;

        return response;
    }

    private static List<Character__c> createCharacterRecords (List<CharacterManagementTO.character> lstCharacterTO){
        List<Character__c> lstChar = new List<Character__c>();

        for(CharacterManagementTO.character s : lstCharacterTO){
            Character__c character = new Character__c();

            character.Name = s.charName;
            character.Hero_name__c = s.heroName;
            character.HP__c = s.hp;
            character.Power__c = s.power;
            character.Team_Heroes__c = s.team;

            lstChar.add(character);
        }

        return lstChar;
    }
}