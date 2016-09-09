@isTest
public class CustomDataCLeanUpServiceTest{
    @isTest
    public static void testConstructor(){
		CustomDataCleanUpService c=new CustomDataCleanUpService();        
    }
    @isTest
    public static void testDeleteCUstonRecordButton(){
        CustomDataCleanUpService c=new CustomDataCleanUpService();        
        List<String> lstObj=new List<String>();
        lstObj.add('Employee__c');
        lstObj.add('country__c');	
        c.deleteCustomRecordButton(lstObj); 
    }
    @isTest
    public static void testRemoteActionmethod(){
        List<String> lstObj=new List<String>();
        lstObj.add('Employee__c');
        lstObj.add('country__c');
        CustomDataCleanUpService.displaySelectedObjects(lstObj);
        //CustomDataCleanUpService.RemoteSaveResult result= CustomDataCleanUpService.displaySelectedObjects();
    }
}