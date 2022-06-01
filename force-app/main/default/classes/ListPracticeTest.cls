@isTest
public class ListPracticeTest {
    @isTest
    private static void planetTestPositive() {
        ListPractice lp = new ListPractice();
        string msg = lp.addPlanet('Mars', 4, 2);
        string msg2 = lp.addPlanet('Earth', 3, 1);

        system.assertEquals('Planet added successfully', msg);   
        system.assertEquals(2, ListPractice.planetsList.size());
    }
    @isTest
    private static void planetTestNegative() {
        ListPractice lp = new ListPractice();
        string msg = lp.addPlanet('', 4, 2);

        system.assertEquals('Planet without name can not be added to the list', msg);   
    }
}
