public class StandardDataCleanUpService {
	Map<String,integer> stdObj{get;set;}
    public List<List<String>> lstlstStdObj{get;set;}
    public List<List<String>> lstlstDependentObj{get;set;}
    public List<List<String>> lstlstSelectedObj{get;set;}
    ChildParentRelationshipList ex = new ChildParentRelationshipList();
    public StandardDataCleanUpService(){
        try
        {
            stdObj = new Map<String,integer>();
           	stdObj = ex.AllStandardObj();
            list<String> standardObjectList=new List<String>();
            standardObjectList.addAll(stdObj.KeySet());
            lstlstSelectedObj = new List<List<string>>();
            lstlstStdObj = new List<List<string>>();
            List<String> lststdObj;
            for(String s : standardObjectList)
    		{
        		lststdObj=new List<String>();
		    	lststdObj.add('"'+s+'"'); 
    			lstlstStdObj.add(lststdObj); 
    		}
        }
        catch(Exception ex)
        {
            System.debug('ERROR:'+ex.getMessage());
        }
    }
    //Delete All Records of Standard Objects by calling batch class 
    public void deleteStandardRecordButton(List<String> stdObjList)
    {
        try
        {
            if(stdObjList.size() > 0)
            {
                map<string,set<String>> childValues=new map<string,set<String>>();
                childValues=ex.findChildObjects(stdObjList);
                list<String> strList = new list<String>();
                strList =  ex.findNullValues(childValues);
              	BatchApexForDeleteRecords d = new BatchApexForDeleteRecords(strList.get(0),strList);//created an instance to call Batch Apex class 
                database.executeBatch(d);
            }
        }
        catch(Exception ex)
        {
            System.debug('ERROR:'+ex.getMessage());
        }
    }
   	@RemoteAction
    public static List<List<List<String>>> displaySelectedObjects(String[] objNames)
    {
        List<String> lstObj=new List<String>();
        //System.debug('OnjectNames:'+objNames);
        for(String s:objNames)
        {
            lstObj.add(s);
        }
        System.debug('');
        CustomDataCleanUpService c=new CustomDataCleanUpService();
        List<List<List<String>>> selectedAndDependent = new List<List<List<String>>>();
        selectedAndDependent=c.getDataFromStatic(lstObj);
        return selectedAndDependent;
    }
    public List<List<List<String>>> getDataFromStatic(List<String> selectedObjects)
    {
        List<List<List<String>>> selectedDependent = new List<List<List<String>>>(); 
        System.debug('List :'+selectedObjects);
        lstlstSelectedObj = new List<List<string>>();
        List<String> lstSelectedObj;
            for(String s : selectedObjects)
    		{
        		lstSelectedObj=new List<String>();
		    	lstSelectedObj.add('"'+s+'"'); 
    			lstlstSelectedObj.add(lstSelectedObj); 
    		}
        System.debug('lstlstSelectedObj :'+lstlstSelectedObj);	
        set<String> setDependent=new set<String>();
        ChildParentRelationshipList ex = new ChildParentRelationshipList();
        setDependent=ex.getDependentObjects(selectedObjects);
        lstlstDependentObj = new List<List<string>>();
        List<String> lstDependentObj;
        for(String s : setDependent)
    		{
        		lstDependentObj=new List<String>();
		    	lstDependentObj.add('"'+s+'"'); 
    			lstlstDependentObj.add(lstDependentObj); 
    		}
        selectedDependent.add(lstlstSelectedObj);
        selectedDependent.add(lstlstDependentObj);
        //System.debug('Depenent Objects :'+setDependent);
        return selectedDependent;
    }
}