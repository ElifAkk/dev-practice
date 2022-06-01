public class AccConAndOppOperations {
    public static decimal sumOfClosedWon() {
        List<Opportunity> ListOpp = [select Amount from Opportunity where stageName = 'Closed Won'];

        Decimal sum = 0;
        for (opportunity eachOpp : ListOpp) {
            sum += eachOpp.Amount;
        }
        return sum;
    }  

    public static List<Account> allAccounts(string sName) {
        List<Opportunity> listOpp = [select id, name, accountId from Opportunity where AccountId != null and stageName = :sName];

        Set<Id> AccId = new Set<Id>();
        for (opportunity Op : listOpp) {
            AccId.add(Op.AccountId);
        }
        List<Account> listAcc = [select id, name from Account where Id IN : AccId];
        return listAcc;        
    }
    // 2. way:
    /*public static List<account> method2(string stageName) {
        List<account> accList = [select id, name from Account where id in (select AccountId from Opportunity where stageName = : stageName)  ];

        System.debug('Account list: ' + accList);

        return accList;   
    }*/

    // *******************************



    public static List<Account> accWithContacts() {
        List<Contact> listCont = [select id, name, accountId from Contact where AccountId != null];
    }

    public static void createNewContact(ID accID) {
        Contact cnt = new Contact();
        Account acc = [select Name from Account where ID = 'accID'];
        cnt.accountId = accID;
        cnt.lastName = acc.Name;
        System.debug('insert operation successfull');
        insert cnt;   
    }

    public static void updateOpps() {
        List<Opportunity> oppList = [select description from opportunity order by amount desc nulls last limit 10];
        for (opportunity eachOpp : oppList) {
            eachOpp.Description = 'This is one of the top 10 opportunity. Please work on this properly';
        }
        System.debug('update operation succesfull');
        update oppList;
    }

    public static list<opportunity> createNOpps(integer n, ID accId) {
        Account acc = [select name, annualRevenue from account where Id = :accID ];
        List<Opportunity> oppList;
        if (n > 0) {
            oppList = new List<Opportunity>();
            for (Integer i = 0; i < n; i++) {
                opportunity opp = new Opportunity();
                opp.AccountId = accId;
                opp.CloseDate = date.today().addYears(3);
                opp.StageName = 'Prospecting';
                opp.Name = acc.Name;
                if (acc.AnnualRevenue != null) {
                    opp.Amount = acc.AnnualRevenue/n;
                }
                oppList.add(opp);
            }
            insert oppList;
        } else {
            System.debug('Please tell us how many opportunities needs to be created');
        }
        return oppList;
    }

    public static void accWithNoCon(){
        list<Account> accList = [select Id, name from Account where Id not In (select AccountId from Contact)];
        List<Contact> conList = new List<Contact>();
        for (Account eachAcc : accList){
            Contact cnt = new Contact();
            cnt.LastName = eachAcc.Name;
            cnt.AccountId = eachAcc.id;
            conList.add(cnt);
        }
        if (!conList.isEmpty()){
            insert conList;
        }     
    }

    public static void deleteAllOpp(){
        List<Opportunity> listOpp = [select Id, name, amount, stageName from Opportunity where Amount < 20000 and stageName = 'Closed Lost'];
        if (!listOpp.isEmpty()){
            delete listOpp;
        } else {
         system.debug('List is empty');
        }
     }
    
}
