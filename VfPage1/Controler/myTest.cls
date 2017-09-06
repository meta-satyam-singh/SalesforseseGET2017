public class myTest {
    public Contact con { get; set; }
	
    public myTest(ApexPages.StandardController controller) 
    {
        Id theId = ApexPages.currentPage().getParameters().get('id');
        con = [SELECT Id, Name, RecordTypeId,Experience__c ,Subjects__c,Level__c,RecordType.Name FROM Contact WHERE Id =:theId];
    }
}