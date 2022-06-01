@isTest
public class OperationsHelperTest {
    @isTest
    private static void largestNumberTest() {
        OperationsHelper opp = new OperationsHelper();
        Decimal num1 = opp.largestOutOfTwoNumbers(3, 7);
        Decimal num2 = opp.largestOutOfTwoNumbers(10, 5);
        system.assertEquals(7, num1);
        system.assertEquals(10, num2);
    }
    @isTest
    private static void smallestNumberTest() {
        OperationsHelper opp = new OperationsHelper();
        Decimal num1 = opp.smallestOutOfThreeNumbers(3, 5, 6);
        Decimal num2 = opp.smallestOutOfThreeNumbers(6, 1, 7);
        Decimal num3 = opp.smallestOutOfThreeNumbers(6, 9, 2);
        system.assertEquals(3, num1);
        system.assertEquals(1, num2);
        system.assertEquals(2, num3);   
    }
    @isTest
    private static void sumTest() {
        OperationsHelper opp = new OperationsHelper();
        integer sumOfNegative = opp.sumofPositiveIntegers(-5);
        integer sumOfPositive = opp.sumofPositiveIntegers(5);

        system.assertEquals(null, sumOfNegative);
        system.assertEquals(15, sumOfPositive);       
    }
    @isTest
    private static void sumTest2() {
        OperationsHelper opp = new OperationsHelper();
        integer sum = opp.sumofPositiveIntegers(3, 5);
        system.assertEquals(12, sum);      
    }
    @isTest
    private static void sumList() {
        OperationsHelper opp = new OperationsHelper();
        List<decimal> decList = new List<decimal>();
        Decimal sum = opp.sumofListValues(decList);
        system.assertEquals(null, sum);
        
        decList.add(3.5);
        decList.add(2.6);
        sum = opp.sumofListValues(decList);
        system.assertEquals(6.1, sum);
    }
    @isTest
    private static void averageOfListValuesTest() {
        OperationsHelper opp = new OperationsHelper();
        List<decimal> decimalList = new List<decimal>();
        Decimal average = opp.averageOfListValues(decimalList);
        system.assertEquals(null, average);

        decimalList.add(3.6);
        decimalList.add(2.4);
        average = opp.averageOfListValues(decimalList);
        system.assertEquals(3, average);  
    }
    @isTest
    private static void highestOfListValuesTest() {
        OperationsHelper opp = new OperationsHelper();
        List<decimal> highList = new List<decimal>();
        Decimal highestValue = opp.highestOfListValues(highList);
        system.assertEquals(null, highestValue);

        highList.add(6.9);
        highList.add(7);
        highList.add(2.3);
        highestValue = opp.highestOfListValues(highList);
        system.assertEquals(7, highestValue); 
    }

    @isTest
    private static void lowestOfListValuesTest() {
        OperationsHelper opp = new OperationsHelper();
        List<decimal> lowestList = new List<decimal>();
        Decimal lowestValue = opp.lowestOfListValues(lowestList);
        system.assertEquals(null, lowestValue);

        lowestList.add(5);
        lowestList.add(3.5);
        lowestList.add(12);
        lowestValue = opp.lowestOfListValues(lowestList);
        system.assertEquals(3.5, lowestValue);
    }
    @isTest
    private static void reverseOrderPrintTest() {
        OperationsHelper opp = new OperationsHelper();
        List<Object> objList = new List<Object>();
        opp.reverseOrderPrint(objList);

        objList.add(10);
        objList.add(5);
        objList.add(2);
        opp.reverseOrderPrint(objList);
        
    }
}
