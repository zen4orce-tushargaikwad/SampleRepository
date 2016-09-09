global class BatchApexForDeleteRecords implements Database.Batchable<sObject>,Database.Stateful 
{
    global list<String> lstOfObj = new list<String>();
    global String query ;
    SelectorHandlerClassForDataCleanUp selector = new SelectorHandlerClassForDataCleanUp();
    DomainHandlerClassForDataCleanUp d = new DomainHandlerClassForDataCleanUp();
    
    //Constructor of the class
    global BatchApexForDeleteRecords(String str,list<String> strList)
    {
        try
         {
            query = 'SELECT Id FROM '+ str;
        	lstOfObj = strList ; 
         }
        catch(Exception ex)
         {
            System.debug('ERROR:'+ex.getMessage());
         }
    } 
    
    //Start method of batch class
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
       try
        {
           System.debug('Query Result'+selector.queryLocatorById(query));
           return selector.queryLocatorById(query); //pass dynamic query to get the list of records
        }
       catch(Exception ex)
        {
            System.debug('ERROR:'+ex.getMessage());
            return null;
        }
	}
    
    //Execute method of batch class
	global void execute(Database.BatchableContext BC,list<SObject> objRecordList)
    {
       try
        {
            d.executeMethod(objRecordList);
        }
       catch(Exception ex)
        {
            System.debug('ERROR:'+ex.getMessage());
        }
    }
    
    //finish method of the batch class
   global void finish(Database.BatchableContext ctx) 
   {
       try
       {
           lstOfObj.remove(0);
           System.debug('in finish method'+ lstOfObj[0]);
           if(lstOfObj.size() > 0)//Call batch class again for delete another object's record
           {
               Id batchInstanceId = Database.executeBatch(new BatchApexForDeleteRecords(lstOfObj.get(0),lstOfObj),2000);   
           }
       }
       catch(Exception ex)
       {
           System.debug('ERROR:'+ex.getMessage());
       }
   }
}