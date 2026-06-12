public with sharing class CustomPaginationDemo
{

public List<ContactWrapper> lstWrapper {get;set;}
public List<ContactWrapper> lstSetController{get;set;}

CustomIterable obj;

    public CustomPaginationDemo() 
    {
        lstWrapper =  new List<ContactWrapper>();
        lstSetController = new List<ContactWrapper>();

        List<String> lstContact = ContactWrapper.getDados();        
        
        for(String cont : lstContact )
        {
            lstWrapper.add(new ContactWrapper(cont));
        }

        obj = new CustomIterable (lstWrapper); 
        obj.setPageSize = 10;
        next();         
    }
    
    
        public Boolean hasNext {
            get 
            {
                return obj.hasNext();
            }
            set;
        }
        
        public Boolean hasPrevious {
            get 
            {
                return obj.hasPrevious();
            }
            set;
        }
        
        public void next() 
        {
            lstSetController = obj.next();
        }
        
        public void previous() 
        {
            lstSetController = obj.previous();
        }
    
}