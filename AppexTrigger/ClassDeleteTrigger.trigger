trigger ClassDeleteTrigger on Class__c (after delete, after insert, after update, after undelete, before delete, before insert, before update) 
{
    fflib_SObjectDomain.triggerHandler(ClassDeleteDomain.class);
}