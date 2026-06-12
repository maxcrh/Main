trigger ContactBeforeInsert on Contact (before insert) {
    for(Contact a: trigger.New){
        a.Description = 'Teste de trigger para estudo Udemy';       
    }
}