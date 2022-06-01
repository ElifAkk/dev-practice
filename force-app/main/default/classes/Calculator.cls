public class Calculator {
    public decimal dynamicCalulationMethod(Decimal num1, Decimal num2, String operation){
        Decimal result;
        if (operation == 'addition') {
            result = num1 + num2;
        }else if (operation == 'substraction') {
            result = num1 - num2;
        }else if (operation == 'division') {
            result = num1 / num2;
        }else if (operation == 'multiplication') {
            result = num1 * num2;
        }else {
            System.debug('Hatali islem girdiniz...');
        }
        return result;
    }
}