trigger ContactBeforeDelete on Contact (before Delete) {
    for(Contact a: trigger.old){
        if(a.accountId ==null){
            a.addError('Não pode fazer isso mermão');
        }
    }
}