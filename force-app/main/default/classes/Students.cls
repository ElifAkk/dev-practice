public class Students {
    public string firstName;
    public string lastName;
    public string classYear;
    public string major;

    public string generateReport(){
        string report = 'Report Generated for ' + firstName + ' ' + lastName + ' of ' + classYear;
        System.debug(report);
        return major;
    }   
}
