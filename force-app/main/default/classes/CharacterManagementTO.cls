global with sharing class CharacterManagementTO {
    
    public static CharacterManagementTO instance;

    public static CharacterManagementTO getInstance(){
        if(instance == null)
            instance = new CharacterManagementTO();
        return instance;
    }

    global class character{
        global String charName;
        global String heroName;
        global Integer hp;
        global Integer power;
        global String team;
    }

    global class response{
        global boolean success;
        global String message;
    }
}