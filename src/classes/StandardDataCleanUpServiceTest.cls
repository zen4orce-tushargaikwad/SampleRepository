@isTest
public class StandardDataCleanUpServiceTest {
    @isTest
    public static void testConstructor(){
        StandardDataCleanUpService s=new StandardDataCleanUpService();
    }
    @isTest
    public static void testdeleteStandardRecordButton(){
        StandardDataCleanUpService s = new StandardDataCleanUpService();
        List<String> lstObj=new List<String>();
        lstObj.add('Account');
        lstObj.add('Lead');	
        s.deleteStandardRecordButton(lstObj); 
    }
    @isTest
    public static void testdisplaySelectedObjects(){
        List<String> lstObj=new List<String>();
        lstObj.add('Account');
        lstObj.add('Lead');
        StandardDataCleanUpService.displaySelectedObjects(lstObj);
    }
}