public class PlayingWithDates {
    public void printDateOutput() {
        Date todaysDate = Date.today();
        System.debug(todaysDate);

        Date date1 = Date.newInstance(2789, 11, 5);
        System.debug(date1);

        Date date2 = Date.newInstance(1459, 3, 4);
        System.debug(date2);

        Integer dayInt = 10;
        Integer monthInt = 4;
        Integer yearInt = 2022;

        Date date3 = Date.newInstance(yearInt, MonthInt, dayInt);
        System.debug(date3);
    }
}