public class SelectorHandlerClassForDataCleanUp {
    
    //Query for find NamespacePrefix of your Organization
    public String nameSpaceprefixOfOrg()
    {
        try
        {
            Organization org = [SELECT NamespacePrefix FROM Organization];
            String nameSpace = String.valueOf(org.NamespacePrefix);
            return nameSpace;
        }
        catch(Exception ex)
        {
            System.debug('ERROR:'+ex.getMessage());
            return null;
        }
    }
    
    //Query for find numberOfReocrds of Object
    public integer numberOfReocrds(String obj)
    {
        try
        {	
            integer count= database.countQuery('SELECT count() FROM '+obj);
			return count;
        }
        catch(Exception ex)
        {
            System.debug('ERROR:'+ex.getMessage());
            return null;
        }
    }
    
    //Query for returning records to batch class
    public Database.QueryLocator queryLocatorById(String query)
    {
        try
        {
            return Database.getQueryLocator(query);
        }
        catch(Exception ex)
        {
            System.debug('ERROR:'+ex.getMessage());
            return null;
        }
    }
    
    //Query to AsyncApexJob object to find Status of job
    public List<AsyncApexJob> asyncApexJobDetails(Id idOfJob)
    {
        try
        {
            List<AsyncApexJob> a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
                                 TotalJobItems, CreatedBy.Email
                                 FROM AsyncApexJob WHERE Id =:idOfJob];
            return a;
        }
        catch(Exception ex)
        {
            System.debug('ERROR:'+ex.getMessage());
            return null;
        }
    }
}