public class ValidateAddress {
    public void validateHomeAddress() {
        string houseName = 'Home';
        string streetName = 'Sunrise';
        string cityName = 'Dallas';
        string stateName = 'Tx';
        string stateIsoCode = 'Tx-usa';
        string countryName = 'USA';
        string countryIsoCode = 'Tx';
        
        integer lengthStreetName =streetName.length();
        system.debug('Length of street name is: ' + lengthStreetName);

        boolean containsHouseName = streetName.contains(houseName);
        system.debug(containsHouseName);

        boolean containsIsoCode = streetName.contains(stateIsoCode);
        system.debug('Is street name contain state Iso Code? ' + containsIsoCode);

        string upStateIsoCode = stateIsoCode.toUpperCase();
        system.debug(upStateIsoCode);


        string upCountryIsoCode = countryIsoCode.toUpperCase();
        system.debug(upCountryIsoCode);


        string upCountryName = countryName.toUpperCase();
        system.debug(upCountryName);


        string lowCityName  = cityName.toLowerCase();
        system.debug(lowCityName);


        string lowStateName = stateName.toLowerCase();
        system.debug(lowStateName);


        string allName = houseName + ' ' + streetName;
        system.debug(allName);


    }
}