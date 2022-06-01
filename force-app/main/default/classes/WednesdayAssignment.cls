public class WednesdayAssignment {
    public static void Question1() {

//Show the message as 'Case origin is changed for [Case Number]' whenever case origin field 
// value is changed.
        List<Opportunity> OppList = [select id, name, Account.AnnualRevenue from Opportunity where Account.AnnualRevenue > 5000 order by Account.AnnualRevenue DESC];

        for (Opportunity eachOp : OppList) {
            System.debug(eachOp);
        }
    }

    public static void Question2() {

        // Find all the contact records which have their last name starting from any vowel (a, e, I, o or u).

        List<Contact> listCont = [select LastName from Contact where LastName like 'a%' or LastName like 'e%' or LastName like 'i%' or LastName like 'o%' or LastName like 'u%'];

        for (Contact eachCont : listCont) {
            System.debug(eachCont);
        }  
    }

    public static void question3() {
        //Find the total number of opportunities for each stageName.
        List<AggregateResult> countOpp = [select stageName, sum(amount), count(ID) from opportunity group by stagename];
        for (AggregateResult eachRow : countOpp) {
            System.debug(eachRow);
        }
    }
    public static void question4() {
        //Find out the maximum Annual revenue field value out of all the accounts and group the annual
        // revenue field value based on AccountSource
        List<AggregateResult> countAcc = [select sum(AnnualRevenue), type from account group by type  order by sum(AnnualRevenue) desc nulls last];
        for (AggregateResult eachRow : countAcc) {
            System.debug(eachRow);
        }
    }
}
