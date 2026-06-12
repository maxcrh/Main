trigger ContactBeforeInsertUpdate on Contact (before insert,before update) {
    for(Contact a:Trigger.New){
        if(trigger.isInsert){
            a.Description ='Contato inserido com sucesso by insert trigger';
        }
        
        else if(trigger.isUpdate){
            a.Description = 'Contato atualizado com sucesso by update trigger';
        }
    }
}