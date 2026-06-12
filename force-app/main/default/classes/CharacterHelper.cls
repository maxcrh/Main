public with sharing class CharacterHelper {

    public static CharacterHelper instance;

    public static CharacterHelper getInstance(){
        if(instance == null)
            instance = new CharacterHelper();
        return instance;
        
    }

    public Map<Integer,String> createNewCharacter(List<Character__c> chars){
        String lstInsChar;
        String lstInsErrorChar; 

        if(chars.size() > 0){
            Database.SaveResult[] srList = Database.insert(chars, false);

            for(Database.SaveResult sr : srList){
                if (sr.isSuccess()){
                    if(String.isBlank(lstInsChar)){
                        lstInsChar = (String)sr.Id;
                    }else{
                        lstInsChar = lstInsChar + ', ' + (String)sr.Id;
                    }
                    System.debug('Successfully inserted Character. Character ID: ' + sr.getId());
                } else {
                    // Operation failed, so get all errors                
                    for(Database.Error err : sr.getErrors()) {
                        if(String.isBlank(lstInsErrorChar)){
                            lstInsErrorChar = (String)sr.Id;
                        }else{
                            lstInsErrorChar = lstInsErrorChar + ', ' + (String)sr.Id;
                        }
                        System.debug('The following error has occurred.');                    
                        System.debug(err.getStatusCode() + ': ' + err.getMessage());
                        System.debug('Character fields that affected this error: ' + err.getFields());
                    }
                }      
            }
        }

        if(String.isBlank(lstInsChar)){
            lstInsChar = '0';
        }

        if(String.isBlank(lstInsErrorChar)){
            lstInsErrorChar = '0';
        }

        Map<Integer, String> mapRetorno = new Map<Integer, String>();
        mapRetorno.put(0, lstInsChar);
        mapRetorno.put(1, lstInsErrorChar);
        
        return mapRetorno;     
    }

    public CharacterHelper() {

    }

}