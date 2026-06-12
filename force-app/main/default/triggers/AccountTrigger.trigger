trigger AccountTrigger on Account (before insert) {
    if (Trigger.isBefore && trigger.IsInsert) {
        AccountTriggerHandler.CreateAccounts(Trigger.New);
    }
}