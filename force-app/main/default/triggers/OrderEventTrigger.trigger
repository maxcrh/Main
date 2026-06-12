trigger OrderEventTrigger on Order_Event__e (after insert) {
// List to hold all cases to be created.
    List<Task> tasks = new List<Task>();
       
    // Iterate through each notification.
    for (Order_Event__e event : Trigger.New) {
        if (event.Has_Shipped__c == true) {
            // Create Case to dispatch new team.
            Task tks = new Task();
            tks.Priority = 'Medium';
            tks.Subject = 'Follow up on shipped order ' + event.Order_Number__c;
            tks.OwnerId = event.CreatedById;
            tasks.add(tks);
        }
   }
    
    // Insert all tasks corresponding to events received.
    insert tasks;
}