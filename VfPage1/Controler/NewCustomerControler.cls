public class NewCustomerControler 
{
    public Opportunity a { get; set; }
    List<Contact> con {get;set;}
    public ApexPages.StandardController controller{get;set;} 
    public NewCustomerControler(ApexPages.StandardController controller)
    {
        this.controller = controller;
        a = [select id,name,BillToContact__c from Opportunity where id ='0067F000002uzEu'];//:controller.getId()];
    	
    }
}