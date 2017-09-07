public class OpportunityScheduler implements Schedulable 
{
	public void execute(SchedulableContext SC)
    {
		sendMail();
	}
   
	private void sendMail()
    {
        Integer c = 0;
		List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
		for(Opportunity op : [SELECT Name,Owner.id FROM Opportunity WHERE LastModifiedDate=LAST_N_DAYS:30])
        {
        	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        	mail.setTemplateId('00X7F000000l8wqUAA');
        	mail.setTargetObjectId(op.Owner.id);
         	mails.add(mail);
            c++;
   		}
     	if ( mails.size() > 0 )
        	Messaging.sendEmail(mails, false);
        System.debug(c);
	}
}