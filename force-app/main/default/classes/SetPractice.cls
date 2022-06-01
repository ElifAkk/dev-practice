public class SetPractice {
    public void setMethod(){
        Set<string> uniqueNameSet = new Set<string>{'Tom', 'Jerry'};

        System.debug('Size of the set: ' + uniqueNameSet);
        uniqueNameSet.add('Jack');
        uniqueNameSet.add('Jane');
        System.debug('Does the set contain my name?: ' + uniqueNameSet.contains('Elif'));
        System.debug('Is the set empty?: ' + uniqueNameSet.isEmpty());

        uniqueNameSet.clear();
        System.debug('Is the set empty?: ' + uniqueNameSet.isEmpty());
    }

    
}
