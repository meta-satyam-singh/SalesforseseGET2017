public with sharing class DeletePdf 
{
    public Student__c studentItem{get;set;} 
    public Id idVal{get;set;} 
    public string doSave{get;set;} 
    public DeletePdf(ApexPages.StandardController stdController)
    { 
        idVal = (Id)stdController.getId(); 
        doSave = ApexPages.currentPage().getParameters().get('doSave'); 
        studentItem = [Select ID, Name From Student__c where ID = :idVal]; 
    } 
    public pageReference savePDF()
    { 
        if(doSave == 'No')
        { 
            return null; 
        } 
        PageReference pagePdf = new PageReference('/apex/AttachPDFTerryTest'); 
        pagePdf.getParameters().put('id', idVal); 
        pagePdf.getParameters().put('doSave', 'No'); 
        Blob pdfPageBlob; 
        pdfPageBlob = pagePdf.getContentAsPDF(); 
        Attachment a = new Attachment(); 
        a.Body = pdfPageBlob; 
        a.ParentID = idVal; 
        a.Name = 'TerryTestAttach1.pdf'; 
        a.Description = 'TestDescription1'; 
        insert a; 
        return new PageReference('/' + idVal); 
    } 
}