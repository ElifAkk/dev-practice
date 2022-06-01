public class ColorList {
    public static void colorNames() {
        List<String> colorsList = new List<String>();
        colorsList.add('Blue');
        colorsList.add('Red');
        colorsList.add('Yellow');
        colorsList.add('Green');
        colorsList.add('Purple');
        colorsList.add('White');
        colorsList.add('Black');

        System.debug('Color list: ' + colorsList);

        Integer lengthOfList = colorsList.size();
        System.debug('Length of colors list is ' + lengthOfList);
        Boolean hasRed = colorsList.contains('Red');
        if (hasRed) {
            System.debug('Color list contains Red');
        }else {
            System.debug('Color list does not contain Red');
        }  
        String lastInUpper = colorsList[lengthOfList-1].toUpperCase();
        System.debug('Last element of list in the uppercase: ' + lastInUpper);  

        String forthInUpper = colorsList[3].toUpperCase();
        System.debug('Forth element of list in the uppercase: ' + forthInUpper);  
        
        List<string> colorCodeList = new List<string>{'#0000FF', '#FF0000', '#FFFF00', '#008000', '#800080', '#FFFFFF', '#000000'};
        System.debug('List of color codes: ' + colorCodeList);

        Boolean areListdEqual = colorsList.equals(colorCodeList);
        System.debug('Are two lists equal: ' + areListdEqual);

        List<string> mergedList = new List<string>();
        mergedList.addAll(colorsList);
        mergedList.addAll(colorCodeList);
        System.debug('Our Merged List: ' + mergedList);
    }
}
