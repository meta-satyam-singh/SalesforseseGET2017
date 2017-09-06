public class AllSObjects 
{
    public List<SelectOption> objects {set;get;}
    public List<String> objList {set;get;}
    public Map<String, Schema.SobjectType> mobjects {set;get;}
    
    public List<String> showAllObjects()
    {
        objects = new List<SelectOption>();
        objList = new List<String>();
        mobjects = Schema.getGlobalDescribe();
        objList.addAll(mobjects.keySet());
        objList.sort();
        for(String obj : objList)
        	System.debug(obj);
        return objList;
    }
}