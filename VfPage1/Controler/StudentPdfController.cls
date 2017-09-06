public class StudentPdfController 
{
    public Student__c student {get; set;}
    
    public StudentPdfController(ApexPages.StandardController myPdfController)
    {
        student = (Student__c)myPdfController.getRecord();
    }
    
    public void attach() 
    {
        boolean flag = false;
        List<Attachment> attachments = new List<Attachment>();
        Attachment attachmentToDelete = new Attachment();
        attachments =  [SELECT Id, Name, Body, ContentType FROM Attachment WHERE Parentid =:student.Id];
        Attachment myAttach = new Attachment();
        myAttach.ParentId = student.Id;//Id of the object to which the page is attached
        myAttach.name = 'StudentDetails.pdf';
        PageReference myPdf = Page.StudentPdf;//myPdfPage is the name of your pdf page
        myAttach.body = myPdf.getContentAsPdf();
        System.debug(attachments.size());
        for(Attachment naa: attachments)
        {
            if((naa.Name).equals('StudentDetails.pdf'))
            {
                attachmentToDelete = naa;
                flag=true;
                break;
            }
        }
        if(flag)
        {
            delete attachmentToDelete;
        }
        insert myAttach;
    }
}