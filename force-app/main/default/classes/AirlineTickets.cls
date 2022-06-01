public class AirlineTickets {
    
    public string departureCity;
    public string arrivalCity;
    public string flightNumber;
    public string seatAssignment;

    public void printTicket(){
        System.debug('This ticket is for the journey from ' + departureCity + ' to ' + arrivalCity);
    } 

}
