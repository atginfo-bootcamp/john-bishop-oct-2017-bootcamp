public with sharing class Day5Maps {

	public static void example(String name)  {

		// For review this is the syntax of a list
		List<String> namesList = new List<String>();

		

		namesList.add('Betty');
		namesList.add('John');
		namesList.add('Jack');
		namesList.add('Paul');

		Boolean foundName = false; //keep track if name is found 

		for(String currentName : namesList){
			if(currentName == name){
				System.debug('Found name in list: ' + name);
				foundName = true;
				break; // This exits out of the loop if foundname = true
			}
		}

		// if found name is false 
		if(!foundName) {
			System.debug('Name not in list: ' + name);

		}

		Map<String, String> namesMap = new Map<String, String>();

		namesMap.put('Betty','Betty Boop');
		namesMap.put('John','John Bishop');
		namesMap.put('Jack','Jack Ryan');
		namesMap.put('Paul','Paul Walker');

		if(namesMap.containsKey(name)) {
			System.debug('Found name in map: ' + name);

		} else{
			System.debug('Name not found: ' + name);
		}

	}

	public static void associateContactsToAccounts() {

		List<Account> accountList = [SELECT Id, Name FROM Account];
		Map<Id, Account> accountMap = new Map<Id, Account>(accountList);

		//Alternate syntax
		//Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id, Name FROM Account]);

		List<Contact> contacts = [
		SELECT Id, FirstName, LastName, AccountId, Name
		 FROM Contact];

		 //loop through contacts
		 // print out the name of the contact and the account name

		for(Contact currContacts : contacts) {
			System.debug('Contact Name: ' + currContacts.Name);
			if(accountMap.containsKey(currContacts.AccountId)) {
				System.debug('Account Found: ' + accountMap.get(currContacts.AccountId).Name);

			} else {
				System.debug('Account not found for: ' + currContacts.Name);
			}



		}

	}

}
