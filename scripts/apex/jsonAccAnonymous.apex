// Print the JSON format of any 5 accounts from the Salesforce org. Fetch Id, Name, 
// AnnualRevenue and Type field from Account.

List<Account> accList = [SELECT id, name, AnnualRevenue, Type from Account LIMIT 5];
string accJSON1 = JSON.serialize(accList);
system.debug(accJSON1);


// Print the JSON format of account and its related contacts for 'United Oil & Gas Corp.' account 
// from the Salesforce org. Fetch Id, Name, AnnualRevenue and Type field from Account Object
// And Fetch Id, First Name and Last Name from the related contacts

List<Account> accList =[select Id, Name, AnnualRevenue, Type, 
                        (select Id, FirstName, LastName from contacts) 
                        from Account 
                        where Name='United Oil & Gas Corp.'];
string accJason2 = JSON.serialize(accList);
System.debug(accJason2);


/*Print the JSON format of account and its related opportunities for 'United Oil & Gas Corp.' 
account from the Salesforce org. Fetch Id, Name, AnnualRevenue and Type field from Account 
Object And Fetch Id, StageName and Amount from the related Opportunities   */

List<Account> accList =[select Id, Name, AnnualRevenue, Type, 
                        (select Id, stageName, Amount from opportunities) 
                        from Account 
                        where Name='United Oil & Gas Corp.'];
string accJason3 = JSON.serialize(accList);
System.debug(accJason3);