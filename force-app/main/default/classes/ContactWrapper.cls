global class ContactWrapper
{
public String cont{get;set;}        
    public ContactWrapper(String cont)
    {
        this.cont= cont;
    }
    
    public static List<String> getDados(){
        List<String> lstContact = new List<String>();
        
        lstContact.add('Max');
        lstContact.add('Murillo');
        lstContact.add('Talita');
        lstContact.add('Fátima');
        lstContact.add('Rafael');
        lstContact.add('Sibéria');
        lstContact.add('Léo');
        lstContact.add('Larissa');
        lstContact.add('Izac');
        lstContact.add('Vivi');
        lstContact.add('Terezinha');
        lstContact.add('Sr. José');
        lstContact.add('Murillo s2 super filho');
        lstContact.add('Daniel');
                                          
        return lstContact;
    }
    
}