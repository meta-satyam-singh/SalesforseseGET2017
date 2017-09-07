public class OpportunitiesUpdate extends fflib_SObjectDomain 
{
   public OpportunitiesUpdate(List<Opportunity> sObjectList)
   {
       super(sObjectList);
   }
   
   public class Constructor implements fflib_SObjectDomain.IConstructable 
   {
       public fflib_SObjectDomain construct(List<sObject> sObjectList) 
       {
           return new OpportunitiesUpdate(sObjectList);
       }
   }
   
   public override void onAfterInsert() 
   {
       for(Opportunity opp : (List<Opportunity>) Records) 
       {                  
           if(opp.BillToContact__c != null && opp.Manager__c == null)
               if(opp.Account.id != null)
                   opp.Manager__c = opp.Account.Id;
       }
   }
}
