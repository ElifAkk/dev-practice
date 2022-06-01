operationsHelper ph = new operationsHelper();
system.debug('The largest of two decimals is ' + ph.largestOutOfTwoNumbers(10.13, 13.21));

operationsHelper smallest = new operationsHelper();
system.debug('The smallest of three decimals is ' + smallest.smallestOutOfThreeNumbers(10.13, 13.21, 21.36));
system.debug('The smallest of three decimals is ' + smallest.smallestOutOfThreeNumbers(99.99, 99.99, 199.96));

List<decimal> declist = new List<decimal>{5.2, 5.5, 9.6, 4.6};
operationsHelper obj = new operationsHelper();
obj.reverseMethod(declist);

obj.lowHighMethod(decList);

system.debug('The sum of the list is ' + obj.sum(declist));

obj.average(decList);
system.debug('the average of the list is => ' + obj.average(declist));

system.debug('the heighest value of the list is => ' + obj.highest(declist));
system.debug('the lowest value of the list is => ' + obj.lowest(declist));

