@isTest
public class BatchApexForDeleteRecordsTest {
    @isTest
    public static void testBatch(){
        List<Account> lstAccount = new List<Account>();
        for(Integer i=0;i<5;i++)
        {
            Account a=new Account();
            a.Name='Account'+i;
            lstAccount.add(a);
        }
        insert lstAccount;
        ChildParentRelationshipList ex = new ChildParentRelationshipList();
        map<string,set<String>> childValues=new map<string,set<String>>();
        List<String> recordsToDelete = new List<String>();
        recordsToDelete.add('Account');
        childValues=ex.findChildObjects(recordsToDelete);
        list<String> strList = new list<String>();
        strList =  ex.findNullValues(childValues);
        System.debug('strList :'+strList);
        //Test.startTest();
        BatchApexForDeleteRecords d = new BatchApexForDeleteRecords(strList.get(0),strList);//created an instance to call Batch Apex class 
        database.executeBatch(d);
        //Test.stopTest();
    }
}