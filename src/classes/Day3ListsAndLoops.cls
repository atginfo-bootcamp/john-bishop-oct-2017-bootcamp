// To invoke from dev console : Day3ListAndLoops.execture()
//

public with sharing class Day3ListsAndLoops {

	public static void execute() {

		String myName = 'John';

		//Create new empty list called names
		// THIS IS THE PREFERRED WAY TO INITALIZE
		List<String> names = new List<String>();

		//Create new empty list with default values
		List<String> students = new List<String>{'Student 1', 'Student 2'};

		// Alternate syntax for creeating a new array (list)
		String[] employees = new String[20];

		names.add('Bishop');
		names.add('Dan');
		names.add('Brian');


		System.debug('names: ' + names);
		
		names.remove(0); // remove item at index 0, which is Bishop

		System.debug('names after last element removed: ' + names);
		
		// dynamically remove last element in array
		names.remove(names.size() - 1);

		System.debug('names after removing name.size(): ' + names);

		Set<String> uniqueNames = new Set<String>();

		uniqueNames.add('Bishop');
		uniqueNames.add('Bishop');
		uniqueNames.add('Bishop');
		uniqueNames.add('Bishop');
		uniqueNames.add('Bishop');
		uniqueNames.add('Bishop');

		//Store the number of items in our set
		Integer setSize = uniqueNames.size();

		System.debug('unqiueNames: ' + uniqueNames);
		System.debug('setSize: ' + uniqueNames.size());



	}

}