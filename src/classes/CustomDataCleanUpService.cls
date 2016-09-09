public class CustomDataCleanUpService {
    set<set<String>> dependentObjects{get;set;}
    Map<String,integer> cusObj{get;set;}
    public List<List<String>> lstlstCustomObj{get;set;}
    public List<List<String>> lstlstDependentObj{get;set;}
    public List<List<String>> lstlstSelectedObj{get;set;}
    //public static List<List<List<String>>> selectedAndDependent{get;set;} 
    public List<String> selectedObjects{get;set;}
	ChildParentRelationshipList ex = new ChildParentRelationshipList();
	public CustomDataCleanUpService(){
        try
        {
            System.debug('Constructor call');
            cusObj 	= new Map<String,integer>();
            cusObj = ex.AllCustomObj();  
            list<String> customObjectList=new List<String>();
            customObjectList.addAll(cusObj.KeySet());
            
            lstlstCustomObj = new List<List<string>>();
            System.debug('lstlstSelectedObj'+lstlstSelectedObj);
            List<String> lstCustomObj;
            for(String s : customObjectList)
    		{
        		lstCustomObj=new List<String>();
		    	lstCustomObj.add('"'+s+'"'); 
    			lstlstCustomObj.add(lstCustomObj); 
    		}
        }
        catch(Exception ex)
        {
            System.debug('ERROR:'+ex.getMessage());
        }
    }
    public void deleteCustomRecordButton(List<String> recordsToDelete)
    {
        try
        {
            if(recordsToDelete.size() > 0)
            {
                map<string,set<String>> childValues=new map<string,set<String>>();
                System.debug('childValues :'+childValues);
                childValues=ex.findChildObjects(recordsToDelete);
                list<String> strList = new list<String>();
                strList =  ex.findNullValues(childValues);
                for(String s1 : strList)
                {
                	System.debug('final List' + s1);
            	}
                for(String s : recordsToDelete)
                {
                	System.debug('Custom Objects' + s);
            	}
                BatchApexForDeleteRecords d = new BatchApexForDeleteRecords(strList.get(0),strList);//created an instance to call Batch Apex class 
                database.executeBatch(d,2000);
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