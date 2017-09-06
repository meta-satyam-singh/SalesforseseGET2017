public class AccountPaginationController 
{
    public string getBillingCitystring{ get; set;}
    public string getBillingStatestring{get;set;}    
    public string getBillingCountrystring{get;set;}
    public List<Account> createAccountList;
    public boolean searchClicked{get;set;} 
    public AccountPaginationController()
    {
        refresh();   
    }
    public List<Account> getCreateAccountList()
    {
    	return con.getRecords();    
    }
    public ApexPages.StandardSetController con 
    {
        get ;
        set;
    }
    public Boolean hasNext 
    {
        get 
        {
            return con.getHasNext();
        }
        set;
    }

    public Boolean hasPrevious 
    {
        get 
        {
            return con.getHasPrevious();
        }
        set;
    }
    public Integer pageSize 
    {
        get 
        {  
            return con.getPageSize();
        }
        set;
    }
    Public Integer getTotalPages()
    {
        Decimal totalSize = this.Con.getResultSize();
        Decimal pageSize = this.Con.getPageSize();
        Decimal pages = totalSize/pageSize;
        return (Integer)pages.round(System.RoundingMode.CEILING);
    }
    public Integer pageNumber 
    {
        get 
        {
            return con.getPageNumber();
        }
        set;
    }
    public void first() 
    {
        this.con.first();
        this.searchClicked = true;  
    }

    public void last() 
    {
        this.con.last();
		this.searchClicked = true;        
    }

    public void previous() 
    { 
        this.con.previous();
    }

    public void next() 
    {
        this.con.next();
        this.searchClicked = true;  
    }
   
     public void searchRecords()
    {
        refresh();
        this.searchClicked = true;  
    }
    
    public void refresh()
    {
        createAccountList= new list<Account>();
        string Query = 'SELECT id,name,billingcity,billingCountry,billingState FROM Account where ';
        if(string.isBlank(getBillingCitystring)  && string.isBlank(getBillingStatestring) && string.isBlank(getBillingCountrystring)) 
        {
            Query = 'SELECT id,name,billingcity,billingCountry,billingState FROM Account';
        }    
        if(!(string.isBlank(getBillingCitystring)))
        {
            Query = Query + 'billingcity LIKE \'%'+getBillingCitystring+'%\' AND ';
        }
        if(!(string.isBlank(getBillingCountrystring)))
        {
            Query = Query + ' billingcountry  LIKE  \'%'+getBillingCountrystring+'%\' AND ';
        }
        if(!(string.isBlank(getBillingStatestring)))
        {
            Query = Query +  ' billingstate LIKE  \'%'+getBillingStatestring+'%\' AND ';
        }
        if(Query.substring(Query.length()-4,Query.length()).equals('AND '))
        {
            Query= Query.substring(0,Query.length()-4);
        }
        Query = Query + ' limit 100';
        createAccountList=Database.query(Query); 
        con = new ApexPages.StandardSetController(createAccountList);
         con.setPageSize(10);                  
    }
}