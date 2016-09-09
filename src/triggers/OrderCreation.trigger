trigger OrderCreation on Opportunity (after insert, after update){
	if(trigger.isAfter)
    {
        if(trigger.isUpdate || trigger.isInsert)
        {
        	OrdercreationHelper.createOrder(trigger.New);	 	   
        }
    }
}