package unit;

public class CalculatorException extends Exception{
    private String message;
    public CalculatorException(String message){
        super(message);
    }
}
