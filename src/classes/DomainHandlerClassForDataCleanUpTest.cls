@isTest
public class DomainHandlerClassForDataCleanUpTest {
    @isTest
    public static void testexecuteMethod(){
        List<Account> lstAccount = new List<Account>();
        for(Integer i=0;i<5;i++)
        {
            Account a=new Account();
            a.Name='Account'+i;
            lstAccount.add(a);
        }
        insert lstAccount;
        List<Account> lstRecords = new List<Account>([select id from Account]);
        System.debug('lstRecords :'+lstRecords);
        DomainHandlerClassForDataCleanUp d = new DomainHandlerClassForDataCleanUp();
        d.executeMethod(lstRecords);
    }
    @isTest
    public static void testexecuteMethod1(){
        List<Account> lstRecords;
        DomainHandlerClassForDataCleanUp d = new DomainHandlerClassForDataCleanUp();
        d.executeMethod(lstRecords);
    }
    @isTest
    public static void testexecuteMethod2(){
        List<Account> lstRecords;
        DomainHandlerClassForDataCleanUp d = new DomainHandlerClassForDataCleanUp();
        d.executeMethod(null);
    }
}