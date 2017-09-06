public class myOpportunityController 
{
    public List<Contact> listOfContacts{get;set;}
    public Opportunity oppty{get;set;}
    public String contactName{get;set;}
    
    public myOpportunityController(ApexPages.StandardController opptyController)
    {
        oppty = (Opportunity)opptyController.getRecord();
        listOfContacts = new List<Contact>();
        if(oppty.Manager__c != null)
            listOfContacts= [SELECT Id,Name FROM Contact WHERE AccountId=:oppty.Manager__c];
        System.debug(listOFContacts.size());
    }
    public List<SelectOption> getItems() 
    {
        List<SelectOption> options = new List<SelectOption>();
        for(Contact con: listOfContacts)
            options.add(new SelectOption(con.ID,con.Name));
        return options;
        
    }
    public void checkSelectedValue()
    {
        System.debug(contactName);
    }
    public PageReference saveBillToContact()
    {
        for(Contact con : listOfContacts)
        {
            if(con.Id == contactName)
            {
                oppty.BillToContact__c=con.Id;
                System.debug('found');
                update oppty;
                break;
            }
        }
        return redirect();
    }
    public PageReference clearBillToContact()
    {
        oppty.BillToContact__c = null;
        update oppty;
        return redirect();
    }
    public PageReference redirect()
    {
        return new PageReference('https://ap5.salesforce.com/'+oppty.Id);
    }
    
}