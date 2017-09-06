public class Teachers extends fflib_SObjectDomain 
{
    //public static fflib_SObjectUnitOfWork uow;
    public Teachers(List<Contact> sObjectList) 
    {
        super(sObjectList);
        //uow = new fflib_SObjectUnitOfWork(new Schema.SObjectType[] { Contact.SObjectType });
    }
    
    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new Teachers(sObjectList);
        }
    }
    public override void onBeforeUpdate(Map<Id,SObject> SObjectMap) 
    {
        List<Contact> listOfTeachers = (List<Contact>)Records;
        List<Contact> teachersToUpdate = new List<Contact>();
        for(Contact teacher : listOfTeachers)
        {
            if(teacher.Subjects__c.contains('Hindi'))
            {
                teacher.addError('Can\'t update teacher teaching Hindi ');
            }
        }
    }
    public override void onBeforeInsert() 
    {
        List<Contact> listOfTeachers = (List<Contact>)Records;
        List<Contact> teachersToUpdate = new List<Contact>();
        for(Contact teacher : listOfTeachers)
        {
            if(teacher.Subjects__c.contains('Hindi') && teacher.Subjects__c!=null)
            {
                teacher.addError('Can\'t insert teacher teaching Hindi ');
            }
        }
        
    }
    
}