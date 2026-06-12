trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    
    List<Task> AddTask = New List<Task>();
    
    For(Opportunity a : [SELECT Id from Opportunity WHERE Id IN :Trigger.New 
                         		AND StageName = 'Closed Won']){
       	AddTask.add(new Task(Subject = 'Follow Up Test Task',
                             WhatId  =	a.Id));
    }
    
    If(AddTask.size() > 0){
        insert AddTask;
    }
}