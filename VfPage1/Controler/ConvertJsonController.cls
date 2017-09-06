public class ConvertJsonController 
{
    /* String which will have Json value of object */ 
    public String jsonValue {get;set;}

    /* Function which will parse account object into Json value */ 
    public void parseJson()
    {
        String soql = 'SELECT Name FROM Account LIMIT 10';
        List<Account> acct = Database.Query(soql); 
        jsonValue = JSON.serializePretty(acct);
    }    
}