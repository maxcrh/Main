public class objectRetrieveData {
    public List<SelectOption> getObjnames(){
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('NONE','NONE'));
        
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();
        
        for(Schema.SObjectType var: gd){
            options.add(new SelectOption(var.getDescribe().getName(), var.getDescribe().getLabel()));
        }
        return options;
    }

}