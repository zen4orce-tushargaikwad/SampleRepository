@isTest
public class ChildParentRelationshipListTest {
	@isTest
    public static void testConstructor(){
    	ChildParentRelationshipList c=new ChildParentRelationshipList();    
    }
    @isTest
    public static void testAllStandardObj(){
    	ChildParentRelationshipList c=new ChildParentRelationshipList();    
        Map<String,Integer> objAndRecordCount = new Map<String,Integer>();
        objAndRecordCount=c.AllStandardObj();
    }
    @isTest
    public static void testAllCustomObj(){
    	ChildParentRelationshipList c=new ChildParentRelationshipList();    
        Map<String,Integer> objAndRecordCount = new Map<String,Integer>();
        objAndRecordCount=c.AllCustomObj();
    }
    @isTest
    public static void testfindChildObjects(){
        List<String> lstObj = new List<String>();
        lstObj.add('Account');
        ChildParentRelationshipList c=new ChildParentRelationshipList();
        c.findChildObjects(lstObj);
    }
    @isTest
    public static void testfindNullValues(){
        map<string,set<String>> mapRelation = new map<string,set<String>>();
        set<String> childs = new set<String>();
        childs.add('Case');
        childs.add('Contract');
        childs.add('Opportunity');
        childs.add('Order'); 
        mapRelation.put('Account',childs);
        set<String> childs1 = new set<String>();
        mapRelation.put('Case',childs1);
        set<String> childs2 = new set<String>();
        mapRelation.put('Contract',childs2);
        set<String> childs3 = new set<String>();
        mapRelation.put('Opportunity',childs3);
        ChildParentRelationshipList c=new ChildParentRelationshipList();
        c.findNullValues(mapRelation);
    }
    @isTest
    public static void testgetDependentObjects(){
        List<String> lstObj=new List<String>();
        lstObj.add('Account');
    	ChildParentRelationshipList c=new ChildParentRelationshipList();
        c.getDependentObjects(lstObj);
    }
}