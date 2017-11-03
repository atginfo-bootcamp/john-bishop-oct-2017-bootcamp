public with sharing class ContactTriggerHelper {
	
	public static void handleAfterInsert (List<Contact> contacts) {
		// If contact has an account assigned, update number of contacts on account 
		List<Account> accounts = queryAccountsFromContacts(contacts);

	updateAccountNumberofContacts(accounts);
}



	public static void handleAfterUpdate (List<Contact> contacts, Map<Id, Contact> oldContactMap)  { 
		// Loop through contacts 
		// Check if accountId was changed
		// 1) null --> not null --> update the account  (Current_Number_of_Contacts__c)
		// 2) not null --> null --> update the old account (Current_Number_of_Contacts__c)
		// 3) not null --> not null (contact assigned to different account) --> update both accounts
		Set<id> accountIds = new Set<Id>();

		
		for(Contact contact : contacts) {
			Contact oldContact = oldContactMap.get(contact.Id);
			if(contact.AccountId != oldContact.AccountId) {
				//Checking to see if the account id was changed
				If(contact.AccountId != null) {
					accountIds.add(contact.AccountId);
				}
				if(oldContact.AccountId != null) {
					accountIds.add(oldContact.AccountId);
				}
			}


		}

		List<Account> accounts = queryAccounts(accountIds);
		updateAccountNumberofContacts(accounts);



	}

	public static void handleAfterDelete(List<Contact> contacts) {

	}


	private static List<Account> queryAccountsFromContacts(List<Contact> contacts) {
			Set<Id> accountIds = new Set<Id>();
			
			for(Contact contact : contacts) {
				If(contact.accountId != null) {
					accountIds.add(contact.accountId);


				}
			} 

			return queryAccounts(accountIds);
			
	}

	private static List<Account> queryAccounts(Set<Id> accountIds) {
		List<Account> accounts = new List <Account>();

		//if(!accountIds.isBlank()) --- alternate option than below
			if(accountIds.size() > 0) {
				accounts = [
				SELECT Id, Current_Number_of_Contacts__c,
				(SELECT Id FROM Contacts)
				FROM Account 
				WHERE Id IN :accountIds];

			}

			return accounts;



	}

	private static void updateAccountNumberofContacts(List<Account> accounts) {

			if(accounts.size() > 0) {

			for(Account account : accounts) {
				Integer numberOfContacts = account.Contacts.size();
				account.Current_Number_of_Contacts__c = numberOfContacts;
			}


			//// Put list in a map, so we can easly retrieve the account we want
			//Map<Id, Account> accountMap = new Map<Id, Account>(accounts);
			//// Loop contacts, find matching account and update number of contacts
			//for(Contact contact : contacts) {
			//	if(contact.accountId != null) {
			//		Account account = accountMap.get(contact.accountId);
			//		//Ternery if statement  "condition ? Value to set if True : Value to set if false"
			//		account.Current_Number_of_Contacts__c = account.Current_Number_of_Contacts__c == null ? 0 : account.Current_Number_of_Contacts__c;

			//		account.Current_Number_of_Contacts__c ++;
			//		//account.Current_Number_of_Contacts__c += 1;
			//		//account.Current_Number_of_Contacts__c = account.Current_Number_of_Contacts__c + =1;
			////		//^ Alternate expression operators to increment Current_Number_of_Contacts__c
			//	}

			

			update accounts;

		 

	}

	}
}

