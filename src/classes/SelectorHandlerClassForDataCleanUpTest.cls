@isTest
public class SelectorHandlerClassForDataCleanUpTest {
    @isTest
    public static void testnameSpaceprefixOfOrg(){
        SelectorHandlerClassForDataCleanUp selector = new SelectorHandlerClassForDataCleanUp();
        selector.nameSpaceprefixOfOrg();
    }
    @isTest
    public static void testnumberOfReocrds(){
        SelectorHandlerClassForDataCleanUp selector = new SelectorHandlerClassForDataCleanUp();
        String obj='Account';
        Integer recordCount;
        recordCount=selector.numberOfReocrds(obj);
    }
    @isTest
    public static void testnumberOfReocrds1(){
        SelectorHandlerClassForDataCleanUp selector = new SelectorHandlerClassForDataCleanUp();
        String obj='';
        Integer recordCount;
        recordCount=selector.numberOfReocrds(obj);
    }
    @isTest
    public static void testqueryLocatorById(){
        SelectorHandlerClassForDataCleanUp selector = new SelectorHandlerClassForDataCleanUp();
        String query = 'SELECT Id FROM Account';
        selector.queryLocatorById(query);
    }
    @isTest
    public static void testqueryLocatorById1(){
        SelectorHandlerClassForDataCleanUp selector = new SelectorHandlerClassForDataCleanUp();
        String query = '';
        selector.queryLocatorById(query);
    }
    @isTest
    public static void testasyncApexJobDetails(){
    	SelectorHandlerClassForDataCleanUp selector = new SelectorHandlerClassForDataCleanUp();
        List<AsyncApexJob> a = new List<AsyncApexJob>([SELECT Id FROM AsyncApexJob LIMIT 1]);
        List<AsyncApexJob> lstAsyncApexJob=new List<AsyncApexJob>();
        lstAsyncApexJob =selector.asyncApexJobDetails('70728000023RWBoAAO');
    }
}