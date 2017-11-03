trigger LeadTrigger on Lead (before insert, before update, before delete, after insert, after update, after delete, after undelete) {



System.debug('Trigger.isInsert: ' + Trigger.isInsert);
System.debug('Trigger.isUpdate: ' + Trigger.isUpdate);
System.debug('Trigger.isDelete: ' + Trigger.isDelete);
System.debug('Trigger.isUpdate: ' + Trigger.isUpdate);
System.debug('Trigger.isBefore: ' + Trigger.isBefore);
System.debug('Trigger.isAfter: ' + Trigger.isAfter);

//Records in new state being insetered into the DB
List<Lead> leads = Trigger.new;
Map<Id, Lead> leadMap = Trigger.newMap;


// Records are populated with old values before update
List<Lead> oldLead = Trigger.old;
Map<Id, Lead> oldLeadMap = Trigger.oldMap;

System.debug('Trigger.new: ' + Trigger.new);
System.debug('Trigger.newMap: ' + Trigger.newMap);
System.debug('Trigger.old: ' + Trigger.old);
System.debug('Trigger.oldMap: ' + Trigger.oldMap);





// Common way to choose what code to call and when
if(Trigger.isBefore && trigger.isInsert){
	// call your code to do stuff
	// call helper methods

	// change first lead title to  The Nacho King - NO DML NEEDED IN BEFORE CONTEXT
	leads[0].Title = 'The Nacho King';




} else if(Trigger.isAfter && trigger.isUpdate){
	// do stuff after update@
	// call helper methods

leads[0].Title = leads[0].Id;
/// This is broken ^ will pick up on day 6. Remind austin to finish this example

}


	}



