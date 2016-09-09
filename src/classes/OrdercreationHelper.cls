public class OrdercreationHelper {
	public static void createOrder(List<Opportunity> oppList)
    {
        //Map<Id, Opportunity> oppsWithLineItems = new Map<Id, Opportunity>([SELECT Id, (SELECT Description,Id,ListPrice,Name,OpportunityId,Product2Id,ProductCode,Quantity,TotalPrice,UnitPrice FROM OpportunityLineItem)]);
        //List<OpportunityLineItem> oppLineItem=new List<OpportunityLineItem>([select Id,Discount,ListPrice,Quantity,UnitPrice,Subtotal,TotalPrice from OpportunityLineItem]);
        List<Order> orderList=new List<Order>();
        List<Opportunity> closedopp=new List<Opportunity>();
        for(Opportunity opp:oppList)
        {
            
            if(opp.IsClosed && opp.HasOpportunityLineItem)
            {
                Order o=new Order(AccountId=opp.AccountId,Name='TestId', OpportunityId=opp.Id, EffectiveDate=date.today(), Status='Draft',Pricebook2Id='01s28000009FfCRAA0');
                orderList.add(o);
                closedopp.add(opp);
            }
        }
        insert orderList;
        List<OpportunityLineItem> lstOppLineItem= new List<OpportunityLineItem>([select Id,PricebookEntryId,ServiceDate,Product2Id,OpportunityId,Discount,ListPrice,Quantity,UnitPrice,TotalPrice from OpportunityLineItem where OpportunityId in:closedopp]);
        List<OrderItem> lstOrderItem=new List<OrderItem>();
        date d=date.today();
        for(OpportunityLineItem op:lstOppLineItem)
        {
            for(Order o:orderList)
            {
                if(o.OpportunityId==op.OpportunityId)	
                {
                    //System.debug('Product ID    '+op.Product2Id);
                    //System.debug('op.Discount'+op.Discount);
                    Decimal discountedUnitPrice=op.UnitPrice-((op.UnitPrice*op.Discount)/100);
                    //System.debug('discountedUnitPrice'+discountedUnitPrice);
                    OrderItem ord=new OrderItem(PricebookEntryId=op.PricebookEntryId, ServiceDate=d,UnitPrice=discountedUnitPrice,Quantity=op.Quantity,OrderId=o.Id);
                    lstOrderItem.add(ord);
                }
            }
        }
        insert lstOrderItem;
    }
}